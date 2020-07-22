package me.analysis.pl.sequence;

import me.store.Neo4JDriverFactory;

import java.io.IOException;
import java.util.List;

public class PLSequenceApp {

    public static void main(String[] args) throws IOException {
        PLSequenceStore store = new PLSequenceStore(Neo4JDriverFactory.create());

        String pkg = "PKG_LIFE_CLAIM_END_CASE";
        String file = String.format("/Users/xfwu/Workspace/PICC/cbs/cbs/src/main/plsql/R__%s.sql",pkg);
        String deleteState=String.format("MATCH (pkg:PLPackage{name:'%s'})-[:Has]->(p:PLProcedure)-[r]->(t)  DETACH DELETE p,r,t",pkg);
        System.out.println("Delete: " + pkg);
        store.update(deleteState);

        List<PLProcedureSequence> procedures = new PLSequenceParser().processFile(file);

        for(PLProcedureSequence p: procedures) {
            System.out.println(p);
            store.save(p);
        }

        PLProcedureSequence.Step maxSeqStep = new PLProcedureSequence().createStep("0","","",0,0);
        for(PLProcedureSequence p: procedures) {
            for(PLProcedureSequence.Step s: p.getSteps()){
                if(s.getSeq().length() > maxSeqStep.getSeq().length()) {
                    maxSeqStep = s;
                }
            }
        }

        System.out.println(maxSeqStep);


    }
}
