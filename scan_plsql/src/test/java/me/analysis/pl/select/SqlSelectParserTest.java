package me.analysis.pl.select;

import me.analysis.pl.select.model.SqlSelect;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Paths;

public class SqlSelectParserTest extends SelectParserBasicTest{

    @Test
    public void complex_where_subselect() throws IOException {
        String fileName = given_file("complex_where_subselect.sql");
        SqlSelect select = when_parse(fileName);
        then_assertTableNameIsNotNull(select);
    }

    @Test
    public void simple_select1_where1() throws IOException {
        String fileName = given_file("simple_select1_where1.sql");
        SqlSelect select = when_parse(fileName);
        then_assertTableNameIsNotNull(select);
    }

    @Test
    public void simple_select1_where2() throws IOException {
        String fileName = given_file("simple_select1_where2.sql");
        SqlSelect select = when_parse(fileName);
        then_assertTableNameIsNotNull(select);
    }





}
