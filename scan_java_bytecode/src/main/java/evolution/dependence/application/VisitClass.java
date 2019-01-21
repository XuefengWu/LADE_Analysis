package evolution.dependence.application;


import evolution.dependence.application.fix.*;
import evolution.dependence.domain.repository.ClassRepository;
import evolution.dependence.domain.repository.IClassRepository;
import evolution.dependence.domain.scan.asm.ClassPaser;
import evolution.dependence.domain.scan.asm.ProcessFiles;
import evolution.dependence.domain.models.JClass;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Consumer;

public class VisitClass {

    private ClassPaser paser = new ClassPaser();

    private AtomicInteger count = new AtomicInteger();

    public static void main(final String args[]) throws Exception {
        if(args.length < 1) {
            System.out.println("Please input class directory");
        }
        String dir = args[0];
        System.out.println("analysis classes dir: " + dir);
        long start = System.currentTimeMillis();
        VisitClass visitor = new VisitClass();
        try {
            DeleteAll.main(new String[]{});
            String[] ss = dir.split("/");
            visitor.visitDir(dir,ss[ss.length-1], new ClassRepository());

            FixClassDuplicate.main(new String[]{});
            FixMethodDuplicate.main(new String[]{});
            FixClassModule.main(args);
        } finally {
            long finished = System.currentTimeMillis();
            System.out.println(String.format("total:%d,spend:%d", visitor.getCount(),(finished - start) / 1000));
        }
    }

    public void visitDir(String dir,String module, IClassRepository repo) throws IOException, InterruptedException {
        Path startingDir = Paths.get(dir);
        Consumer<Path> fileAnalysis = visitFile(repo,module);
        int poolSize = 16;
//        ExecutorService pool = Executors.newFixedThreadPool(poolSize);
        ProcessFiles pf = new ProcessFiles(fileAnalysis);
        Files.walkFileTree(startingDir, pf);
//        while (!pool.isTerminated()){
//            pool.awaitTermination(100,TimeUnit.SECONDS);
//        }
//        pool.shutdown();
        repo.close();
    }

    private Consumer<Path> visitFile(IClassRepository repo,String module) {
        return (Path path) -> {
            try {
                if (path.toString().endsWith(".class")) {
                    JClass clz = paser.visitClass(path);
                    count.incrementAndGet();
                    repo.save(clz,module);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        };
    }

    public int getCount() {
        return count.get();
    }
}
