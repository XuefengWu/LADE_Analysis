package me.analysis.pl.foreignkey;


import me.analysis.pl.utils.PlSqlUtils;
import me.store.Neo4JDriverFactory;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

public class ForeignKeyApp {

    //private static Properties prop = new Properties();

    public static List<ForeignKey> processFile(String fileName) throws IOException {

        System.out.println("Start " + fileName);

        ParseTree tree = ForeignKeyParser.parse(Paths.get(fileName));
        List<ForeignKey> foreignKeys = new ArrayList<>();
        tree.accept(new ForeignKeyVisitor(foreignKeys));
        return foreignKeys;
    }

    public static void main(String[] args) {
        //String fileName = "/Users/xfwu/Workspace/PICC/util/structure101/ddl_foreign_key.sql";
        String fileName = "/Users/xfwu/Desktop/constrains.sql";
        if ((fileName != null) && (!fileName.isEmpty())) {
            try {
                ForeignKeyStore store = new ForeignKeyStore(Neo4JDriverFactory.create());
                List<ForeignKey> foreignKeys = processFile(fileName);
                for (ForeignKey fk : foreignKeys) {
                    System.out.println(fk);
                    store.save(fk);
                }
                System.out.println("foreignKeys: " + foreignKeys.size());
            } catch (IOException e) {
                PlSqlUtils.logger.log(Level.WARNING, "Error processing " + fileName, e);
            }
        } else {
            System.out.println("No files to parse");
            return;
        }
    }

}
