package me.analysis.pl.select;

import me.analysis.pl.select.model.SqlSelect;
import me.analysis.pl.utils.ProcessFiles;
import me.store.Neo4JDriverFactory;
import org.neo4j.driver.v1.Driver;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.function.Consumer;

public class SqlSelectApp {

    private static Driver driver = Neo4JDriverFactory.create();
    public static void processFile(String fileName) {

        System.out.println("Start " + fileName);
        SqlSelect select = null;
        try {
            select = SqlSelectParser.parse(Paths.get(fileName), Paths.get(fileName).getFileName().toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(select);
        SqlSelectStore store = new SqlSelectStore(driver);
        store.save(select);
    }

    public static void main(String[] args) {
        String fileName = "/Users/xfwu/Workspace/lean_microservice/evolution/dependencies_plsql/src/test/resources/sql/select/";

        try {
            //parseDir(fileName);
            processFile("/Users/xfwu/Workspace/lean_microservice/evolution/dependencies_plsql/src/test/resources/sql/select/simple_select_union.sql");
        } catch (Exception e) {
            e.printStackTrace();
        }


        /*
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
        */
    }

    private static void parseDir(String dir) throws IOException {
        Path startingDir = Paths.get(dir);
        System.out.println(startingDir.toString());
        Consumer<Path> fileAnalysis = (Path path) -> {
            processFile(path.toAbsolutePath().toString());
        };
        ProcessFiles pf = new ProcessFiles(fileAnalysis, 0);
        Files.walkFileTree(startingDir, pf);
    }


}
