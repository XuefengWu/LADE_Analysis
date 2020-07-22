package me.analysis.pl.select.model;

import java.util.Objects;

public class TableColumn {
    private String tableName;
    private String tableAlias;
    private String column;

    public TableColumn(String tableAlias, String column) {
        this.tableAlias = tableAlias;
        this.column = column;
    }

    public TableColumn(String column) {
        this.column = column;
    }

    public void setTableName(String table) {
        this.tableName = table;
    }

    public String getTableAlias() {
        return tableAlias;
    }

    public boolean hasTableName() {
        return tableName!=null;
    }
    public String getTableName() {
        return tableName.toUpperCase();
    }

    public String getColumn() {
        return column.toLowerCase();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TableColumn that = (TableColumn) o;
        return Objects.equals(tableName, that.tableName) &&
                Objects.equals(tableAlias, that.tableAlias) &&
                Objects.equals(column, that.column);
    }

    @Override
    public int hashCode() {

        return Objects.hash(tableName, tableAlias, column);
    }

    @Override
    public String toString() {
        return "TableColumn{" +
                "table='" + tableName + '\'' +
                ", tableAlias='" + tableAlias + '\'' +
                ", column='" + column + '\'' +
                '}';
    }
}
