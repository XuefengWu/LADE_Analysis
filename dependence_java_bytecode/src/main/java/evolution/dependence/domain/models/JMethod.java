package evolution.dependence.domain.models;

import java.util.*;

public class JMethod {
    private String name;
    private String clz;
    private int access;
    private String returnType;
    private Set<JMethod> calls = new HashSet<>();

    public JMethod(String name, String clz) {
        this.name = name;
        this.clz = clz.replaceAll("/",".");
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClz() {
        return clz;
    }

    public void setClz(String clz) {
        this.clz = clz.replaceAll("/",".");
    }

    public Set<JMethod> getCalls() {
        return calls;
    }

    public String getAccess() {
        return access+"";
    }

    public void setAccess(int access) {
        this.access = access;
    }

    public void addCall(JMethod m) {
        if("<init>".equalsIgnoreCase(m.getName())){
            return;
        }
        this.calls.add(m);
    }

    public String getReturnType() {
        return returnType;
    }

    public void setReturnType(String returnType) {
        this.returnType = returnType.replaceAll("/",".");
    }

    public void addCalls(Set<JMethod> m) {
        this.calls.addAll(m);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        JMethod method = (JMethod) o;
        return Objects.equals(name, method.name) &&
                Objects.equals(clz, method.clz);
    }

    @Override
    public int hashCode() {

        return Objects.hash(name, clz);
    }

    @Override
    public String toString() {
        return "JMethod{" +
                "name='" + name + '\'' +
                ", clz='" + clz + '\'' +
                ", calls=" + calls +
                '}';
    }
}
