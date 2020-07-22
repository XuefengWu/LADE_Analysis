package me.analysis.pl.foreignkey;


import me.analysis.sql.SqlBaseVisitor;
import me.analysis.sql.SqlParser;

import java.util.List;

public class ForeignKeyVisitor extends SqlBaseVisitor<Void> {

    private List<ForeignKey> foreignKeys;
    private ForeignKey foreignKey;

    public ForeignKeyVisitor(List<ForeignKey> foreignKeys) {
        this.foreignKeys = foreignKeys;
    }

    @Override
    public Void visitAlter_table_stmt(SqlParser.Alter_table_stmtContext ctx) {
        foreignKey = new ForeignKey();
        if(!ctx.getText().contains("DISABLE")) {
            foreignKeys.add(foreignKey);
        }
        foreignKey.setSourceTable(getSourceTable(ctx));
        foreignKey.setPrj(getPrj(ctx));
        System.out.println(ctx.getText());

        return super.visitChildren(ctx);
    }

    private String getPrj(SqlParser.Alter_table_stmtContext ctx) {
        return ctx.getChild(2).getText();
    }
    private String getSourceTable(SqlParser.Alter_table_stmtContext ctx) {
        return ctx.getChild(4).getText();
    }

    @Override public Void visitFk_origin_column_name(SqlParser.Fk_origin_column_nameContext ctx) {
        String originColumn = ctx.getText();
        foreignKey.setOriginColumn(originColumn.replaceAll("\"", ""));
        return super.visitChildren(ctx);
    }

    @Override public Void visitForeign_table(SqlParser.Foreign_tableContext ctx) {
        foreignKey.setReferences(ctx.getText());
        return super.visitChildren(ctx);
    }

    @Override public Void visitFk_target_column_name(SqlParser.Fk_target_column_nameContext ctx) {
        String targetColumn = ctx.getText();
        foreignKey.setTargetColumn(targetColumn.replaceAll("\"", ""));
        return super.visitChildren(ctx);
    }

}
