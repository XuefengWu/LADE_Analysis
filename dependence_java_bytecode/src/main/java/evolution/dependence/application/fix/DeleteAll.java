package evolution.dependence.application.fix;

public class DeleteAll {

    public static void main(String[] args){
        FixMethodDuplicate.FixRepository repo = new FixMethodDuplicate.FixRepository();
        String[] tables = new String[]{"_ClassFields","_ClassMethods","_ClassParent","_MethodCallees","_ClassDependences","_MethodCaller",
                "JClass","JField","JMethod"};
        for(String table:tables){
            System.out.println("delete: " + table);
            repo.deleteAll(table);
        }
    }

}
