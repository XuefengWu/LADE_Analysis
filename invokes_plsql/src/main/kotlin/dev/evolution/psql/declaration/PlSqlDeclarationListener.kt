package dev.evolution.psql.declaration


import dev.evolution.kt.ProcedureSpec
import dev.evolution.plsql.PlSqlBaseListener
import dev.evolution.plsql.PlSqlParser

class PlSqlDeclarationListener(val procedures:MutableSet<ProcedureSpec>): PlSqlBaseListener() {

    private var packageName = ""

    override fun enterCreate_package(ctx: PlSqlParser.Create_packageContext?) {
        packageName = ctx!!.package_name(0).text
        super.enterCreate_package(ctx)
    }

    override fun enterProcedure_body_spec(ctx: PlSqlParser.Procedure_body_specContext?) {
        val name = ctx!!.procedure_name().text
        procedures.add(ProcedureSpec(packageName,name))
        super.enterProcedure_body_spec(ctx)
    }

    override fun enterFunction_body_spec(ctx: PlSqlParser.Function_body_specContext?) {
        val name = ctx!!.function_name().text
        procedures.add(ProcedureSpec(packageName,name))
        super.enterFunction_body_spec(ctx)
    }


}