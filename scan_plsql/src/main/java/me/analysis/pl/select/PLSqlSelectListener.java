package me.analysis.pl.select;

import me.analysis.pl.generated.PlSqlBaseListener;
import me.analysis.pl.generated.PlSqlParser;
import me.analysis.pl.select.model.*;
import org.antlr.v4.runtime.tree.ParseTree;

import java.util.ArrayList;
import java.util.List;

public class PLSqlSelectListener extends PlSqlBaseListener {
    private SqlSelect select;
    private List<ResultColumn> notableResultColumns = new ArrayList<>();
    private String currentNoAliasTableName;

    public PLSqlSelectListener(SqlSelect select){
        this.select = select;
    }

    private SelectStage stage;

    @Override
    public void enterSubquery(PlSqlParser.SubqueryContext ctx) {
        System.out.println(ctx.getText());
        super.enterSubquery(ctx);
    }

    @Override public void enterSelect_statement(PlSqlParser.Select_statementContext ctx) {
        System.out.println(ctx.getText());
    }

    @Override public void exitSelect_statement(PlSqlParser.Select_statementContext ctx) {
        if(!notableResultColumns.isEmpty()) {
            System.err.println("notableResultColumns is not empty. " + notableResultColumns);
        }

    }

    @Override public void enterSelect_list_elements(PlSqlParser.Select_list_elementsContext ctx) {
        stage = SelectStage.SELECT_LIST;

    }
    @Override public void enterFrom_clause(PlSqlParser.From_clauseContext ctx) {
        stage = SelectStage.SELECT_FROM;
    }

    @Override public void enterWhere_clause(PlSqlParser.Where_clauseContext ctx) {
        stage = SelectStage.SELECT_WHERE;
    }


    @Override public void enterTable_ref_list(PlSqlParser.Table_ref_listContext ctx) {
        switch (stage) {
            case SELECT_FROM:
                stage = SelectStage.SELECT_FROM_LIST;
                break;
            default:
                System.err.println("enterTable_ref_list: " + ctx.getText());
        }
    }

    @Override public void enterLogical_and_expression(PlSqlParser.Logical_and_expressionContext ctx) {
        switch (stage) {
            case SELECT_WHERE:
                stage = SelectStage.SELECT_WHERE_EXPRESSION;
                break;
            default:
                System.err.println("enterLogical_and_expression: " + ctx.getText());
        }
    }

    @Override public void enterCollection_name(PlSqlParser.Collection_nameContext ctx) {
        try {
            switch (stage) {
                case SELECT_LIST:
                    ResultColumn rc = buildResultColumn(ctx);
                    select.addResultColumn(rc);
                    break;
                default:
                    System.out.println("enterCollection_name: " + ctx.getText());
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    private ResultColumn buildResultColumn(PlSqlParser.Collection_nameContext ctx) throws Exception {
        if(ctx.getChildCount() == 1) {
            ResultColumn resultColumn = new ResultColumn(null, ctx.getChild(0).getText());
            notableResultColumns.add(resultColumn);
            return resultColumn;
        } else if(ctx.getChildCount() == 3) {
            return new ResultColumn(ctx.getChild(0).getText(),ctx.getChild(2).getText());
        } else {
            System.err.println("buildResultColumn unkown child count:"+ctx.getChildCount()+"\n"+ctx.getText());
            throw new Exception("buildResultColumn unkown child count:"+ctx.getChildCount()+"\n"+ctx.getText());
        }
    }

    @Override public void enterTable_ref_aux(PlSqlParser.Table_ref_auxContext ctx) {
        switch (stage){
            case SELECT_FROM_LIST:
                Table t = buildFromTable(ctx);
                select.addFromTable(t);
                break;
            default:
                System.err.println("enterTable_ref_aux unkown stage: " + ctx.getText());

        }

    }

    private Table buildFromTable(PlSqlParser.Table_ref_auxContext ctx) {
        if(ctx.getChildCount() == 1) {
            String name = ctx.getChild(0).getText();
            currentNoAliasTableName = name;
            for(ResultColumn rc: notableResultColumns) {
                rc.setTableName(name);
            }
            notableResultColumns.clear();
            return new Table(name);
        } else {
            return new Table(ctx.getChild(0).getText(),ctx.getChild(1).getText());
        }
    }

    @Override public void enterRelational_expression(PlSqlParser.Relational_expressionContext ctx) {
        try {
            switch (stage) {
                case SELECT_WHERE_EXPRESSION:
                    if(ctx.getChildCount() == 3){
                        String op = ctx.getChild(1).getText();
                        Either<TableColumn, String> a = buildWhereTableColumn(ctx.getChild(0));
                        Either<TableColumn, String> b = buildWhereTableColumn(ctx.getChild(2));
                        ConditionExpr conditionExpr = ConditionExpr.create(a, b, op);
                        select.addCondition(conditionExpr);
                    } else {
                        System.err.println("enterRelational_expression child count: " + ctx.getChildCount() + "\n"+ctx.getText());
                    }
                    break;
                default:
                    System.err.println("enterRelational_expression unkown stage: " + ctx.getText());
            }
        }catch (Exception e) {
             e.printStackTrace();
            throw e;
        }
    }

    private Either<TableColumn,String> buildWhereTableColumn(ParseTree child) {
        //System.out.println("buildWhereTableColumn:\t"+child.getText() + " @" + child.getClass().getCanonicalName());
        if(child instanceof PlSqlParser.General_element_partContext) {
            if(child.getChildCount() == 1) {
                TableColumn tableColumn = new TableColumn(child.getChild(0).getText());
                tableColumn.setTableName(currentNoAliasTableName);
                return Either.left(tableColumn);
            } else {
                return Either.left(new TableColumn(child.getChild(0).getText(),child.getChild(2).getText()));
            }
        } else if(child instanceof PlSqlParser.ConstantContext || child instanceof PlSqlParser.Bind_variableContext){
            return Either.right(child.getText());
        } else if(child instanceof PlSqlParser.AtomContext && child.getChild(1) instanceof PlSqlParser.Outer_join_signContext){
            PlSqlParser.Table_elementContext te = (PlSqlParser.Table_elementContext)child.getChild(0);
            String table = te.getChild(0).getText();
            String column = te.getChild(2).getText();
            TableColumn tableColumn = new TableColumn(table, column+child.getChild(1).getText());
            return Either.left(tableColumn);
        }else if(child instanceof PlSqlParser.Standard_functionContext){
            System.out.println(child.getText());
            return buildWhereTableColumn(child.getChild(0).getChild(0).getChild(2));
        }else if(child instanceof PlSqlParser.Collection_nameContext){
            return Either.left(new TableColumn(child.getChild(0).getText(),child.getChild(2).getText()));
        } else {
            return buildWhereTableColumn(child.getChild(0));
        }
    }

    enum SelectStage{
        SELECT_LIST,SELECT_FROM,SELECT_FROM_LIST,
        SELECT_WHERE,SELECT_WHERE_EXPRESSION
    }

}
