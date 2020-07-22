package me.analysis.pl.view;

import me.store.Neo4JDriverFactory;

import java.io.IOException;
import java.util.List;

public class PLViewApp {

    public static void main(String[] args) throws IOException {
        PLViewStore store = new PLViewStore(Neo4JDriverFactory.create());
        try {
            String file = "/Users/xfwu/Workspace/PICC/util/structure101/ddl_create_view.sql";
            List<PLView> views = PLViewParser.processFile(file);
            for (PLView v : views) {
                store.save(v);
            }
            System.out.println("view size: " + views.size());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
