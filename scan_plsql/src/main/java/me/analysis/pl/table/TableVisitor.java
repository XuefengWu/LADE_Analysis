package me.analysis.pl.table;


import me.analysis.sql.SqlBaseVisitor;
import me.analysis.sql.SqlParser;

import java.util.List;

public class TableVisitor extends SqlBaseVisitor<Void> {

    private List<Table> tables;
    private Table table;
    public TableVisitor(List<Table> tables) {
        this.tables = tables;
    }

    @Override
    public Void visitCreate_table_stmt(SqlParser.Create_table_stmtContext ctx) {
        table = new Table();
        tables.add(table);

        table.setPrj(ctx.database_name().getText());
        table.setName(ctx.table_name().getText());

        return super.visitChildren(ctx);
    }


    @Override
    public Void visitColumn_name(SqlParser.Column_nameContext ctx) {

        if (ctx.parent.parent instanceof SqlParser.Create_table_stmtContext) {
            //create table column:
            table.addColumn(ctx.getText());
        } else {
            System.out.printf("%s\t\t%s%n", ctx.getText(), ctx.getClass());
        }
        return super.visitChildren(ctx);
    }

}
