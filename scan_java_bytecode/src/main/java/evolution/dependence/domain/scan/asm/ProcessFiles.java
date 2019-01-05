package evolution.dependence.domain.scan.asm;


import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.concurrent.ExecutorService;
import java.util.function.Consumer;

import static java.nio.file.FileVisitResult.CONTINUE;

public class ProcessFiles extends SimpleFileVisitor<Path> {

    private final Consumer<Path> process;
    private final ExecutorService pool;
    public ProcessFiles(Consumer<Path> process, ExecutorService pool) {
        this.pool = pool;
        this.process = process;
    }
    public ProcessFiles(Consumer<Path> process) {
        this.pool = null;
        this.process = process;
    }
    // Print information about
    // each type of file.
    @Override
    public FileVisitResult visitFile(Path file,
                                     BasicFileAttributes attr) {
        if (attr.isSymbolicLink()) {
            //System.out.format("Symbolic link: %s ", file);
        } else if (attr.isRegularFile()) {
//            System.out.format("Regular file: %s , name: %s ", file, file.getFileName());
//            System.out.format("%s, %s",file.endsWith("java"),file.toString().endsWith(".java"));
//            System.out.println("(" + attr.size() + "bytes)");
        } else {
            //System.out.format("Other: %s ", file);
        }

        if (attr.isRegularFile()) {
            //System.out.format("Regular file: %s ", file);
            //System.out.println("(" + attr.size() + "bytes)");
            if (pool != null) {
                pool.submit(() -> process.accept(file));
            } else {
                process.accept(file);
            }
        }
        return CONTINUE;
    }

    // Print each directory visited.
    @Override
    public FileVisitResult postVisitDirectory(Path dir,
                                              IOException exc) {
        //System.out.format("Directory: %s%n", dir);
        return CONTINUE;
    }

    // If there is some error accessing
    // the file, let the user know.
    // If you don't override this method
    // and an error occurs, an IOException
    // is thrown.
    @Override
    public FileVisitResult visitFileFailed(Path file,
                                           IOException exc) {
        System.err.println(exc);
        return CONTINUE;
    }


}
