package evolution.dependence.domain.repository;

import evolution.dependence.domain.IBatch;
import evolution.dependence.infrastructure.JdbiBatch;
import evolution.dependence.domain.models.JClass;
import evolution.dependence.domain.models.JField;
import evolution.dependence.domain.models.JMethod;


import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

import static evolution.dependence.domain.repository.DateUtil.getCurrentTime;

public class ClassRepository implements IClassRepository {

    private IBatch batch;
    private int batchStep = 100;
    private AtomicInteger count = new AtomicInteger(0);

    public ClassRepository() {
        batch = new JdbiBatch();
    }

    public ClassRepository(boolean isBatch) {
        this();
        if(!isBatch){
            batchStep = 1;
        }
    }

    @Override
    public void save(JClass clz, String module) {
        //skip if class is exist

        //System.out.println("save " + clz.getName());
        String clzId = saveClass(clz.getName(),module);
        saveClassDependeces(clzId, clz.getDependences());
        saveClassMethods(clzId, clz.getMethods());
        saveClassFields(clzId,clz.getFields());
        saveClassParent(clzId,clz.getParents());

        count.incrementAndGet();
        if(count.get() == batchStep){
            flush();
            count.compareAndSet(batchStep,0);

        }

    }

    private boolean isClassExist(JClass clz) {
        Map<String,String> keys = new HashMap<>();
        keys.put("name",clz.getName());
        Optional<String> clzIdOpt = batch.findId("JClass",keys);
        return clzIdOpt.isPresent();
    }

    private void saveClassParent(String clzId, Set<String> parents) {
        for(String p:parents){
            String parentId = saveClass(p);
            doSaveClassParent(clzId,parentId);
        }
    }

    private void saveClassFields(String clzId, List<JField> fields) {
        for(JField f:fields){
            doSaveClassField(clzId,f);
        }
    }

    private void saveClassMethods(String clzId, List<JMethod> methods) {
        for (JMethod m : methods) {
            String mId = saveMethod(m);
            doSaveClassMethod(clzId, mId);
        }
    }

    private String saveMethod(JMethod m) {
        //find if exists
        String mId;
        Optional<String> id = findMethodId(m);
        mId = id.orElseGet(() -> doSaveMethod(m));
        for (JMethod _m : m.getCalls()) {
            saveMethodCall(mId, _m);
        }
        return mId;
    }


    private void saveMethodCall(String callerId, JMethod callee) {
        String _mId = saveMethod(callee);
        //save _MethodCall
        Map<String,String> callees = new HashMap<>();
        callees.put("id",generateId());
        callees.put("a",callerId);
        callees.put("b",_mId);
        batch.add("_MethodCallees",callees);

//        Map<String,String> callers = new HashMap<>();
//        callers.put("id",generateId());
//        callers.put("a",_mId);
//        callers.put("b",callerId);
//        batch.add("_MethodCaller",callers);
    }

    private void saveClassDependeces(String clzId, Set<String> dependences) {
        for (String clz : dependences) {
            String _clzId = saveClass(clz);
            //save _ClassDependence
            doSaveClassDependence(clzId, _clzId);
        }
    }

    private String saveClass(String name) {
        return saveClass(name,null);
    }

    private String saveClass(String name,String module) {
        Optional<String> idOpt = findClass(name);
        return idOpt.orElseGet(() -> doSaveClass(name, module));
    }


    private void doSaveClassField(String clzId, JField field) {
        String id = generateId();
        String time = getCurrentTime();
        Map<String,String> values = new HashMap<>();
        values.put("id",id);
        values.put("name",field.getName());
        values.put("type",field.getType());
        values.put("updatedAt",time);
        values.put("createdAt",time);
        batch.add("JField",values);

        Map<String,String> relation = new HashMap<>();
        relation.put("id",generateId());
        relation.put("a",clzId);
        relation.put("b",id);
        batch.add("_ClassFields",relation);
    }

    private void doSaveClassMethod(String clzId, String mId) {
        Map<String,String> values = new HashMap<>();
        values.put("id",generateId());
        values.put("a",clzId);
        values.put("b",mId);
        batch.add("_ClassMethods",values);
    }

    private void doSaveClassParent(String clzId,String parantClzId) {
        Map<String,String> values = new HashMap<>();
        values.put("id",generateId());
        values.put("a",clzId);
        values.put("b",parantClzId);
        batch.add("_ClassParent",values);
    }

    private String generateId() {
        return UUID.randomUUID().toString();
    }

    private Optional<String> findMethodId(JMethod m) {
        Map<String,String> keys = new HashMap<>();
        keys.put("clzname",m.getClz());
        keys.put("name",m.getName());
        return batch.findId("JMethod",keys);
    }

    private String doSaveMethod(JMethod m) {
        String mId = generateId();
        String time = getCurrentTime();
        Map<String,String> values = new HashMap<>();
        values.put("id",mId);
        values.put("clzname",m.getClz());
        values.put("name",m.getName());
        values.put("returntype",m.getReturnType());
        values.put("access",m.getAccess());
        values.put("updatedAt",time);
        values.put("createdAt",time);
        batch.add("JMethod",values);
        return mId;
    }


    private String doSaveClass(String name,String module) {
        String time = getCurrentTime();
        String clzId = generateId();

        Map<String,String> values = new HashMap<>();
        values.put("id",clzId);
        values.put("name",name);
        values.put("module",module);
        values.put("updatedAt",time);
        values.put("createdAt",time);
        if(module != null){
            values.put("module",module);
        }
        batch.add("JClass",values);
        return clzId;
    }

    private void doSaveClassDependence(String clzId,String _clzId) {
        Map<String,String> values = new HashMap<>();
        values.put("id",generateId());
        values.put("a",clzId);
        values.put("b",_clzId);
        batch.add("_ClassDependences",values);
    }

    private Optional<String> findClass(String name) {
        Map<String,String> keys = new HashMap<>();
        keys.put("name",name);
        return batch.findId("JClass",keys);
    }

    private void flush() {
        batch.execute();
    }

    public void close(){
        flush();
        batch.close();
    }
}
