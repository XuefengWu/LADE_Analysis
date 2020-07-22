package me.analysis.pl.sequence;

import org.neo4j.driver.v1.Driver;
import org.neo4j.driver.v1.Session;
import org.neo4j.driver.v1.Transaction;
import org.neo4j.driver.v1.TransactionWork;

import java.text.SimpleDateFormat;
import java.util.Date;

import static org.neo4j.driver.v1.Values.parameters;

public class PLSequenceStore {

    private Driver driver;

    public PLSequenceStore(Driver driver) {
        this.driver = driver;
    }

    public void save(PLProcedureSequence v) {
        System.out.println("PLSequenceStore save: "+v);
        try(Session session = driver.session()) {
            session.writeTransaction(new TransactionWork<Integer>() {
                @Override
                public Integer execute(Transaction tx) {
                    saveProcedure(tx, v);

                    for (PLProcedureSequence.Step step : v.getSteps()) {

                        switch (step.getCallCase()) {
                            case PLProcedureSequence.Step.CASE_TABLE:
                                saveTable(tx, step, v);
                                break;
                            case PLProcedureSequence.Step.CASE_PROCEDURE:
                                saveCall(tx, step, v);
                                break;
                            case PLProcedureSequence.Step.CASE_CONTROL:
                                saveControl(tx, step, v);
                                break;
                        }
                    }

                    return 0;
                }
            });
        }
    }

    private void saveProcedure(Transaction tx, PLProcedureSequence v) {
        tx.run("MERGE (p:PLPackage {name: $pkg})  \n" +
                        "MERGE (m:PLProcedure {name: $name, fullname: $fullname,  " +
                        "startline: $startline,stopline: $stopline})  " +
                        "MERGE  (p)-[:Has]->(m)",
                parameters("pkg", v.getPkg(),
                        "name", v.getName(), "fullname", v.getFullName(),
                        "startline",v.getStartLine(),"stopline",v.getStopLine()));
    }

    private void saveControl(Transaction tx, PLProcedureSequence.Step step, PLProcedureSequence v) {
        tx.run("MATCH (p:PLProcedure {name: $name, fullname:$fullname})  \n" +
                        "MERGE (t:PLControl {name: $controller, fullname:$controllerFullName, fields:$fields})  " +
                        "MERGE  (p)-[:__CALLTYPE__{seq:$seq,line:$line,size:$size,date:$date}]->(t)".replace("__CALLTYPE__", step.getCallType()),
                parameters("name", v.getName(),"fullname",v.getFullName(),
                        "controller",step.getName(),"controllerFullName",step.getControllerFullName(),"fields",step.getFields(),
                        "seq", step.getSeq(),"line",step.getLine(),"size",step.getSize(),"date",getToday()));
    }

    private void saveCall(Transaction tx, PLProcedureSequence.Step step, PLProcedureSequence v) {
        tx.run("MATCH (p:PLProcedure {name: $name, fullname:$fullname})  \n" +
                        "MERGE (t:PLProcedure {name: $procedure,fullname:$procedureFullName})  " +
                        "MERGE  (p)-[:__CALLTYPE__{seq:$seq,line:$line,size:$size,fields:$fields,date:$date}]->(t)".replace("__CALLTYPE__", step.getCallType()),
                parameters("name", v.getName(),"fullname",v.getFullName(),
                        "procedure",step.getName(),"procedureFullName",step.getProcedureFullName(),
                        "seq", step.getSeq(),"line",step.getLine(),"size",step.getSize(),
                        "fields",step.getFields(),"date",getToday()));
    }


    private void saveTable(Transaction tx, PLProcedureSequence.Step step, PLProcedureSequence v) {
        tx.run("MATCH (p:PLProcedure {name: $name, fullname:$fullname})  \n" +
                        "MATCH (t:Table {name: $table})  " +
                        "MERGE  (p)-[:__CALLTYPE__{seq:$seq,line:$line,size:$size,fields:$fields,date:$date}]->(t)".replace("__CALLTYPE__", step.getCallType()),
                parameters("name", v.getName(),"fullname",v.getFullName(),
                        "table",step.getName(),
                        "seq", step.getSeq(),"line",step.getLine(),"size",step.getSize(),
                        "fields",step.getFields(),"date",getToday()));
    }

    private String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    private String getToday() { return today;}

    public void update(String state) {
        try (Session session = driver.session()) {
            session.writeTransaction(new TransactionWork<Integer>() {
                @Override
                public Integer execute(Transaction tx) {
                    tx.run(state);
                    return 0;
                }
            });
        }
    }

}
