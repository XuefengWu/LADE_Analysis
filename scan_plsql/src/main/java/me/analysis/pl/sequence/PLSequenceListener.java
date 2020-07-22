package me.analysis.pl.sequence;

import me.analysis.pl.PlSqlParserContextNameUtil;
import me.analysis.pl.generated.PlSqlBaseListener;
import me.analysis.pl.generated.PlSqlParser;

import java.util.Arrays;
import java.util.List;

public class PLSequenceListener extends PlSqlBaseListener {

    private String stackCounter = "0";
    private final List<PLProcedureSequence> procedures;
    private PLProcedureSequence currentProcedure;

    public PLSequenceListener(List<PLProcedureSequence> procedures) {
        this.procedures = procedures;
    }

    @Override
    public void enterCall_spec(PlSqlParser.Call_specContext ctx) {
        System.out.println(ctx.getText() + " @" + ctx.getClass());
        super.enterCall_spec(ctx);
    }

    @Override
    public void enterCreate_procedure_body(PlSqlParser.Create_procedure_bodyContext ctx) {
        //System.out.println(ctx.getText() + " @" + ctx.getClass());
        System.out.println(ctx.getChild(0).getChild(1).getText());
        stackCounter = "0";
        System.out.println(stackCounter);
        currentProcedure = new PLProcedureSequence();
        procedures.add(currentProcedure);
        currentProcedure.setPkg(PlSqlParserContextNameUtil.getPackageName(ctx));
        currentProcedure.setName(PlSqlParserContextNameUtil.getProcedureName(ctx));
        currentProcedure.setType("Procedure");
        currentProcedure.setStartLine(ctx.start.getLine());
        currentProcedure.setStopLine(ctx.stop.getLine());
        super.enterCreate_procedure_body(ctx);
    }

    @Override
    public void enterCreate_function_body(PlSqlParser.Create_function_bodyContext ctx) {
        stackCounter = "0";
        System.out.println(stackCounter);
        currentProcedure = new PLProcedureSequence();
        procedures.add(currentProcedure);
        currentProcedure.setPkg(PlSqlParserContextNameUtil.getPackageName(ctx));
        currentProcedure.setName(PlSqlParserContextNameUtil.getFunctionName(ctx));
        currentProcedure.setType("Function");
    }

    @Override
    public void enterIf_statement(PlSqlParser.If_statementContext ctx) {
        System.out.println(ctx.getText() + " @" + ctx.getClass());
        addStepSeq();
        PLProcedureSequence.Step step = currentProcedure.createStep(stackCounter,
                PLProcedureSequence.Step.EXECUTE, PLProcedureSequence.Step.IF,
                ctx.getText().length(),ctx.start.getLine(),PlSqlParserContextNameUtil.getCondition(ctx));
        currentProcedure.addStep(step);
        enter();
        PLProcedureSequence.Step stepThen = currentProcedure.createStep(stackCounter,
                PLProcedureSequence.Step.EXECUTE, PLProcedureSequence.Step.THEN,ctx.getText().length(),ctx.start.getLine());
        currentProcedure.addStep(stepThen);
        System.out.println(stackCounter);
    }

    @Override public void enterElse_part(PlSqlParser.Else_partContext ctx) {
        PLProcedureSequence.Step step = currentProcedure.createStep(stackCounter,
                PLProcedureSequence.Step.EXECUTE, PLProcedureSequence.Step.ELSE,ctx.getText().length(),ctx.start.getLine());
        currentProcedure.addStep(step);
    }
    @Override public void exitElse_part(PlSqlParser.Else_partContext ctx) { }
    @Override public void enterElsif_part(PlSqlParser.Elsif_partContext ctx) {
        PLProcedureSequence.Step step = currentProcedure.createStep(stackCounter,
                PLProcedureSequence.Step.EXECUTE, PLProcedureSequence.Step.ELSE_IF,
                ctx.getText().length(),ctx.start.getLine(),PlSqlParserContextNameUtil.getCondition(ctx));
        currentProcedure.addStep(step);
    }
    @Override public void exitElsif_part(PlSqlParser.Elsif_partContext ctx) { }

    @Override
    public void exitIf_statement(PlSqlParser.If_statementContext ctx) {
        System.out.println(ctx.getText() + " @" + ctx.getClass());
        leave();
        System.out.println(stackCounter);
    }

    @Override
    public void enterLoop_statement(PlSqlParser.Loop_statementContext ctx) {
        System.out.println(ctx.getText() + " @" + ctx.getClass());
        addStepSeq();
        PLProcedureSequence.Step step = currentProcedure.createStep(stackCounter,
                PLProcedureSequence.Step.EXECUTE, PLProcedureSequence.Step.LOOP,ctx.getText().length(),ctx.start.getLine());
        currentProcedure.addStep(step);
        enter();
        System.out.println(stackCounter);
    }

    @Override
    public void exitLoop_statement(PlSqlParser.Loop_statementContext ctx) {
        System.out.println(ctx.getText() + " @" + ctx.getClass());
        leave();
        System.out.println(stackCounter);
    }

    @Override
    public void enterForall_statement(PlSqlParser.Forall_statementContext ctx) {
        System.out.println(ctx.getText() + " @" + ctx.getClass());
        addStepSeq();
        PLProcedureSequence.Step step = currentProcedure.createStep(stackCounter,
                PLProcedureSequence.Step.EXECUTE, PLProcedureSequence.Step.FOREACH,ctx.getText().length(),ctx.start.getLine());
        currentProcedure.addStep(step);
        enter();
        System.out.println(stackCounter);
    }

    @Override
    public void exitForall_statement(PlSqlParser.Forall_statementContext ctx) {
        System.out.println(ctx.getText() + " @" + ctx.getClass());
        leave();
        System.out.println(stackCounter);
    }

    @Override
    public void enterFunction_call(PlSqlParser.Function_callContext ctx) {
        //System.out.println(ctx.getText() + " @" + ctx.getClass());
        addStepSeq();
        PLProcedureSequence.Step step = currentProcedure.createStep(stackCounter,
                PLProcedureSequence.Step.CALL, PlSqlParserContextNameUtil.getFunctionName(ctx),
                ctx.getText().length(),ctx.start.getLine(),PlSqlParserContextNameUtil.getFunctionArgs(ctx));
        currentProcedure.addStep(step);
        System.out.println(stackCounter);
    }

    @Override
    public void enterSql_statement(PlSqlParser.Sql_statementContext ctx) {
        //System.out.println(stackCounter);
    }

    @Override
    public void enterSelect_statement(PlSqlParser.Select_statementContext ctx) {

    }

    @Override
    public void enterQuery_block(PlSqlParser.Query_blockContext ctx) {
        addStepSeq();
        System.out.println(PLProcedureSequence.Step.READ +":"+stackCounter);
        for (String t : PlSqlParserContextNameUtil.getSelectFromTable(ctx).values()) {
            PLProcedureSequence.Step step = currentProcedure.createStep(stackCounter,
                    PLProcedureSequence.Step.READ, t,ctx.getText().length(),ctx.start.getLine(),
                    PlSqlParserContextNameUtil.getSelectColumns(ctx));
            currentProcedure.addStep(step);
        }
    }

    @Override
    public void enterUpdate_statement(PlSqlParser.Update_statementContext ctx) {
        addStepSeq();
        System.out.println(PLProcedureSequence.Step.UPDATE +":"+stackCounter);
        PLProcedureSequence.Step step = currentProcedure.createStep(stackCounter,
                PLProcedureSequence.Step.UPDATE, PlSqlParserContextNameUtil.getUpdateTable(ctx),ctx.getText().length(),
                ctx.start.getLine(),PlSqlParserContextNameUtil.getUpdateColumns(ctx));
        currentProcedure.addStep(step);
    }

    @Override
    public void enterInsert_statement(PlSqlParser.Insert_statementContext ctx) {
        addStepSeq();
        System.out.println(PLProcedureSequence.Step.INSERT +":"+ stackCounter);
        PLProcedureSequence.Step step = currentProcedure.createStep(stackCounter,
                PLProcedureSequence.Step.INSERT, PlSqlParserContextNameUtil.getInsertTable(ctx),
                ctx.getText().length(),ctx.start.getLine());
        currentProcedure.addStep(step);
    }

    @Override
    public void enterDelete_statement(PlSqlParser.Delete_statementContext ctx) {
        addStepSeq();
        System.out.println(stackCounter);
        PLProcedureSequence.Step step = currentProcedure.createStep(stackCounter,
                PLProcedureSequence.Step.DELETE, "Table",ctx.getText().length(),ctx.start.getLine());
        currentProcedure.addStep(step);
    }

    @Override
    public void enterCase_statement(PlSqlParser.Case_statementContext ctx) {
        System.out.println(ctx.getText() + " @" + ctx.getClass());
    }
    
    protected void addStepSeq() {
        String[] ss = stackCounter.split("\\.");
        System.out.println(stackCounter + " :" +Arrays.deepToString(ss));
        String counterStr = ss[ss.length - 1];
        int counter = Integer.valueOf(counterStr).intValue() + 1;
        String stack = "";
        for (int i = 0; i < ss.length -1; i++) {
            stack = stack + ss[i] + ".";
        }
        stackCounter = stack + counter;
    }

    private void enter() {
        stackCounter = stackCounter + ".0";
    }

    private void leave() {
        stackCounter = stackCounter.substring(0,stackCounter.length() - 2);
        System.out.println("leave :" + stackCounter);
    }

    public String getStackCounter() {
        return stackCounter;
    }

    protected void setStackCounter(String stackCounter) {
        this.stackCounter = stackCounter;
    }
}
