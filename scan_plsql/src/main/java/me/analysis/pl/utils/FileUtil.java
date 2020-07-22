package me.analysis.pl.utils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;

public class FileUtil {

    public static void write(List<String> sqls, String path) {
        Path file = Paths.get(path);
        if(!file.toFile().exists()){
            try {
                file.toFile().createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            Files.write(file, sqls, StandardCharsets.UTF_8, StandardOpenOption.APPEND);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<String> read(String path) throws IOException {
        Path file = Paths.get(path);
        return Files.readAllLines(file);
    }

    public static void delete(String path) throws IOException {
        Path file = Paths.get(path);
        if(file.toFile().exists()){
            Files.delete(file);
        }
    }

}
