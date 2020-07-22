package dev.evolution.psql.declaration

import java.io.File



fun main(args: Array<String>) {

    val dir = File("/Users/xfwu/Workspace/PICC/201908/cbs/cbs/src/main/plsql")
    var start = true
    for (f in dir.listFiles()){
        if(f.name.equals("R__MINUS_ONE.sql",true)){
                    start = true
        }
        if (start && f.isFile && f.name.endsWith(".sql")){
            parseFile(f.absolutePath)
        }
        if(f.isDirectory){
            parseDirectory(f)
        }
    }

}

private fun parseDirectory(dir: File) {
    for (f in dir.listFiles()){
        parseFile(f.absolutePath)
    }
}
private fun parseFile(path:String) {
    val ps = PlSqlDeclarationParser.processFile(path)
    PlSqlDeclarationRepository.save(ps)
}