package evolution.dependence.application.fix;

public class FixUUIDColumn {

    public static void main(String[] args){
        FixMethodDuplicate.FixRepository repo = new FixMethodDuplicate.FixRepository();
        String[] tables = new String[]{"_ClassFields","_ClassMethods","_ClassParent","_MethodCallees","_ClassDependences","_MethodCaller",
                "JClass","JField","JMethod"};
        for(String table:tables){
            System.out.println(table);
            repo.alertToChar36(table,"id");
        }
        for(String table:tables) {
            if (table.startsWith("_")) {
                repo.alertToChar36(table, "a");
                repo.alertToChar36(table, "b");
            }
        }
    }

}
