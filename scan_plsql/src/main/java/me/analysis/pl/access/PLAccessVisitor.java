package me.analysis.pl.access;

import me.analysis.pl.PlSqlParserContextNameUtil;
import me.analysis.pl.generated.PlSqlBaseVisitor;
import me.analysis.pl.generated.PlSqlParser;
import org.antlr.v4.runtime.tree.ParseTree;

import java.util.List;
import java.util.Set;
import java.util.stream.Stream;

public class PLAccessVisitor extends PlSqlBaseVisitor<Void> {

    private Set<PLProcedureAccess> procedures;
    private PLProcedureAccess procedure = new PLProcedureAccess();
    private String pkg;
    private String src;

    public PLAccessVisitor(Set<PLProcedureAccess> procedures, String file) {
        this.procedures = procedures;
        this.src = file;
    }

    @Override
    public Void visitCreate_procedure_body(PlSqlParser.Create_procedure_bodyContext ctx) {
        //System.out.println(ctx.getText() + ": " + ctx.getClass());
        //System.out.println("Procedure: " + getProcedureName(ctx));
        procedure = new PLProcedureAccess();
        procedure.setType("Procedure");
        procedure.setSrc(src);
        procedures.add(procedure);
        procedure.setPkg(pkg);
        procedure.setName(PlSqlParserContextNameUtil.getProcedureName(ctx));
        procedure.setStartline(ctx.start.getLine());
        procedure.setStopline(ctx.stop.getLine());
        return super.visitChildren(ctx);
    }

    @Override
    public Void visitProcedure_spec(PlSqlParser.Procedure_specContext ctx) {
        String name = ctx.procedure_name().getText();
        System.out.println("visitProcedure_spec: " + name);
        return super.visitProcedure_spec(ctx);
    }

    @Override
    public Void visitCreate_package(PlSqlParser.Create_packageContext ctx) {
        PlSqlParser.Package_bodyContext package_bodyContext = ctx.package_body();
        if(package_bodyContext != null) {
            List<PlSqlParser.Package_nameContext> package_nameContexts = package_bodyContext.package_name();
            pkg = package_nameContexts.stream().findFirst().get().getText();
        }
        PlSqlParser.Package_specContext package_specContext = ctx.package_spec();
        if(package_specContext != null){
            List<PlSqlParser.Package_nameContext> package_nameContexts = package_specContext.package_name();
            pkg = package_nameContexts.stream().findFirst().get().getText();
        }
        return super.visitCreate_package(ctx);
    }


    @Override
    public Void visitCreate_function_body(PlSqlParser.Create_function_bodyContext ctx) {
        procedure = new PLProcedureAccess();
        procedure.setType("Function");
        procedure.setSrc(src);
        procedures.add(procedure);
        procedure.setPkg(pkg);
        procedure.setName(PlSqlParserContextNameUtil.getFunctionName(ctx));
        procedure.setStartline(ctx.start.getLine());
        procedure.setStopline(ctx.stop.getLine());
        return super.visitChildren(ctx);
    }

    @Override
    public Void visitCreate_trigger(PlSqlParser.Create_triggerContext ctx) {
        procedure = new PLProcedureAccess();
        procedure.setType("Trigger");
        procedure.setSrc(src);
        procedures.add(procedure);
        procedure.setPkg(pkg);
        procedure.setName(getTriggerName(ctx));
        procedure.setStartline(ctx.start.getLine());
        procedure.setStopline(ctx.stop.getLine());
        return super.visitChildren(ctx);
    }

    private String getPackageName(PlSqlParser.Create_triggerContext ctx) {
        return ctx.parent.parent.getChild(1).getText();
    }

    private String getTriggerName(PlSqlParser.Create_triggerContext ctx) {
        for (ParseTree tree : ctx.children) {
            if (tree instanceof PlSqlParser.Trigger_nameContext) {
                return tree.getText();
            }
        }
        return ctx.getChild(0).getChild(1).getText();
    }

    @Override
    public Void visitFunction_call(PlSqlParser.Function_callContext ctx) {
        procedure.addFunctionCall(PlSqlParserContextNameUtil.getFunctionName(ctx));
        return super.visitChildren(ctx);
    }

    @Override
    public Void visitSql_statement(PlSqlParser.Sql_statementContext ctx) {
        //System.out.println(ctx.getText() + ": " + ctx.getClass());
        return super.visitChildren(ctx);
    }

    @Override
    public Void visitQuery_block(PlSqlParser.Query_blockContext ctx) {
//        if (procedure == null) {
//            System.out.println(ctx.getText() + ": " + ctx.getClass());
//            System.out.println("child is null");
//            return super.visitChildren(ctx);
//        }
//        for (String t : PlSqlParserContextNameUtil.getSelectFromTable(ctx).values()) {
//            procedure.addQueryTable(t);
//        }
//        for (String c : PlSqlParserContextNameUtil.getSelectColumns(ctx)) {
//            procedure.addQueryColumn(c);
//        }
        return super.visitChildren(ctx);
    }

    @Override
    public Void visitTable_ref_list(PlSqlParser.Table_ref_listContext ctx) {
        Stream<String> tables = ctx.table_ref().stream().map(v -> getTableRefContextName(v));
        tables.filter(t -> t != null).forEach(t -> procedure.addQueryTable(t));
        return super.visitTable_ref_list(ctx);
    }

    private String getTableRefContextName(PlSqlParser.Table_refContext table_ref) {
        PlSqlParser.Table_ref_auxContext table_ref_auxContext = table_ref.table_ref_aux();
        PlSqlParser.Dml_table_expression_clauseContext dml_table_expression_clauseContext = table_ref_auxContext.dml_table_expression_clause();
        if(dml_table_expression_clauseContext == null) {
            System.err.println("PLAccessVisitor.getTableRefContextName.table_ref_auxContext:\t" + table_ref_auxContext.getText());
            return null;
        }
        PlSqlParser.Tableview_nameContext tableview_nameContext = dml_table_expression_clauseContext.tableview_name();
        if(tableview_nameContext == null) {
            System.err.println("PLAccessVisitor.getTableRefContextName.dml_table_expression_clauseContext:\t" + dml_table_expression_clauseContext.getText());
            return null;
        }
        PlSqlParser.IdContext id = tableview_nameContext.id();
        return id.getText();
    }

    @Override
    public Void visitDelete_statement(PlSqlParser.Delete_statementContext ctx) {
        try{
            String deleteTable = PlSqlParserContextNameUtil.getDeleteTable(ctx);
            procedure.addDeleteTables(deleteTable);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println(ctx.getText());
            throw e;
        }

        return super.visitChildren(ctx);
    }

    @Override
    public Void visitInsert_statement(PlSqlParser.Insert_statementContext ctx) {
        String insertTable = PlSqlParserContextNameUtil.getInsertTable(ctx);
        procedure.addInsertTable(insertTable);
        return super.visitChildren(ctx);
    }

    @Override
    public Void visitUpdate_statement(PlSqlParser.Update_statementContext ctx) {
        String updateTable = PlSqlParserContextNameUtil.getUpdateTable(ctx);
        procedure.addUpdateTable(updateTable);
        for (String c : PlSqlParserContextNameUtil.getUpdateColumns(ctx)) {
            procedure.addUpdateColumn(c);
        }
        return super.visitUpdate_statement(ctx);
    }

}
