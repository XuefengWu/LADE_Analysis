package me.analysis.pl.select.model;

import java.util.*;
import java.util.stream.Collectors;

public class SqlSelect {

    private String name;
    public SqlSelect(String name) {
        this.name = name;
    }

    private List<Either<Table,SqlSelect>> from = new ArrayList<>();
    private List<ResultColumn> results = new ArrayList<>();
    private Set<ConditionExpr> where = new HashSet<>();

    public void addResultColumn(ResultColumn col){
        results.add(col);
    }
    public void addTableOrSubSelect(Either<Table,SqlSelect> e) {
        from.add(e);
    }

    public void addFromTable(Table t){
        Either<Table,SqlSelect> e = Either.left(t);
        from.add(e);
    }
    public void addCondition(ConditionExpr c ){
        where.add(c);
    }

    public List<Table> getFromTables() {
        return from.stream().filter(v -> v.isLeft()).map(v -> v.leftValue()).collect(Collectors.toList());
    }

    public List<TableColumn> getResultTableColumns() {
        return results.stream().filter(v->v.getTableColumn()!=null).map(v -> v.getTableColumn()).collect(Collectors.toList());
    }

    public List<TableColumn> getConditionTableColumns() {
        List<TableColumn> conditionTableColumns = new ArrayList<>();
        for(ConditionExpr c: where) {
            Optional<TableColumn> a = c.getLeftTableColumn();
            if(a.isPresent()){
                conditionTableColumns.add(a.get());
            }
            Optional<TableColumn> b = c.getRightTableColumn();
            if(b.isPresent()){
                conditionTableColumns.add(b.get());
            }
        }
        return conditionTableColumns;
    }

    public String getName() {
        return name.split("\\.")[0];
    }

    public Set<ConditionExpr> getWhere() {
        return where;
    }

    @Override
    public String toString() {
        return "SqlSelect{" +
                "from=" + from +
                ",\n results=" + results +
                ",\n where=" + where.stream().map(v -> v+ "\n").collect(Collectors.toList()) +
                '}';
    }
}
