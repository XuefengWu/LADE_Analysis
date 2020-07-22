package dev.evolution.psql.declaration

import dev.evolution.kt.ProcedureSpec
import dev.evolution.psql.callee.PlSqlCalleeRepository
import dev.evolution.util.FileUtil
import org.jdbi.v3.core.Handle
import java.util.*
import org.jdbi.v3.core.Jdbi

object PlSqlDeclarationRepository {

    fun save(ps: Set<ProcedureSpec>) {
        //val dbi: Jdbi = Jdbi.create("jdbc:mysql://10.127.151.14:8306/default@default", "root", "prisma")
        //val handle = dbi.open()
        //val batch = handle.createBatch()
        //ps.forEach{ p ->  batch.add(toSql(p))}
        ps.forEach{ p ->  FileUtil.write(toSql(id(),p),"Procedure_INSERT.sql")}

        //batch.execute()
        //handle.close()
    }

    fun save(p:ProcedureSpec,handle: Handle?):String{
        val id = id()
        val sql = toSql(id,p)
        if(handle == null) {
            FileUtil.write(sql,"Procedure_INSERT.sql")
        } else {
            handle.execute(sql)
        }
        return id
    }

    private fun toSql(id:String,p:ProcedureSpec) :String {
        val time = getCurrentTime()
        val pkg = p.pkg.toUpperCase().replace("\"","").trim()
        val name = p.name.toLowerCase().replace("\"","").trim()
        val sql = "INSERT INTO `PLProcedure` VALUES  ('${id}','$name','$pkg','cbs','$time','$time')"
        return sql
    }

    private fun getCurrentTime(): String {
        val dt = Date()
        val sdf = java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
        return sdf.format(dt)
    }

    private fun id(): String {
        return UUID.randomUUID().toString()
    }

}