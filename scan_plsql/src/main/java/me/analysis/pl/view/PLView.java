package me.analysis.pl.view;

import java.util.ArrayList;
import java.util.List;

public class PLView {

    private String prj;
    private String view;
    private List<String> targetColumns = new ArrayList<>();
    private List<String> sourceTables = new ArrayList<>();
    private List<String> sourceColumns = new ArrayList<>();

    public String getView() {
        return view;
    }

    public String getFullName(){
        return prj+"."+view;
    }
    public String getName() {
        return view;
    }
    public void setView(String view) {
        this.view = view.replaceAll("\"","").toUpperCase();
    }

    public List<String> getTargetColumns() {
        return targetColumns;
    }

    public void setTargetColumns(List<String> targetColumns) {
        for(String c: targetColumns){
            this.targetColumns.add(c.replaceAll("\"","").toLowerCase());
        }
    }

    public List<String> getSourceTables() {
        return sourceTables;
    }

    public void addSourceTable(String sourceTable) {
        this.sourceTables.add(sourceTable.replaceAll("\"","").toUpperCase());
    }

    public List<String> getSourceColumns() {
        return sourceColumns;
    }

    public void addSourceColumn(String sourceColumn) {
        this.sourceColumns.add(sourceColumn.replaceAll("\"","").toLowerCase());
    }

    public String getPrj() {
        return prj;
    }

    public void setPrj(String prj) {
        this.prj = prj;
    }

    @Override
    public String toString() {
        return "PLView{" +
                "view='" + view + '\'' +
                ", targetColumns=" + targetColumns +
                ", sourceTables='" + sourceTables + '\'' +
                ", sourceColumns=" + sourceColumns +
                '}';
    }
}
