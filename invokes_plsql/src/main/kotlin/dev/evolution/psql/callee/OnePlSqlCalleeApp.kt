package dev.evolution.psql.callee

import dev.evolution.kt.ProcedureCallee
import dev.evolution.psql.declaration.PlSqlDeclarationParser
import dev.evolution.psql.declaration.PlSqlDeclarationRepository
import java.io.File

fun main(args: Array<String>) {
    val file = "/Users/xfwu/Workspace/PICC/201908/cbs/cbs/src/main/plsql/R__PKG_LIFE_PS_CONFIRM_PS_INCOME2.sql"
    val pc = parseFile(file)
    pc.forEach{p -> println(p)}
}

private fun parseFile(path:String):List<ProcedureCallee> {
    return PlSqlCalleeParser.processFile(path)

}