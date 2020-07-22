package me.analysis.pl.select;

import me.analysis.pl.generated.PlSqlLexer;
import me.analysis.pl.generated.PlSqlParser;
import me.analysis.pl.select.model.SqlSelect;
import me.analysis.pl.select.model.Table;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class PLSqlSelectParser {

    public SqlSelect processFile(String file) throws IOException {
        System.out.println("Start " + file);
        Path path = Paths.get(file);
        ParseTree tree = parse(path);
        SqlSelect select = walk(tree,path.getFileName().toString());
        System.out.println(select);
        List<Table> tables = select.getFromTables();

        select.getResultTableColumns().forEach(v -> {
            if(!v.hasTableName()){
                v.setTableName(getTableNameByAlias(v.getTableAlias(), tables));
            }
        });
        select.getConditionTableColumns().forEach(v -> {
            if(!v.hasTableName()){
                v.setTableName(getTableNameByAlias(v.getTableAlias(), tables));
            }
        });
        return select;
    }

    private ParseTree parse(Path path) throws IOException {
        String context = Files.lines(path, StandardCharsets.UTF_8).reduce("",(a,b)->a+b);
        return parse(context);
    }

    private ParseTree parse(String context) throws IOException {
        CharStream stream = CharStreams.fromString(context);
        PlSqlLexer lexer = new PlSqlLexer(stream);
        CommonTokenStream tokens = new CommonTokenStream( lexer );
        PlSqlParser parser = new PlSqlParser(tokens);
        ParseTree tree = parser.compilation_unit();
        return tree;
    }

    private SqlSelect walk(ParseTree tree,String name) {
        ParseTreeWalker walker = new ParseTreeWalker();
        SqlSelect select = new SqlSelect(name);
        PLSqlSelectListener listener = new PLSqlSelectListener(select);
        walker.walk(listener,tree);
        return select;
    }

    private String getTableNameByAlias(String alias,List<Table> tables) {
        Optional<Table> t = tables.stream().filter(v -> v.getAlias() != null).filter(v -> v.getAlias().equalsIgnoreCase(alias)).findAny();
        if(!t.isPresent()){
            System.out.println("look up TableName for "+ alias);
        }
        if(!t.isPresent()){
            return alias;
        }
        return t.get().getName();
    }

}
