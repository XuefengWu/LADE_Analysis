package evolution.dependence.infrastructure;


import evolution.dependence.domain.IBatch;
import org.skife.jdbi.v2.Batch;
import org.skife.jdbi.v2.DBI;
import org.skife.jdbi.v2.Handle;
import org.skife.jdbi.v2.Query;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

public class JdbiBatch implements IBatch {


    private DBI dbi;

    private Map<String, String> keyIdStore = new ConcurrentHashMap<>();
    private Map<String, List<Map<String, String>>> insertStore = new ConcurrentHashMap<>();
    private Map<String,List<UpdateRecord>> updateStore = new ConcurrentHashMap<>();

    public JdbiBatch() {
        this.dbi = DBConfig.getDB();
    }

    @Override
    public void add(String table, Map<String, String> values) {
        if (!insertStore.containsKey(table)) {
            insertStore.put(table, new ArrayList<>());
        }
        insertStore.get(table).add(values);
        Optional<String> keyOpt = getKey(table, values);
        if (keyOpt.isPresent()) {
            keyIdStore.put(keyOpt.get(), values.get("id"));
        }
    }

    public void update(String table,Map<String, String> keys,Map<String, String> values){
        if (!updateStore.containsKey(table)) {
            updateStore.put(table, new ArrayList<>());
        }
        updateStore.get(table).add(new UpdateRecord(keys,values));
    }

    private Optional<String> getKey(String table, Map<String, String> values) {
        if ("JMethod".equalsIgnoreCase(table)) {
            String key = methodStoreKey(values);
            return Optional.of(key);
        } else if ("JClass".equalsIgnoreCase(table)) {
            String key = classStoreKey(values);
            return Optional.of(key);
        } else {
            return Optional.empty();
        }
    }

    private String classStoreKey(Map<String, String> values) {
        return values.get("name");
    }

    private String methodStoreKey(Map<String, String> values) {
        return values.get("clzname") + values.get("name");
    }


    private String generateBatchInsertSql(String table, List<Map<String, String>> values) {
        StringBuffer sb = new StringBuffer();
        sb.append(String.format("INSERT INTO `default@default`.`%s`", table));
        sb.append("(");
        Map<String, String> h = values.get(0);
        StringBuffer fieldBuf = new StringBuffer();
        for (String k : h.keySet()) {
            fieldBuf.append(",");
            fieldBuf.append(String.format("`%s`", k));
        }
        sb.append(fieldBuf.substring(1));
        sb.append(")");
        sb.append("  VALUES  ");

        StringBuffer valuesBuf = new StringBuffer();
        for (Map<String, String> vMap : values) {
            valuesBuf.append(", (");
            StringBuffer vBuf = new StringBuffer();
            for (String v : vMap.values()) {
                vBuf.append(",");
                vBuf.append(String.format("'%s'", v));
            }
            valuesBuf.append(vBuf.substring(1));
            valuesBuf.append(")");
        }

        sb.append(valuesBuf.substring(1));
        return sb.toString();
    }

    private String generateUpdateString(String table, UpdateRecord record) {
        StringBuffer sb = new StringBuffer();
        sb.append(String.format("UPDATE `default@default`.`%s` SET ", table));
        Map<String,String> values = record.getValues();
        StringBuffer valuesBuf = new StringBuffer();
        for (Map.Entry<String, String> e : values.entrySet()) {
            valuesBuf.append(",");
            valuesBuf.append(e.getKey());
            valuesBuf.append("=");
            valuesBuf.append(String.format("'%s'", e.getValue()));
        }
        sb.append(valuesBuf.substring(1));
        Map<String, String> keys = record.getKeys();
        String where = generateWhere(keys);
        sb.append(" WHERE ");
        sb.append(where);
        return sb.toString();
    }

    @Override
    public void execute() {
        long start = System.currentTimeMillis();
        int totalInsert = 0;
        Handle handle = dbi.open();
        handle.execute("SET FOREIGN_KEY_CHECKS = 0");
        Batch batch = handle.createBatch();

        String[] tables = new String[]{"JClass", "JField", "JMethod",
                "_ClassFields", "_ClassMethods", "_ClassParent", "_MethodCallees", "_MethodCaller", "_ClassDependences"};

        for (String table : tables) {
            List<Map<String, String>> values = insertStore.get(table);
            if (values != null) {
                totalInsert = totalInsert + values.size();
                if (values != null && values.size() > 0) {
                    String sql = generateBatchInsertSql(table, values);
                    //System.out.println(sql);
                    batch.add(sql);
                }
            }
        }

        insertStore.clear();

        batch.execute();
        handle.execute("SET FOREIGN_KEY_CHECKS = 1");
        dbi.close(handle);

        long stop = System.currentTimeMillis();
        String.format("insert %d finished, spend: %d",totalInsert,(stop - start) / 1000);
    }

    @Override
    public Optional<String> findId(String table, Map<String, String> keys) {
        Optional<String> keyOpt = getKey(table, keys);
        if (keyOpt.isPresent()) {
            String v = keyIdStore.get(keyOpt.get());
            if (v != null) {
                return Optional.of(v);
            }
        }
        return Optional.empty();

    }

    private Optional<String> findIdFromDB(String table, Map<String, String> keys) {

        Handle handle = dbi.open();
        StringBuffer sql = new StringBuffer(String.format("SELECT id from `default@default`.`%s` WHERE ", table));
        sql.append(generateWhere(keys));
        Query<Map<String, Object>> q = handle.createQuery(sql.toString());
        Map<String, Object> res = q.first();
        handle.close();
        if (res != null && res.get("id") != null) {
            Object id = res.get("id");
            return Optional.of(id.toString());
        } else {
            return Optional.empty();
        }
    }

    private String generateWhere(Map<String, String> keys) {
        StringBuffer sb = new StringBuffer();
        for (Map.Entry entry : keys.entrySet()) {
            sb.append(" and ");
            String f = entry.getKey().toString();
            String v = entry.getValue().toString();
            sb.append(String.format(" `%s`='%s' ", f, v));
        }
        return sb.substring(5);
    }

    public void close() {
        Handle handle = dbi.open();
        for (Map.Entry<String, List<UpdateRecord>> entry : updateStore.entrySet()) {
            String table = entry.getKey();
            List<UpdateRecord> valuesList = entry.getValue();
            System.out.println(String.format("%s \tupdate %d", table, valuesList.size()));
            long start = System.currentTimeMillis();
            for (UpdateRecord r : valuesList) {
                String sql = generateUpdateString(table, r);
                handle.execute(sql);
            }
            long stop = System.currentTimeMillis();
            String.format("update %d finished, spend: %d",valuesList.size(),(stop - start) / 1000);
        }
        updateStore.clear();
        handle.close();

    }

    class UpdateRecord {
        private Map<String, String> keys;
        private Map<String, String> values;

        public UpdateRecord(Map<String, String> keys, Map<String, String> values) {
            this.keys = keys;
            this.values = values;
        }

        public Map<String, String> getKeys() {
            return keys;
        }

        public Map<String, String> getValues() {
            return values;
        }
    }
}
