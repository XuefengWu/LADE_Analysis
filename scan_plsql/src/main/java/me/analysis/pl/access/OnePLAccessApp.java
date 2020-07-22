package me.analysis.pl.access;

import java.io.IOException;
import java.util.Set;

public class OnePLAccessApp {

    public static void main(String[] args) throws IOException {
        String file = "/Users/xfwu/Workspace/PICC/201908/cbs/cbs/src/main/plsql/R__31_PKG_LIFE_CLAIM_END_CASE_BONUS.sql";
        Set<PLProcedureAccess> procedures = new PLAccessParser().processFile(file);
        procedures.forEach(System.out::println);
    }
}
