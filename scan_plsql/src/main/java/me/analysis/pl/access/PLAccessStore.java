package me.analysis.pl.access;

import me.analysis.pl.utils.DateUtil;
import me.analysis.pl.utils.FileUtil;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class PLAccessStore {

    public void save(PLProcedureAccess v) {
        if(v.getName() == null) {
            return;
        }
        List<String> sqls = new ArrayList<>();
        v.getInsertTables().stream().forEach(t -> {
            String sql = operateTableToSQL(v.getPkg(),v.getName(),t,"INSERT");
            sqls.add(sql+";");
        });
        v.getQueryTables().stream().forEach(t -> {
            String sql = operateTableToSQL(v.getPkg(),v.getName(),t,"SELECT");
            sqls.add(sql+";");
        });
        v.getUpdateTables().stream().forEach(t -> {
            String sql = operateTableToSQL(v.getPkg(),v.getName(),t,"UPDATE");
            sqls.add(sql+";");
        });
        v.getDeleteTables().stream().forEach(t -> {
            String sql = operateTableToSQL(v.getPkg(),v.getName(),t,"DELETE");
            sqls.add(sql+";");
        });

        //store.flush();
        FileUtil.write(sqls,"PLProcedureSqlTable.sql");
    }


    private String operateTableToSQL(String clz, String method, String table, String operate) {
        String id = UUID.randomUUID().toString();
        String sql = String.format("INSERT INTO PLProcedureSqlTable (id,clz,`method`,`table`,operate,updatedAt,createdAt) VALUES ('%s','%s','%s','%s','%s','%s','%s')",
                id,clz,method,table,operate,date,date);
        return sql;
    }

    private String date = DateUtil.getCurrentTime();
}
