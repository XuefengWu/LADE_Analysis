package dev.evolution.psql.callee

import dev.evolution.kt.ProcedureCallee
import dev.evolution.kt.ProcedureSpec
import dev.evolution.plsql.PlSqlBaseListener
import dev.evolution.plsql.PlSqlParser

class PlSqlCalleeListener(val callees:ArrayList<ProcedureCallee>): PlSqlBaseListener() {

    private var packageName = ""
    private var currentProcedure = ProcedureSpec(packageName,"")
    override fun enterCreate_package(ctx: PlSqlParser.Create_packageContext?) {
        packageName = ctx!!.package_name(0).text
        super.enterCreate_package(ctx)
    }

    override fun enterCreate_package_body(ctx: PlSqlParser.Create_package_bodyContext?) {
        packageName = ctx!!.package_name(0).text
        super.enterCreate_package_body(ctx)
    }

    override fun enterProcedure_body_spec(ctx: PlSqlParser.Procedure_body_specContext?) {
        val name = ctx!!.procedure_name().text
        currentProcedure = ProcedureSpec(packageName,name)
        super.enterProcedure_body_spec(ctx)
    }

    override fun enterFunction_body_spec(ctx: PlSqlParser.Function_body_specContext?) {
        val name = ctx!!.function_name().text
        currentProcedure = ProcedureSpec(packageName,name)
        super.enterFunction_body_spec(ctx)
    }

    override fun enterStrict_function_call(ctx: PlSqlParser.Strict_function_callContext?) {
        buildCallee(ctx!!.routine_name())
        super.enterStrict_function_call(ctx)
    }

    override fun enterFunction_call(ctx: PlSqlParser.Function_callContext?) {
        buildCallee(ctx!!.routine_name())
        super.enterFunction_call(ctx)
    }

    override fun enterProcedure_call(ctx: PlSqlParser.Procedure_callContext?) {
        buildCallee(ctx!!.routine_name())
        super.enterProcedure_call(ctx)
    }

    private fun buildCallee(routineNameCtx:PlSqlParser.Routine_nameContext) {
        val routineName = routineNameCtx.text
        val b = if (routineName.contains('.')) {
            val rs = routineName.split(".")
            ProcedureSpec(rs[0],rs[1])
        } else {
            ProcedureSpec(packageName,routineName)
        }
        val callee = ProcedureCallee(a= currentProcedure,b=b)
        callees.add(callee)
    }

}