package me.analysis.pl.view;

import org.neo4j.driver.v1.Driver;
import org.neo4j.driver.v1.Session;
import org.neo4j.driver.v1.Transaction;
import org.neo4j.driver.v1.TransactionWork;

import static org.neo4j.driver.v1.Values.parameters;

public class PLViewStore {

    private Driver driver;

    public PLViewStore(Driver driver) {
        this.driver = driver;
    }

    public void save(PLView v) {
        System.out.println(v);
        try(Session session = driver.session()) {
            session.writeTransaction(new TransactionWork<Integer>() {
                @Override
                public Integer execute(Transaction tx) {
                    tx.run("MERGE (p:PLView {name: $name, fullname:$fullname})  ",
                            parameters("name", v.getName(),"fullname",v.getFullName()));

                    for (String c : v.getTargetColumns()) {
                        tx.run("MATCH (p:PLView {name: $view})  \n" +
                                        "MERGE (m:PLViewColumn {name: $name, fullname: $fullname})  " +
                                        "MERGE  (p)-[:HAS]->(m)",
                                parameters("view", v.getName(),
                                        "name", c, "fullname", String.format("%s.%s", v.getFullName(), c)));
                    }
                    for (String t : v.getSourceTables()) {
                        tx.run("MATCH (p:PLView {name: $view})  \n" +
                                        "MATCH (t:Table {name: $table})  " +
                                        "MERGE  (p)-[:Read]->(t)",
                                parameters("view", v.getName(),
                                        "table", t));
                    }
                    return v.getTargetColumns().size();
                }
            });
        }
    }

}
