package dev.evolution.kt

import java.util.*


data class ProcedureSpec(val pkg:String,val name:String)

data class ProcedureCallee(val a:ProcedureSpec, val aId: Optional<String> =Optional.empty(), val b:ProcedureSpec, val bId: Optional<String> =Optional.empty())