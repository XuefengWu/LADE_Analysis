package evolution.dependence.domain.models;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class JClass {
    private String name;
    private List<JMethod> methods = new ArrayList<>();
    private Set<String> dependences = new HashSet<>();
    private List<JField> fields = new ArrayList<>();
    private Set<String> parents = new HashSet<>();

    public void addParent(String parent){
        if(!parent.startsWith("java")){
            parents.add(parent.replaceAll("/","."));
        }
    }

    public String getName() {
        return name.replaceAll("/",".");
    }

    public void setName(String name) {
        this.name = name.replaceAll("/",".");
    }

    public List<JMethod> getMethods() {
        return methods;
    }

    public Set<String> getDependences() {
        return dependences;
    }

    public void addMethod(JMethod m) {
        this.methods.add(m);
    }

    public void addField(String name,String type){
        fields.add(new JField(name,type));
    }

    public List<JField> getFields() {
        return fields;
    }

    public Set<String> getParents() {
        return parents;
    }

    public void addCall(JMethod m) {
        if("<init>".equalsIgnoreCase(m.getName())){
            return;
        }
        List<JMethod> methodList = methods.stream().filter(v -> v.getName().equalsIgnoreCase(m.getName()) && v.getClz().equalsIgnoreCase(m.getClz())).collect(Collectors.toList());
        if(methodList.size() > 0) { //only save one method name
            JMethod _m = methodList.get(0);
            _m.addCalls(m.getCalls());
        } else {
            this.methods.add(m);
        }
    }

    public void addDependence(String m) {
        this.dependences.add(m.replaceAll("/","."));
    }

    @Override
    public String toString() {
        return "JClass{" +
                "name='" + name + '\'' +
                ", methods=" + methods +
                ", dependences=" + dependences +
                '}';
    }
}
