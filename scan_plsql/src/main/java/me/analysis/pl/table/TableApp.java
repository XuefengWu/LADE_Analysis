package me.analysis.pl.table;


import me.analysis.pl.utils.PlSqlUtils;
import me.store.Neo4JDriverFactory;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

public class TableApp {

    //private static Properties prop = new Properties();

    public static List<Table> processFile(String fileName) throws IOException {

        System.out.println("Start " + fileName);

        ParseTree tree = TableParser.parse(Paths.get(fileName));
        List<Table> tables = new ArrayList<>();
        tree.accept(new TableVisitor(tables));
        return tables;
    }

    public static void main(String[] args) {
        String fileName = "/Users/xfwu/Workspace/PICC/util/structure101/ddl_create_table.sql";
        if ((fileName != null) && (!fileName.isEmpty())) {
            try {
                TableStore store = new TableStore(Neo4JDriverFactory.create());
                List<Table> tables = processFile(fileName);
                for(Table t: tables){
                    store.save(t);
                }
            } catch (IOException e) {
                PlSqlUtils.logger.log(Level.WARNING, "Error processing " + fileName, e);
            }
        } else {
            System.out.println("No files to parse");
            return;
        }
    }
}
