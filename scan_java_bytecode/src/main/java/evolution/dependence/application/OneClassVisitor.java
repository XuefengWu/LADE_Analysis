package evolution.dependence.application;

import evolution.dependence.domain.models.JClass;
import evolution.dependence.domain.models.JMethod;
import evolution.dependence.domain.repository.ClassRepository;
import evolution.dependence.domain.scan.asm.ClassPaser;


import java.nio.file.Path;
import java.nio.file.Paths;

public class OneClassVisitor {

    public static void main(final String args[]) throws Exception {

        ClassPaser paser = new ClassPaser();
        if(args.length < 1) {
            System.out.println("Please input class full path");
        }
        String clzPath = args[0];
        Path path = Paths.get(clzPath);
        JClass jclass = paser.visitClass(path);
        System.out.println(jclass);
        System.out.println(jclass.getMethods());
        System.out.println("jclass.getMethods() size:" + jclass.getMethods().size());
        for(JMethod m:jclass.getMethods()){
            System.out.println(m.getName()+ " call: " + m.getCalls());
        }
        //ClassRepository repo = new ClassRepository(false);
        //repo.save(jclass,null);
    }

}
