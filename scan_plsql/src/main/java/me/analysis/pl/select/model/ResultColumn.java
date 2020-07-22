package me.analysis.pl.select.model;

public class ResultColumn {
    private TableColumn tableColumn;
    private String expr;

    public ResultColumn(String expr) {
        this.expr = expr;
    }

    public ResultColumn(String table, String column) {
        this.tableColumn = new TableColumn(table,column);
    }

    public TableColumn getTableColumn() {
        return tableColumn;
    }

    public void setTableName(String name){
        this.tableColumn.setTableName(name);
    }

    @Override
    public String toString() {
        return "ResultColumn{" +
                "tableColumn=" + tableColumn +
                ", expr='" + expr + '\'' +
                '}';
    }
}
