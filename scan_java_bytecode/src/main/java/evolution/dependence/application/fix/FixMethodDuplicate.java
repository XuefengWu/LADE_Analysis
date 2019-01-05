package evolution.dependence.application.fix;

import evolution.dependence.infrastructure.DBConfig;
import org.skife.jdbi.v2.DBI;
import org.skife.jdbi.v2.Handle;
import org.skife.jdbi.v2.Query;

import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class FixMethodDuplicate {

    public static void main(String[] args) {
        FixRepository repo = new FixRepository();
        List<Map<String,Object>> methodsList = repo.findDuplicateMethod();
        System.out.println("methodsList size: " + methodsList.size());
        AtomicInteger total = new AtomicInteger(methodsList.size());
        //int poolSize = 8;
        //ExecutorService pool = Executors.newFixedThreadPool(poolSize);
        for(Map<String,Object> method: methodsList) {
            //Runnable r = () -> {
                String clz = method.get("clzname").toString();
                String name = method.get("name").toString();
                System.out.println(String.format("%s.%s, remain: %d",clz,name,total.decrementAndGet()));
                List<String> ids = repo.findMethodByName(clz, name);
                String theId = ids.get(0);
                for (int i = 1; i < ids.size(); i++) {
                    String otherId = ids.get(i);
                    repo.updateOneColumn("_MethodCallees",otherId,"a",theId);
                    repo.updateOneColumn("_MethodCallees",otherId,"b",theId);
                    repo.updateOneColumn("_MethodCaller",otherId,"a",theId);
                    repo.updateOneColumn("_MethodCaller",otherId,"b",theId);
                    repo.updateOneColumn("_ClassMethods",otherId,"b",theId);
                    repo.deleteOne("JMethod",otherId);
                }
            //};
            //pool.submit(r);
        }
    }

    public static class FixRepository {

        private static DBI dbi = DBConfig.getDB();

        public List<Map<String,Object>> findClassWithModular() {
            String sql = "     SELECT name,module\n" +
                    "          FROM `default@default`.`JClass`\n" +
                    "          WHERE module is not null;";
            return queryColumns(sql);
        }

        public List<String> findDuplicateClass() {
            String sql = "     SELECT name, COUNT(name) as count\n" +
                    "          FROM `default@default`.`JClass`\n" +
                    "          GROUP BY name\n" +
                    "          HAVING count > 1\n" +
                    "          order by count desc;";
            return queryOneColumn(sql,"name");
        }

        public List<Map<String,Object>> findDuplicateMethod() {
            String sql = " SELECT\n" +
                    "       name, clzname, COUNT(*) as count\n" +
                    "       FROM\n" +
                    "    `default@default`.`JMethod`\n" +
                    "       GROUP BY name, clzname\n" +
                    "   HAVING  COUNT(*) > 1";

            return queryColumns(sql);
        }

        private List<Map<String,Object>> queryColumns(String sql) {
            Handle handle = dbi.open();
            Query<Map<String, Object>> q = handle.createQuery(sql);
            List<Map<String, Object>> l = q.list();
            handle.close();
            return l;
        }

        public List<String> findClassByName(String name) {
            String sql = String.format("SELECT id from `default@default`.`JClass` where `name` = '%s'", name);
            return queryOneColumn(sql,"id");
        }

        public List<String> findMethodByName(String clz,String name) {
            String sql = String.format("SELECT id from `default@default`.`JMethod` where `clzname`='%s' and `name` = '%s'",clz, name);
            return queryOneColumn(sql,"id");
        }

        public void updateOneColumn(String table,String id,String column,String value) {
            String sql = String.format("UPDATE `default@default`.`%s` SET `%s`='%s' where `id` = '%s'",table,column,value,id);
            Handle handle = dbi.open();
            handle.execute(sql);
            handle.close();
        }

        public void deleteAll(String table) {
            String sql = String.format("DELETE FROM `default@default`.`%s`",table);
            Handle handle = dbi.open();
            handle.execute(sql);
            handle.close();
        }

        public void alertToChar36(String table, String column){
            String sql = String.format("ALTER TABLE `default@default`.`%s` MODIFY `%s` CHAR(36)",table,column);
            Handle handle = dbi.open();
            handle.execute(sql);
            handle.close();
        }

        public void deleteOne(String table,String id) {
            String sql = String.format("DELETE FROM `default@default`.`%s` where `id` = '%s'",table,id);
            Handle handle = dbi.open();
            handle.execute(sql);
            handle.close();
        }

        private List<String> queryOneColumn(String sql,String column) {
            Handle handle = dbi.open();
            Query<Map<String, Object>> q = handle.createQuery(sql);
            List<Map<String, Object>> l = q.list();
            handle.close();
            return l.stream().map(v -> v.get(column).toString()).collect(Collectors.toList());
        }

    }
}
