package me.analysis.pl.select.model;

public class Table {

    private String name;
    private String alias;

    public Table(String name, String alias) {
        this.name = name;
        this.alias = alias;
    }

    public Table(String name) {
        this.name = name;
    }

    public String getName() {
        return name.toUpperCase();
    }

    public String getAlias() {
        return alias;
    }


    @Override
    public String toString() {
        return "Table{" +
                "name='" + name + '\'' +
                ", alias='" + alias + '\'' +
                '}';
    }
}
