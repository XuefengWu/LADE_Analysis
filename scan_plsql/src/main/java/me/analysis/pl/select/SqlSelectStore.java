package me.analysis.pl.select;

import me.analysis.pl.select.model.*;
import org.neo4j.driver.v1.Driver;
import org.neo4j.driver.v1.Session;
import org.neo4j.driver.v1.Transaction;
import org.neo4j.driver.v1.TransactionWork;

import java.util.Date;
import java.util.UUID;

import static org.neo4j.driver.v1.Values.parameters;

public class SqlSelectStore {


    private Driver driver;
    private String currentTime;
    public SqlSelectStore(Driver driver) {
        this.driver = driver;
        this.currentTime = new Date().toString();
    }

    public void save(SqlSelect select) {
        System.out.println(select);
        try(Session session = driver.session()) {
            session.writeTransaction(new TransactionWork<Integer>() {
                @Override
                public Integer execute(Transaction tx) {

                    for(Table t: select.getFromTables()) {
                        tx.run("MERGE (p:SqlSelect {time: $time,name:$name})  \n" +
                                        "MERGE (m:Table {name: $table})  " +
                                        "MERGE  (p)-[:SelectFrom]->(m)",
                                parameters("time", currentTime,"name",select.getName(),
                                        "table", t.getName()));
                    }

                    for(TableColumn t: select.getResultTableColumns()) {
                        tx.run("MATCH (p:SqlSelect {time: $time,name:$name})  \n" +
                                        "MERGE (m:TableColumn {table: $table, column:$column,name:$tableColumn})  " +
                                        "MERGE  (p)-[:SelectResult]->(m)",
                                parameters("time", currentTime,"name",select.getName(),
                                        "table", t.getTableName(),"column",t.getColumn(),"tableColumn",t.getTableName()+"__"+t.getColumn()));
                    }

                    for(ConditionExpr t: select.getWhere()) {
                        String conditionUuid = UUID.randomUUID().toString();
                        Either<TableColumn,String> leftExpr = t.getLeft();
                        saveConditionExpr(tx, t, conditionUuid, leftExpr);
                        Either<TableColumn,String> rightExpr = t.getRight();
                        saveConditionExpr(tx, t, conditionUuid, rightExpr);

                        tx.run("MATCH (p:SqlSelect {time: $time,name:$name})  \n" +
                                        "MATCH (m:SqlCondition {time: $cond_time,uuid:$uuid,op:$op})  " +
                                        "MERGE  (p)-[:SelectWhere]->(m)",
                                parameters("time", currentTime,"name",select.getName(),
                                        "cond_time", currentTime,"uuid",conditionUuid,"op",t.getOp()));
                    }

                    return select.getConditionTableColumns().size();
                }
            });
        }
    }

    private void saveConditionExpr(Transaction tx, ConditionExpr t, String conditionUuid, Either<TableColumn, String> expr) {
        if(expr.isLeft()) {
            //TableColumn
            TableColumn tc = expr.leftValue();
            tx.run("MERGE (p:SqlCondition {time: $time,uuid:$uuid,op:$op})  \n" +
                            "MERGE (m:TableColumn {table: $table, column:$column, name:$tableColumn})  " +
                            "MERGE  (p)-[:WhereCondition]->(m)",
                    parameters("time", currentTime,"uuid",conditionUuid,"op",t.getOp(),
                            "table", tc.getTableName(),"column",tc.getColumn(),
                            "tableColumn",tc.getTableName()+"__"+tc.getColumn()));
        } else {
            //Value
            String v = expr.getRight().get();
            tx.run("MERGE (p:SqlCondition {time: $time,uuid:$uuid,op:$op})  \n" +
                            "MERGE (m:ConditionValue {value: $value,name:$name})  " +
                            "MERGE  (p)-[:WhereCondition]->(m)",
                    parameters("time", currentTime,"uuid",conditionUuid,"op",t.getOp(),
                            "value", v,"name",v));
        }
    }

}
