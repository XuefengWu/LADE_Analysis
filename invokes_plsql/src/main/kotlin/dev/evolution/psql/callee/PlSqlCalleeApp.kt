package dev.evolution.psql.callee

import dev.evolution.kt.ProcedureCallee
import dev.evolution.psql.declaration.PlSqlDeclarationParser
import dev.evolution.psql.declaration.PlSqlDeclarationRepository
import java.io.File

fun main(args: Array<String>) {

    var path = "."
    if(args.size > 0) {
        path = args[0]
    }else{
        println("Please input plsql source code path, or scan current path")
    }
    val dir = File(path)
    var count = 0
    for (f in dir.listFiles()){
        if (f.isFile && f.name.endsWith(".sql")){
            val ps = parseFile(f.absolutePath)
            count = count + ps.size
            println("total size is ${count}")
            PlSqlCalleeRepository.save(ps)
        }
        if(f.isDirectory){
            val ps = parseDirectory(f)
            count = count + ps.size
            println("total size is ${count}")
            PlSqlCalleeRepository.save(ps)
        }
    }

}

private fun parseDirectory(dir: File):List<ProcedureCallee>  {
    val list = ArrayList<ProcedureCallee>()
    for (f in dir.listFiles()){
        list.addAll(parseFile(f.absolutePath))
    }
    return list
}

private fun parseFile(path:String):List<ProcedureCallee> {
    return PlSqlCalleeParser.processFile(path)

}