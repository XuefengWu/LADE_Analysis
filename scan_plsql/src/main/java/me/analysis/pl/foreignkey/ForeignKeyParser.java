package me.analysis.pl.foreignkey;

import me.analysis.sql.SqlLexer;
import me.analysis.sql.SqlParser;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.IOException;
import java.nio.file.Path;

public class ForeignKeyParser {

    public static ParseTree parse(Path path) throws IOException {
        CharStream stream = CharStreams.fromPath(path);
        SqlLexer lexer = new SqlLexer(stream);
        CommonTokenStream tokens = new CommonTokenStream( lexer );
        SqlParser parser = new SqlParser(tokens);
        System.out.println("start parse");
        return parser.parse();
    }
}
