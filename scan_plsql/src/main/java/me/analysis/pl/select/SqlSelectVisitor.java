package me.analysis.pl.select;

import me.analysis.pl.select.model.*;
import me.analysis.sql.SqlBaseVisitor;
import me.analysis.sql.SqlParser;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.tree.ParseTree;

public class SqlSelectVisitor extends SqlBaseVisitor<Void> {

    private SqlSelect currentSelect;
    public SqlSelectVisitor(SqlSelect select) {
        this.currentSelect = select;
    }

    @Override
    public Void visitSelect_stmt(SqlParser.Select_stmtContext ctx) {
        System.out.println("visitSelect_stmt");
        return super.visitSelect_stmt(ctx);
    }

    @Override
    public Void visitSelect_or_values(SqlParser.Select_or_valuesContext ctx) {
        System.out.println("visitSelect_or_values");
        return super.visitSelect_or_values(ctx);
    }

    @Override
    public Void visitSelect_core(SqlParser.Select_coreContext ctx) {
        System.out.println("visitSelect_core");
        //buildWhere(ctx);
        return super.visitSelect_core(ctx);
    }


    private Either<TableColumn,String> buildConditionColumn(ParseTree tree) {
        if(tree.getChild(2) != null){
            TableColumn condition = new TableColumn(tree.getChild(0).getText(), tree.getChild(2).getText());
            return Either.left(condition);
        }else {
            return Either.right(tree.getChild(0).getText());
        }
    }

    private boolean isConditionExpr(ParseTree tree) {
        return tree.getChild(0) instanceof SqlParser.Table_nameContext;
    }

    private SqlParser.ExprContext findConditionExpr(ParseTree tree) {
        if(tree.getChild(0) instanceof SqlParser.Table_nameContext) {
            return (SqlParser.ExprContext)tree;
        } else {
            for (int i = 0; i < tree.getChildCount(); i++) {
                ParseTree c = findConditionExpr(tree.getChild(i));
                if(c != null){
                    return (SqlParser.ExprContext)c;
                }
            }
            return null;
        }
    }

    @Override
    public Void visitResult_column(SqlParser.Result_columnContext ctx) {
        try {
            for (int i = 0; i < ctx.getChildCount(); i++) {
                ParseTree child = ctx.getChild(i);
                if(child instanceof SqlParser.ExprContext) {
                    SqlParser.ExprContext expr = (SqlParser.ExprContext) child;
                    ResultColumn col;
                    if (expr.getChildCount() > 1) {
                        col = new ResultColumn(expr.getChild(0).getText(), expr.getChild(2).getText());
                    } else {
                        col = new ResultColumn(expr.getChild(0).getText());
                    }
                    currentSelect.addResultColumn(col);
                } else {
                    System.err.println("Ignore: " + child.getText());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return super.visitChildren(ctx);
    }

    @Override
    public Void visitTable_or_subquery(SqlParser.Table_or_subqueryContext ctx) {
        ParseTree child = ctx.getChild(0);
        if(child instanceof SqlParser.Table_nameContext) {
            Table t;
            if(ctx.getChildCount() > 1){
                 t = new Table(ctx.getChild(0).getText(),ctx.getChild(1).getText());
            }else{
                t = new Table(ctx.getChild(0).getText());
            }
            currentSelect.addTableOrSubSelect(Either.left(t));
        }
        System.out.println("visitTable_or_subquery");
        return super.visitChildren(ctx);
    }

    @Override public Void visitExpr(SqlParser.ExprContext ctx) {
        //result, from, where
        ParseTree parent = ctx.getParent();
        if(parent instanceof SqlParser.Result_columnContext) {
            System.out.println(ctx.getText());
        }
        if(parent instanceof SqlParser.Select_coreContext) {
            //this is main where
            System.out.println("visitExpr SqlParser.Select_coreContext");
        }
        if(parent instanceof SqlParser.Select_or_valuesContext) {
            //this is where under where:
            System.out.println("visitExpr SqlParser.Select_or_valuesContext");
        }
        return super.visitChildren(ctx);
    }

    @Override public Void visitTable_name(SqlParser.Table_nameContext ctx) {

        return super.visitChildren(ctx);
    }

    private ConditionExpr buildConditionExpr(SqlParser.ExprContext expr) {
        String op = expr.getChild(1).getText();
        if("and".equalsIgnoreCase(op)){
            if(expr.getParent() instanceof SqlParser.ExprContext) {
                SqlParser.ExprContext parent = (SqlParser.ExprContext) expr.getParent();
                Either<TableColumn,String> a = buildConditionColumn(expr.getChild(2));
                String _op = parent.getChild(1).getText();
                StringBuffer sb = new StringBuffer();
                for (int i = 2; i < parent.getChildCount(); i++) {
                    sb.append(parent.getChild(i).getText());
                }
                return ConditionExpr.create(a,Either.right(sb.toString()),_op);
            }
        }
        Either<TableColumn,String> a = buildConditionColumn(expr.getChild(0));
        Either<TableColumn,String> b = buildConditionColumn(expr.getChild(2));
        return ConditionExpr.create(a,b,op);
    }

    @Override public Void visitColumn_name(SqlParser.Column_nameContext ctx) {
        if(isWhereCondition(ctx)) {
            RuleContext parent = ctx.parent;
            currentSelect.addCondition(buildConditionExpr((SqlParser.ExprContext) parent.parent));
        }
        return super.visitChildren(ctx);
    }

    private boolean isWhereCondition(ParseTree child) {
        if(child instanceof SqlParser.Result_columnContext
                || child instanceof SqlParser.Table_or_subqueryContext){
            return false;
        }
        if(child instanceof SqlParser.Select_or_valuesContext
                || child instanceof SqlParser.Select_coreContext){
            return true;
        } else {
            ParseTree parent = child.getParent();
            return parent != null && isWhereCondition(parent);
        }
    }

}
