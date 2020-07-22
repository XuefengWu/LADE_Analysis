package me.analysis.pl.table;

import java.util.ArrayList;
import java.util.List;

public class Table {

    private String prj;
    private String name;
    private List<String> columns = new ArrayList<>();

    public String getPrj() {
        return prj;
    }

    public void setPrj(String prj) {
        this.prj = prj.replaceAll("\"","").toUpperCase();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name.replaceAll("\"","").toUpperCase();
    }

    public String getFullname() {
        return getPrj()+"."+getName();
    }

    public List<String> getColumns() {
        return columns;
    }

    public void addColumn(String column) {
        this.columns.add(column.replaceAll("\"","").toLowerCase());
    }

    @Override
    public String toString() {
        return "Table{" +
                "prj='" + prj + '\'' +
                ", name='" + name + '\'' +
                ", columns=" + columns +
                '}';
    }
}
