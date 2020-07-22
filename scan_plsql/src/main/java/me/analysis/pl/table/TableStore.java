package me.analysis.pl.table;

import org.neo4j.driver.v1.Driver;
import org.neo4j.driver.v1.Session;
import org.neo4j.driver.v1.Transaction;
import org.neo4j.driver.v1.TransactionWork;

import static org.neo4j.driver.v1.Values.parameters;

public class TableStore {

    private Driver driver;

    public TableStore(Driver driver) {
        this.driver = driver;
    }

    public void save(Table t) {
        System.out.println(t);
        try(Session session = driver.session()) {
            session.writeTransaction(new TransactionWork<Integer>() {
                @Override
                public Integer execute(Transaction tx) {
                    tx.run("MERGE (p:Table {name: $name, fullname:$fullname})  ",
                            parameters("name", t.getName(),"fullname",t.getFullname()));

                    for (String c : t.getColumns()) {
                        tx.run("MATCH (p:Table {name: $table})  \n" +
                                        "MERGE (m:Column {name: $name, fullname: $fullname})  " +
                                        "MERGE  (p)-[:HAS]->(m)",
                                parameters("table", t.getName(),
                                        "name", c, "fullname", String.format("%s.%s", t.getFullname(), c)));
                    }
                    return t.getColumns().size();
                }
            });
        }
    }

}
