package me.analysis.pl.visitor;

import me.analysis.pl.PlSqlParserTree;
import me.analysis.pl.generated.PlSqlParser;
import me.analysis.pl.generated.PlSqlParser.Procedure_specContext;
import me.analysis.pl.utils.PlSqlUtils;
import org.antlr.v4.runtime.ParserRuleContext;

import java.util.HashMap;
import java.util.Map;


public class CallGraphVisitor extends PlSqlRuleVisitor {
    public enum ExpressionType {
        PACKAGE, FUNCTION, PROCEDURE, VARIABLE, UNKNOWN
    }

    public enum VisitMode {
        FIRST_PASS, SECOND_PASS
    }

    public VisitMode visitMode = VisitMode.FIRST_PASS;

    public static Map<String, ExpressionType> idMap = new HashMap<String, ExpressionType>();
    private String currentSchema = null;

    public CallGraphVisitor(PlSqlParserTree tree) {
        super(tree);
    }

    private void logContext(ParserRuleContext ctx) {
        System.out.printf("%04d > %s\n",ctx.start.getLine(), PlSqlUtils.getOriginalText(input, ctx));
    }

    private String getFullProcName(ParserRuleContext ctx) {
        ParserRuleContext c = ctx;

        String fullName = "";

        //fullName = ctx.getText();

        while (c != null) {
            if (c instanceof PlSqlParser.Function_specContext) {
                PlSqlParser.Function_specContext fc = (PlSqlParser.Function_specContext) c;
                fullName = PlSqlUtils.getOriginalText(input, fc.function_name()) + "->Type=FUNCTION:" + fullName;
            } else if (c instanceof Procedure_specContext) {
                Procedure_specContext pc = (Procedure_specContext) c;
                fullName = PlSqlUtils.getOriginalText(input, pc.procedure_name()) + "->Type=PROCEDURE:" + fullName;
            } else if (c instanceof PlSqlParser.Package_bodyContext) {
                PlSqlParser.Package_bodyContext pbc = (PlSqlParser.Package_bodyContext) c;
                // TODO: здесь индекс у списка пакетов!
                fullName = PlSqlUtils.getOriginalText(input, pbc.package_name(0)) + "->TYPE=PACKAGE:" + fullName;
                break;
            }
            c = c.getParent();
        }

        return fullName;
    }

    @Override
    public Void visitPackage_name(PlSqlParser.Package_nameContext ctx) {
//        if (visitMode == VisitMode.FIRST_PASS) {
//            String name = PlSqlUtils.getOriginalText(input, ctx);
//            System.out.println(PlSqlUtils.getLine(ctx) + " PACKAGE " + name);
//
//            currentSchema = PlSqlUtils.getOriginalText(input, ctx.schema_name());
//            System.out.println("  SCHEMA: " + currentSchema);
//
//            idMap.put(name, ExpressionType.PACKAGE);
//            //        logContext(ctx);
//        }
        System.out.println(ctx.getText());
        return super.visitPackage_name(ctx);
    }

    @Override
    public Void visitFunction_spec(PlSqlParser.Function_specContext ctx) {
        if (visitMode == VisitMode.FIRST_PASS) {
            String name = getFullProcName(ctx/*.function_name()*/);
            System.out.println(PlSqlUtils.getLine(ctx) + " FUNCTION " + name);

            idMap.put(name, ExpressionType.FUNCTION);
            //        logContext(ctx);
        }
        return super.visitFunction_spec(ctx);
    }

    @Override
    public Void visitProcedure_spec(Procedure_specContext ctx) {
        if (visitMode == VisitMode.FIRST_PASS) {
            String name = getFullProcName(ctx/*.procedure_name()*/);
            System.out.println(PlSqlUtils.getLine(ctx) + " PROCEDURE " + name);

            idMap.put(name, ExpressionType.PROCEDURE);
            //        logContext(ctx);
        }
        return super.visitProcedure_spec(ctx);
    }

    @Override
    public Void visitRoutine_clause(PlSqlParser.Routine_clauseContext ctx) {
        String name = getFullProcName(ctx.routine_name());
        System.out.println("-> call routine " + name);

        return super.visitRoutine_clause(ctx);
    }

    //    @Override
    //    public Void visitFunction_call(Function_callContext ctx) {
    //        //        String name = getFullProcName(ctx.routine_name());
    //        //        System.out.println("-> call " + name);
    //
    //        return super.visitFunction_call(ctx);
    //    }

    private boolean isFunctionOrProcedureSpec(PlSqlParser.Id_expressionContext ctx) {
        ParserRuleContext c = ctx;

        while (c != null) {
            if ((c instanceof PlSqlParser.Function_specContext) || (c instanceof Procedure_specContext)) {
                return true;
            } else if (c instanceof PlSqlParser.StatementContext) {
                return false;
            }
            c = c.getParent();
        }
        return false;
    }

    // здесь нужно отловить вызов функции
    // она должна быть или определена выше, или должен быть указан пакет, или это глобальная функция
    @Override
    public Void visitId_expression(PlSqlParser.Id_expressionContext ctx) {
        if (visitMode == VisitMode.SECOND_PASS) {
            String name = getFullProcName(ctx);
            logContext(ctx);

            // если в хеше есть определение, то это может быть вызов функции
            ExpressionType type = idMap.get(name);
            //System.out.println("  // " + name + " type " + type);

            if ((type == ExpressionType.FUNCTION) || (type == ExpressionType.PROCEDURE)) {
                // вызов функции, которая попадалась ранее
                if (!isFunctionOrProcedureSpec(ctx)) {
                    System.out.printf("\t->> call [%s]\n", name);
                }
            } else if (type == ExpressionType.PACKAGE) {
                System.out.printf("->> package [%s]\n", name);
            } else {
                // при спуске по дереву, для процедур и функций заходит сюда, но это не требуется
                if (!isFunctionOrProcedureSpec(ctx)) {
                    System.out.printf("- found new type [%s]", name + " [" + ctx.getClass().toString() + "]");
                }
            }
        }
        return super.visitId_expression(ctx);
    }

    @Override
    public Void visitSql_statement(PlSqlParser.Sql_statementContext ctx) {
        System.out.println(ctx.getText());
        return super.visitSql_statement(ctx);
    }

    @Override
    public Void visitFor_each_row(PlSqlParser.For_each_rowContext ctx) {
        System.out.println(ctx.getText());
        return super.visitFor_each_row(ctx);
    }

    @Override
    public Void visitLoop_statement(PlSqlParser.Loop_statementContext ctx) {
        System.out.println(ctx.getText());
        return super.visitLoop_statement(ctx);
    }

    @Override
    public Void visitJoin_clause(PlSqlParser.Join_clauseContext ctx) {
        System.out.println(ctx.getText());
        return super.visitJoin_clause(ctx);
    }

    @Override
    public Void visitSelect_statement(PlSqlParser.Select_statementContext ctx) {
        System.out.println(ctx.getText());
        return super.visitSelect_statement(ctx);
    }

    @Override
    public Void visitSubquery(PlSqlParser.SubqueryContext ctx) {
        System.out.println(ctx.getText());
        return super.visitSubquery(ctx);
    }

    @Override
    public Void visitSubquery_basic_elements(PlSqlParser.Subquery_basic_elementsContext ctx) {
        System.out.println(ctx.getText());
        return super.visitSubquery_basic_elements(ctx);
    }

    @Override
    public Void visitSelect_list_elements(PlSqlParser.Select_list_elementsContext ctx) {
        System.out.println("----");
        System.out.println(ctx.getText());
        for (int i = 0; i < ctx.getChildCount(); i++) {
            System.out.println(ctx.getChild(i).getText() + ":" + ctx.getChild(i).getClass());
        }
        System.out.println("----");
        return super.visitSelect_list_elements(ctx);
    }

    @Override
    public Void visitFrom_clause(PlSqlParser.From_clauseContext ctx) {
        System.out.println(ctx.getText());
        for (int i = 0; i < ctx.getChildCount(); i++) {
            System.out.println(ctx.getChild(i).getText() + ":" + ctx.getChild(i).getClass());
        }

        return super.visitFrom_clause(ctx);
    }

    @Override
    public Void visitTable_ref_list(PlSqlParser.Table_ref_listContext ctx) {
        System.out.println(ctx.getText());
        return super.visitTable_ref_list(ctx);
    }

    @Override
    public Void visitTable_ref(PlSqlParser.Table_refContext ctx) {
        System.out.println(ctx.getText());
        return super.visitTable_ref(ctx);
    }

    @Override
    public Void visitTable_ref_aux(PlSqlParser.Table_ref_auxContext ctx) {

        System.out.println(ctx.getText());
        for (int i = 0; i < ctx.getChildCount(); i++) {
            System.out.println(ctx.getChild(i).getText() + ":" + ctx.getChild(i).getClass());
        }
        return super.visitTable_ref_aux(ctx);
    }
}
