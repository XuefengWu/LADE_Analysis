package me.analysis.pl.select;

import me.analysis.pl.select.model.SqlSelect;
import me.analysis.pl.select.model.Table;
import me.analysis.sql.SqlLexer;
import me.analysis.sql.SqlParser;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.IOException;
import java.nio.file.Path;
import java.util.List;
import java.util.Optional;

public class SqlSelectParser {


    private static ParseTree doParse(Path path) throws IOException {
        CharStream stream = CharStreams.fromPath(path);
        SqlLexer lexer = new SqlLexer(stream);
        CommonTokenStream tokens = new CommonTokenStream( lexer );
        SqlParser parser = new SqlParser(tokens);
        System.out.println("start parse:"+path.getFileName());
        return parser.parse();
    }

    public static SqlSelect parse(Path path,String name) throws IOException {
        ParseTree tree = doParse(path);
        SqlSelect select = new SqlSelect(name);
        tree.accept(new SqlSelectVisitor(select));
        List<Table> tables = select.getFromTables();

        select.getResultTableColumns().forEach(v -> v.setTableName(getTableNameByAlias(v.getTableAlias(),tables)));
        select.getConditionTableColumns().forEach(v -> v.setTableName(getTableNameByAlias(v.getTableAlias(),tables)));
        return select;
    }

    private static String getTableNameByAlias(String alias,List<Table> tables) {
        Optional<Table> t = tables.stream().filter(v -> v.getAlias().equalsIgnoreCase(alias)).findAny();
        if(!t.isPresent()){
            System.out.println("look up TableName for "+ alias);
        }
        return t.get().getName();
    }

}
