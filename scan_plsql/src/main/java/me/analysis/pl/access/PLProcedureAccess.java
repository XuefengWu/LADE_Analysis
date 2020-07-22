package me.analysis.pl.access;

import java.util.HashSet;
import java.util.Set;

public class PLProcedureAccess {

    private String pkg;
    private String name;
    private String typ;
    private String src;
    private int startline;
    private int stopline;
    private Set<String> queryTables = new HashSet<>();
    private Set<String> queryColumns = new HashSet<>();
    private Set<String> updateTables = new HashSet<>();
    private Set<String> updateColumns = new HashSet<>();
    private Set<String> insertTables = new HashSet<>();
    private Set<String> deleteTables = new HashSet<>();
    private Set<String> functionCalls = new HashSet<>();

    public void setPkg(String pkg) {
        if(pkg != null){
            this.pkg = pkg.toUpperCase();
        }
    }

    public void setName(String name) {
        this.name = name.toUpperCase();
    }

    public void addQueryTable(String queryTable) {
        this.queryTables.add(queryTable.toUpperCase());
    }

    public void addQueryColumn(String queryColumn) {
        this.queryColumns.add(queryColumn);
    }

    public void addUpdateTable(String updateTable) {
        this.updateTables.add(updateTable.toUpperCase());
    }

    public void addUpdateColumn(String updateColumn) {
        this.updateColumns.add(updateColumn);
    }

    public void addInsertTable(String insertTable) {
        this.insertTables.add(insertTable.toUpperCase());
    }

    public void addDeleteTables(String deleteTable) {
        this.deleteTables.add(deleteTable.toUpperCase());
    }

    public void addFunctionCall(String functionCall) {
        this.functionCalls.add(functionCall.toUpperCase());
    }

    public String getType() {
        return typ;
    }

    public void setType(String typ) {
        this.typ = typ;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getFullName() {
        return pkg + "." + name;
    }

    public int getStartline() {
        return startline;
    }

    public void setStartline(int startline) {
        this.startline = startline;
    }

    public int getStopline() {
        return stopline;
    }

    public void setStopline(int stopline) {
        this.stopline = stopline;
    }

    public Set<String> getFunctionCalls() {
        return functionCalls;
    }

    public String getPkg() {
        return pkg;
    }

    public String getName() {
        return name;
    }

    public Set<String> getQueryTables() {
        return queryTables;
    }

    public Set<String> getQueryColumns() {
        return queryColumns;
    }

    public Set<String> getUpdateTables() {
        return updateTables;
    }

    public Set<String> getDeleteTables() {
        return deleteTables;
    }

    public Set<String> getUpdateColumns() {
        return updateColumns;
    }

    public Set<String> getInsertTables() {
        return insertTables;
    }

    @Override
    public String toString() {
        return "PLProcedureAccess{" +
                "pkg='" + pkg + '\'' +
                ", name='" + name + '\'' +
                ", typ='" + typ + '\'' +
                ", src='" + src + '\'' +
                ", queryTables=" + queryTables +
                ", queryColumns=" + queryColumns +
                ", updateTables=" + updateTables +
                ", updateColumns=" + updateColumns +
                ", insertTables=" + insertTables +
                ", functionCalls=" + functionCalls +
                '}';
    }
}
