package evolution.dependence.application.fix;

import evolution.dependence.application.VisitClass;
import evolution.dependence.domain.repository.IClassRepository;

import java.io.File;
import java.io.IOException;

public class FixClassModule {

    public static void main(String[] args) throws IOException, InterruptedException {

        VisitClass visitor = new VisitClass();
        if(args.length < 1) {
            System.out.println("Please input class directory");
        }
        String root = args[0];

        for(String f: new File(root).list()){
            if(new File(root+"/"+f).isDirectory()) {
                String dir = String.format("%s/%s/",root,f);
                System.out.println(dir);
                IClassRepository repo = new FixClassModuleRepository();
                visitor.visitDir(dir, f,repo);
            }
        }

    }

}
