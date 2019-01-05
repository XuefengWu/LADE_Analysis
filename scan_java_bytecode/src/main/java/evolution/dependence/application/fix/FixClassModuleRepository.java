package evolution.dependence.application.fix;

import evolution.dependence.domain.IBatch;
import evolution.dependence.domain.models.JClass;
import evolution.dependence.domain.repository.IClassRepository;
import evolution.dependence.infrastructure.JdbiBatch;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

public class FixClassModuleRepository implements IClassRepository {

    private IBatch batch = new JdbiBatch();
    private int batchStep = 3000;
    private AtomicInteger count = new AtomicInteger(0);

    public void save(JClass clz, String module) {
        Map<String,String> keys = new HashMap<>();
        keys.put("name",clz.getName());
        Map<String,String> values = new HashMap<>();
        values.put("module",module.toLowerCase());
        batch.update("JClass",keys,values);
        count.incrementAndGet();
        if(count.get() == batchStep){
            flush();
            count.compareAndSet(batchStep,0);
        }
    }

    @Override
    public void close() {
        flush();
        System.out.println("Finally finished.");
    }

    private void flush() {
        batch.close();
    }

}
