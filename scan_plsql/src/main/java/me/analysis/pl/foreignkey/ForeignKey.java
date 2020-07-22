package me.analysis.pl.foreignkey;

public class ForeignKey {

    private String prj;
    private String sourceTable;
    private String references;
    private String originColumn;
    private String targetColumn;

    public String getPrj() {
        return prj;
    }

    public void setPrj(String prj) {
        this.prj = prj.replaceAll("\"","").toUpperCase();
    }

    public String getSourceTable() {
        return sourceTable;
    }

    public void setSourceTable(String sourceTable) {
        this.sourceTable = sourceTable.replaceAll("\"","").toUpperCase();
    }

    public String getSourceTableFullname() {
        return getPrj()+"."+sourceTable;
    }

    public String getReferences() {
        return references;
    }

    public void setReferences(String references) {
        this.references = references.replaceAll("\"","").toUpperCase();
    }

    public String getOriginColumn() {
        return originColumn;
    }

    public void setOriginColumn(String originColumn) {
        this.originColumn = originColumn.toLowerCase();
    }

    public String getTargetColumn() {
        return targetColumn;
    }

    public void setTargetColumn(String targetColumn) {
        this.targetColumn = targetColumn.toLowerCase();
    }

    @Override
    public String toString() {
        return "ForeignKey{" +
                "prj='" + prj + '\'' +
                ", source='" + sourceTable + "." + originColumn + '\'' +
                ", reference='" + references+ "." + targetColumn + '\'' +
                '}';
    }
}
