package evolution.dependence.application.fix;

import java.util.List;

public class FixClassDuplicate {

    public static void main(String[] args) {
        FixMethodDuplicate.FixRepository repo = new FixMethodDuplicate.FixRepository();
        List<String> clzs = repo.findDuplicateClass();
        System.out.println("Duplicate class: " + clzs.size());
        for(String clz: clzs) {
            System.out.println("Duplicate class: " + clz);
            List<String> ids = repo.findClassByName(clz);
            String theId = ids.get(0);
            for (int i = 1; i < ids.size(); i++) {
                String otherId = ids.get(i);
                repo.updateOneColumn("_ClassDependences",otherId,"a",theId);
                repo.updateOneColumn("_ClassDependences",otherId,"b",theId);
                repo.updateOneColumn("_ClassMethods",otherId,"a",theId);
                repo.deleteOne("JClass",otherId);
            }
        }
    }

}
