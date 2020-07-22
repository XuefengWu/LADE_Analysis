package me.analysis.pl.view;

import me.analysis.pl.generated.PlSqlLexer;
import me.analysis.pl.generated.PlSqlParser;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class PLViewParser {


    public static List<PLView> processFile(String file) throws IOException {

        System.out.println("Start " + file);

        CharStream stream = CharStreams.fromPath(Paths.get(file));
        PlSqlLexer lexer = new PlSqlLexer(stream);
        CommonTokenStream tokens = new CommonTokenStream( lexer );
        PlSqlParser parser = new PlSqlParser(tokens);
        ParseTree tree = parser.compilation_unit();
        List<PLView> views = new ArrayList<>();
        PLViewVisitor visitor = new PLViewVisitor(views);
        visitor.visit(tree);
        return views;
    }

}
