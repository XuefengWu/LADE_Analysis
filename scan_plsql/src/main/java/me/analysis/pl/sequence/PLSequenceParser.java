package me.analysis.pl.sequence;

import me.analysis.pl.generated.PlSqlLexer;
import me.analysis.pl.generated.PlSqlParser;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class PLSequenceParser {


    public List<PLProcedureSequence> processFile(String file) throws IOException {
        System.out.println("Start " + file);
        Path path = Paths.get(file);
        ParseTree tree = parse(path);
        return walk(tree);
    }

    private ParseTree parse(Path path) throws IOException {
        CharStream stream = CharStreams.fromPath(path);
        PlSqlLexer lexer = new PlSqlLexer(stream);
        CommonTokenStream tokens = new CommonTokenStream( lexer );
        PlSqlParser parser = new PlSqlParser(tokens);
        ParseTree tree = parser.compilation_unit();
        return tree;
    }

    private List<PLProcedureSequence> walk(ParseTree tree) {
        ParseTreeWalker walker = new ParseTreeWalker();
        List<PLProcedureSequence> procedures = new ArrayList<>();
        PLSequenceListener listener = new PLSequenceListener(procedures);
        walker.walk(listener,tree);

        return procedures;
    }

}
