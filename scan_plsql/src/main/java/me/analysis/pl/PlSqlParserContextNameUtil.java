package me.analysis.pl;

import me.analysis.pl.generated.PlSqlParser;
import org.antlr.v4.runtime.tree.ParseTree;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PlSqlParserContextNameUtil {


    public static String getPackageName(PlSqlParser.Create_function_bodyContext ctx) {
        return ctx.parent.parent.getChild(1).getText();
    }

    public static String getFunctionName(PlSqlParser.Create_function_bodyContext ctx) {
        for (ParseTree tree : ctx.children) {
            if (tree instanceof PlSqlParser.Function_specContext) {
                return tree.getChild(1).getText();
            }
        }
        return ctx.getChild(0).getChild(1).getText();
    }

    public static String getPackageName(PlSqlParser.Create_procedure_bodyContext ctx) {
        return ctx.parent.parent.getChild(1).getText();
    }

    public static String getProcedureName(PlSqlParser.Create_procedure_bodyContext ctx) {
        for (ParseTree tree : ctx.children) {
            if (tree instanceof PlSqlParser.Procedure_specContext) {
                return tree.getChild(1).getText();
            }
        }
        return ctx.getChild(0).getChild(1).getText();
    }

    public static String getFunctionName(PlSqlParser.Function_callContext ctx) {
        ParseTree child = ctx.getChild(0);
        String functionName = child.getText();
        return functionName;
    }

    public static List<String> getFunctionArgs(PlSqlParser.Function_callContext ctx) {
        List<String> args = new ArrayList<>();
        for(ParseTree c: ctx.children) {
            if(c instanceof PlSqlParser.ArgumentContext) {
                for(ParseTree a:((PlSqlParser.ArgumentContext) c).children) {
                    args.add(c.getText());
                }
            }
        }
        return args;
    }

    public static String getUpdateTable(PlSqlParser.Update_statementContext ctx) {
        return ctx.getChild(1).getChild(0).getChild(0).getText();
    }

    public static String getInsertTable(PlSqlParser.Insert_statementContext ctx) {
        ParseTree intoClause = ctx.getChild(1).getChild(0);
        return intoClause.getChild(1).getText();
    }

    public static String getDeleteTable(PlSqlParser.Delete_statementContext ctx) {
        if(ctx.getChild(1) instanceof PlSqlParser.General_table_refContext) {
            return ctx.getChild(1).getChild(0).getText();
        }
        ParseTree dmlTable = ctx.getChild(2).getChild(0);
        return dmlTable.getText();
    }


    public static Map<String, String> getSelectFromTable(PlSqlParser.Query_blockContext queryBlock) {
        ParseTree fromClause = null;
        for (int i = 0; i < queryBlock.getChildCount(); i++) {
            if (queryBlock.getChild(i) instanceof PlSqlParser.From_clauseContext) {
                fromClause = queryBlock.getChild(i);
                break;
            }
        }

        ParseTree selectFromList = fromClause.getChild(1);
        Map<String, String> selectList = new HashMap<>();
        for (int i = 0; i < selectFromList.getChildCount(); i++) {
            if (i % 2 == 0) {
                ParseTree tableRefAux = selectFromList.getChild(i).getChild(0);
                String table = tableRefAux.getChild(0).getText();
                String alias = tableRefAux.getChildCount() > 1 ? tableRefAux.getChild(1).getText() : table;
                selectList.put(alias.toUpperCase(), table.toUpperCase());
            }
        }
        return selectList;
    }

    public static List<String> getSelectColumns(PlSqlParser.Query_blockContext ctx) {
        Map<String, String> fromTables = PlSqlParserContextNameUtil.getSelectFromTable(ctx);
        ParseTree selectListElements = ctx.getChild(1).getChild(0);
        if (selectListElements == null || selectListElements.getText().contains("(")) {
            return new ArrayList<>();
        }
        String[] elements = selectListElements.getText().split(",");
        List<String> columns = new ArrayList<>();
        for (int i = 0; i < elements.length; i++) {
            String element = elements[i];
            String[] elementSpilt = element.split("\\.");
            if (elementSpilt.length == 2) {
                String tableId = fromTables.get(elementSpilt[0].toUpperCase());
                if (tableId != null) {
                    columns.add(tableId.toUpperCase() + "." + elementSpilt[1].toLowerCase());
                } else {
                    columns.add(elementSpilt[1].toLowerCase());
                }
            } else {
                if (fromTables.size() == 1) {
                    String s = MessageFormat.format("{0}.{1}",
                            (fromTables.values().toArray()[0]).toString().toUpperCase(), element.toLowerCase());
                    columns.add(s);
                } else {
                    columns.add(element.toLowerCase());
                }
            }
        }
        return columns;
    }

    public static List<String> getUpdateColumns(PlSqlParser.Update_statementContext ctx) {
        String updateTable = PlSqlParserContextNameUtil.getUpdateTable(ctx);
        ParseTree updateSetClauseContext = ctx.getChild(2);
        List<String> cs = new ArrayList<>();
        for (int i = 0; i < updateSetClauseContext.getChildCount(); i++) {
            if (i % 2 == 1) {
                cs.add(updateTable.toUpperCase() + "." + updateSetClauseContext.getChild(i).getChild(0).getText().toLowerCase());
            }
        }
        return cs;
    }

    public static List<String> getCondition(PlSqlParser.If_statementContext ctx) {
        List<String> result = new ArrayList<>();
        result.add(ctx.getChild(1).getText());
        return result;
    }

    public static List<String> getCondition(PlSqlParser.Elsif_partContext ctx) {
        List<String> result = new ArrayList<>();
        result.add(ctx.getChild(1).getText());
        return result;
    }

}
