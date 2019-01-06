package evolution.dependence.infrastructure;

import org.skife.jdbi.v2.DBI;

public class DBConfig {

    public static DBI getDB(){
        String url = "jdbc:mysql://localhost:3306/default@default";
        String dburl = System.getProperty("dburl");
        if(dburl != null && dburl.length() > 1){
            url = dburl;
        }
        return new DBI(url, "root", "prisma");
    }

}
