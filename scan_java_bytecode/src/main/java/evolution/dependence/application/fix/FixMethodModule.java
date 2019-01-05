package evolution.dependence.application.fix;

import evolution.dependence.domain.IBatch;
import evolution.dependence.infrastructure.JdbiBatch;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FixMethodModule {

    public static void main(String[] args) {

        FixMethodDuplicate.FixRepository repo = new FixMethodDuplicate.FixRepository();
        List<Map<String,Object>> clzs = repo.findClassWithModular();
        IBatch batch = new JdbiBatch();
        int count = 0;
        System.out.println("total class: " + clzs.size());
        for(Map<String,Object> clzMap:clzs) {
            String clzName = clzMap.get("name").toString();
            String module = clzMap.get("module").toString();
            Map<String,String> keys = new HashMap<>();
            keys.put("clzname",clzName);
            Map<String,String> values = new HashMap<>();
            values.put("module",module);
            batch.update("JMethod",keys,values);
            count++;
            if(count > 100) {
                batch.close();
                count = 0;
            }
        }
        batch.close();

    }

}
