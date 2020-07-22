package me.analysis.pl.foreignkey;

import org.neo4j.driver.v1.Driver;
import org.neo4j.driver.v1.Session;
import org.neo4j.driver.v1.Transaction;
import org.neo4j.driver.v1.TransactionWork;

import static org.neo4j.driver.v1.Values.parameters;

public class ForeignKeyStore {

    private Driver driver;

    public ForeignKeyStore(Driver driver) {
        this.driver = driver;
    }

    public void save(ForeignKey t) {
        System.out.println(t);
        try (Session session = driver.session()) {
            session.writeTransaction(new TransactionWork<Integer>() {
                @Override
                public Integer execute(Transaction tx) {
                    tx.run("MATCH (p:Table {name: $source})  \n" +
                                    "MATCH (m:Table {name: $references})  " +
                                    "MERGE  (p)-[:ForeignKey {target:$target,origin:$origin}]->(m)",
                            parameters("source", t.getSourceTable(),"references", t.getReferences(),
                                    "origin",t.getOriginColumn(),"target",t.getTargetColumn()));
                    return 0;
                }
            });
        }
    }

}
