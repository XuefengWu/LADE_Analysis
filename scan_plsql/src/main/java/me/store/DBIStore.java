package me.store;


import org.skife.jdbi.v2.Batch;
import org.skife.jdbi.v2.DBI;
import org.skife.jdbi.v2.Handle;

import java.util.ArrayList;
import java.util.List;

public class DBIStore {

    private String dburl;
    private DBI dbi;
    public DBIStore(String dburl) {
        this.dburl = dburl;
        this.dbi = new DBI(dburl);
    }

    public void delete(String table) {
        Handle handle = dbi.open();
        handle.execute("DELETE FROM " + table);
        dbi.close(handle);
    }
    public void save(List<String> sqls) {
        List<String> buffer = new ArrayList<>(1000);
        for(String sql:sqls) {
            buffer.add(sql);
            if(buffer.size() > 999) {
                doSave(buffer);
                buffer.clear();
            }
        }
        doSave(buffer);
    }

    private void doSave(List<String> sqls) {
        Handle handle = dbi.open();
        Batch batch = handle.createBatch();
        for(String sql:sqls) {
            batch.add(sql);
        }
        batch.execute();
        dbi.close(handle);
    }
}
