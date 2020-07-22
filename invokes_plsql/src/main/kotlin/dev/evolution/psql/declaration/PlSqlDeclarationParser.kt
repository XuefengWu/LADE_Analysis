package dev.evolution.psql.declaration

import dev.evolution.kt.ProcedureSpec
import dev.evolution.plsql.PlSqlLexer
import dev.evolution.plsql.PlSqlParser
import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.tree.ParseTree
import org.antlr.v4.runtime.tree.ParseTreeWalker
import java.io.IOException
import java.nio.file.Path
import java.nio.file.Paths

object PlSqlDeclarationParser {


    @Throws(IOException::class)
    fun processFile(file: String): Set<ProcedureSpec> {
        println("Start $file")
        val path = Paths.get(file)
        val tree = parse(path)
        return walk(tree)
    }

    @Throws(IOException::class)
    private fun parse(path: Path): ParseTree {
        val stream = CharStreams.fromPath(path)
        val lexer =  PlSqlLexer(stream)
        val tokens = CommonTokenStream(lexer)
        val parser = PlSqlParser(tokens)
        return parser.compilation_unit()
    }

    private fun walk(tree: ParseTree): Set<ProcedureSpec> {
        val walker = ParseTreeWalker()
        val declarations = HashSet<ProcedureSpec>()
        walker.walk(PlSqlDeclarationListener(declarations), tree)
        return declarations
    }

}