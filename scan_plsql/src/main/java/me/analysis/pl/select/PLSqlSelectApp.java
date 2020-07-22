package me.analysis.pl.select;

import me.analysis.pl.select.model.SqlSelect;
import me.store.Neo4JDriverFactory;
import org.neo4j.driver.v1.Driver;

import java.io.IOException;

public class PLSqlSelectApp {

    //private static Driver driver = Neo4JDriverFactory.create();
    //private static SqlSelectStore store = new SqlSelectStore(driver);

    public static void main(String[] args) throws IOException {
        //String name = "plsql_complex_select_case_where_left_join.sql";
        //String file = "/Users/xfwu/Workspace/lean_microservice/evolution/dependencies_plsql/src/test/resources/sql/select/" + name;
        String file = "/Users/xfwu/Workspace/lean_microservice/evolution/LADE_Analysis/plsql2kotlin/src/test/resources/P_TURN_REAL_DETAIL_COMMON.sql";
        PLSqlSelectParser parser = new PLSqlSelectParser();
        SqlSelect select = parser.processFile(file);
        //store.save(select);
    }
}
