package me.analysis.pl.access;

import io.netty.util.internal.StringUtil;
import me.analysis.pl.utils.FileUtil;
import me.analysis.pl.utils.ProcessFiles;
import me.store.DBIStore;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;

public class PLAccessApp {

    private PLAccessStore store = new PLAccessStore();
    private boolean start = true;
    public static void main(String[] args) throws IOException {
        long start = System.currentTimeMillis();
        FileUtil.delete("PLProcedureSqlTable.sql");
        PLAccessApp app = new PLAccessApp(/*Neo4JDriverFactory.create()*/);
        if (args.length > 0) {
            String root = args[0];
            File[] ls = new File(root).listFiles();
            for (int i = 0; i < ls.length; i++) {
                if(ls[i].isDirectory()){
                    app.parseDir(ls[i].getAbsolutePath());
                }
            }
        } else {
            System.out.println("Please input path of plsql！");
            return;
        }
        //app.parseFile("/Users/xfwu/Workspace/PICC/cbs/cbs/src/main/plsql/R__PKG_LIFE_CLAIM_END_CASE.sql");
        long end = System.currentTimeMillis();

        String dburl = System.getProperty("dburl");
        if(!StringUtil.isNullOrEmpty(dburl)) {
            app.storeDatabase(dburl);
        }
        System.out.printf("spend time: %d%n", (end - start)/1000);
    }

    private  void parseDir(String dir) throws IOException {
        Path startingDir = Paths.get(dir);
        System.out.println(startingDir.toString());
        Consumer<Path> fileAnalysis = (Path path) -> {
            parseFile(path.toAbsolutePath().toString());
        };
        ProcessFiles pf = new ProcessFiles(fileAnalysis, 0);
        Files.walkFileTree(startingDir, pf);
    }

    private void parseFile(String file) {
        if(file.contains("R__31_PKG_LIFE_CLAIM_END_CASE_BONUS")) {
            start = true;
        }
        try {
            System.out.println(file);
            if (file.endsWith(".sql") && start) {
                Set<PLProcedureAccess> procedures = new PLAccessParser().processFile(file);
                for (PLProcedureAccess p : procedures) {
                    store.save(p);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void storeDatabase(String dburl) throws IOException {
        DBIStore store = new DBIStore(dburl);
        List<String> callTables = FileUtil.read("PLProcedureSqlTable.sql");
        System.out.println(callTables.size());
        store.delete("PLProcedureSqlTable");
        store.save(callTables);
    }
}
