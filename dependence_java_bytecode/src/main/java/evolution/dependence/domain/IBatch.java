package evolution.dependence.domain;

import java.util.Map;
import java.util.Optional;

public interface IBatch {

    void add(String table, Map<String, String> values);

    void update(String table,Map<String, String> keys,Map<String, String> values);

    void execute();

    Optional<String> findId(String table, Map<String,String> keys);

    void close();

}
