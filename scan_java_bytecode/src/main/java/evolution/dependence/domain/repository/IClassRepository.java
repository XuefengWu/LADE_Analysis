package evolution.dependence.domain.repository;

import evolution.dependence.domain.models.JClass;

public interface IClassRepository {
    public void save(JClass clz,String module);
    public void close();
}
