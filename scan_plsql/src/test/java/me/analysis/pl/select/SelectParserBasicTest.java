package me.analysis.pl.select;

import me.analysis.pl.select.model.SqlSelect;
import org.junit.jupiter.api.Assertions;

import java.io.IOException;
import java.nio.file.Paths;

public class SelectParserBasicTest {

    private static final String ROOT_DIR = "./src/test/resources/sql/select/";

    protected String given_file(String fileName) {
        return ROOT_DIR + fileName;
    }

    protected SqlSelect when_plsql_parse(String fileName) throws IOException {
        PLSqlSelectParser parser = new PLSqlSelectParser();
        return parser.processFile(fileName);
    }

    protected SqlSelect when_parse(String fileName) throws IOException {
        return SqlSelectParser.parse(Paths.get(fileName), Paths.get(fileName).getFileName().toString());
    }

    protected void then_assertTableNameIsNotNull(SqlSelect select) {
        System.out.println(select);
        select.getFromTables().forEach(v -> Assertions.assertNotNull(v.getName()));
        select.getResultTableColumns().forEach(v -> Assertions.assertNotNull(v.getTableName()));
        select.getConditionTableColumns().forEach(v -> Assertions.assertNotNull(v.getTableName()));
    }
}
