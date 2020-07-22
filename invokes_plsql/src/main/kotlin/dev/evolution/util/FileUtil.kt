package dev.evolution.util

import java.io.File
import java.nio.file.Files
import java.nio.file.Paths
import java.nio.file.StandardOpenOption

object FileUtil {

    fun write(sql: String, file: String) {
        val f = File(file)
        if (!f.exists()) {
            f.createNewFile();
        }
        Files.write(
                Paths.get(file),
                ("$sql;\n").toByteArray(),
                StandardOpenOption.APPEND);
    }

}