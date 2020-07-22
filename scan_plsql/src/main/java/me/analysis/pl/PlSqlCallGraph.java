package me.analysis.pl;


import me.analysis.pl.utils.PlSqlUtils;
import me.analysis.pl.visitor.CallGraphVisitor;
import org.antlr.v4.runtime.ANTLRInputStream;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.logging.Level;

public class PlSqlCallGraph {

    //private static Properties prop = new Properties();

    public static void processFile(String fileName) throws IOException {
        String parsedSql = null;
        PlSqlParserTree tree = null;

        System.out.println("Start " + fileName);

        FileInputStream parseFile = new FileInputStream(fileName);
        try {
            tree = new PlSqlParserTree(new ANTLRInputStream(parseFile));

            CallGraphVisitor visitor = new CallGraphVisitor(tree);

            visitor.visitMode = CallGraphVisitor.VisitMode.FIRST_PASS;
            visitor.visit();

            CallGraphVisitor.idMap.forEach((k, v) -> System.out.println("Key: [" + k + "] = Value is " + v));

            visitor.visitMode = CallGraphVisitor.VisitMode.SECOND_PASS;
            visitor.visit();

            parsedSql = tree.getResultText();
            // обработанный текст
            // System.out.println(parsedSql);
        } finally {
            parseFile.close();
        }

        //        PlSqlUtils.writeToFile(fileName + "_2", parsedSql);

        System.out.println("End");
    }

    public static void main(String[] args) {
        //prop = PlSqlUtils.loadProperties();

        if (args.length > 0) {
            for (int i = 0; i < args.length; i++) {
                try {
                    processFile(args[i]);
                } catch (IOException e) {
                    PlSqlUtils.logger.log(Level.WARNING, "Error processing " + args[i], e);
                }
            }
        } else {
            //String fileName = prop.getProperty("default_file_name");
            String fileName = "/Users/xfwu/Workspace/PICC/cbs/cbs/src/main/plsql/R__PKG_LIFE_CLAIM_END_CASE.sql";
            if ((fileName != null) && (!fileName.isEmpty())) {
                try {
                    processFile(fileName);
                } catch (IOException e) {
                    PlSqlUtils.logger.log(Level.WARNING, "Error processing " + fileName, e);
                }
            } else {
                System.out.println("No files to parse");
                return;
            }
        }
    }
}
