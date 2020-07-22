package me.analysis.pl.access;

import me.analysis.pl.generated.PlSqlLexer;
import me.analysis.pl.generated.PlSqlParser;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.Set;

public class PLAccessParser {


    public  Set<PLProcedureAccess> processFile(String file) throws IOException {

        System.out.println("Start " + file);

        CharStream stream = CharStreams.fromPath(Paths.get(file));
        PlSqlLexer lexer = new PlSqlLexer(stream);
        CommonTokenStream tokens = new CommonTokenStream( lexer );
        PlSqlParser parser = new PlSqlParser(tokens);
        ParseTree tree = parser.compilation_unit();
        Set<PLProcedureAccess> procedures  = new HashSet<>();
        String[] fileSplits = file.split("/");
        PLAccessVisitor visitor = new PLAccessVisitor(procedures, fileSplits[fileSplits.length-1]);
        visitor.visit(tree);
        return procedures;
    }

}
