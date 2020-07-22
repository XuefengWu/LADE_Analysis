package dev.evolution.psql.callee

import dev.evolution.kt.ProcedureCallee
import dev.evolution.kt.ProcedureSpec
import dev.evolution.psql.declaration.PlSqlDeclarationRepository
import dev.evolution.util.FileUtil
import org.jdbi.v3.core.Handle
import org.jdbi.v3.core.Jdbi
import java.nio.file.Files
import java.nio.file.Paths
import java.nio.file.StandardOpenOption
import java.util.*
import kotlin.collections.HashMap

object PlSqlCalleeRepository {

    private val cache = HashMap<String,String>();

    fun save(callees: List<ProcedureCallee>) {
        //val dbi: Jdbi = Jdbi.create("jdbc:mysql://10.127.151.14:8306/default@default", "root", "prisma")
        //val handle = dbi.open()
        //val batch = handle.createBatch()
        callees.map { c -> appendID(c,null) }
                .filter { c -> c.aId.isPresent && c.bId.isPresent }
                .forEach{ c ->  FileUtil.write(toInsertSql(c),"CALLEE_INSERT.sql")}
        //batch.execute()
        //handle.close()
    }

    private fun appendID(callee: ProcedureCallee,handle:Handle?):ProcedureCallee {
        val aID = queryID(callee.a,handle)
        val bID = queryID(callee.b,handle)
        return callee.copy(aId = aID,bId = bID)
    }

    private fun toInsertSql(callee: ProcedureCallee):String {
        val sql = "INSERT INTO `_PLProcedureCallees` VALUES  ('${id()}','${callee.aId.get()}','${callee.bId.get()}')"
        //println(sql)
        return sql
    }



    private fun queryID(p:ProcedureSpec,handle:Handle?):Optional<String> {
        val pkg = p.pkg.toUpperCase().replace("\"","").trim()
        val name = p.name.toLowerCase().replace("\"","").trim()
        val key = "${pkg}_${name}"
        val value = cache[key]
        if(value != null) {
            return Optional.of(value)
        }
        /*val sql = "SELECT id FROM `PLProcedure` WHERE pkg = '${pkg}' AND name = '${name}'"
        val idOpt =  handle.createQuery(sql).mapTo(String::class.java).findFirst()
        val res = if(idOpt.isPresent) {
             idOpt
        } else {
            PlSqlDeclarationRepository.save(p,handle)
            handle.createQuery(sql).mapTo(String::class.java).findFirst()
        }
        */
        val id = PlSqlDeclarationRepository.save(p,handle)
        cache[key] = id
        return Optional.of(id)
    }

    private fun id(): String {
        return UUID.randomUUID().toString()
    }

}