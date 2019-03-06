package jv.domain.dto


case class SimpleClass(name: String)

case class SimpleMethod(clz:String,name: String)

case class VMethodInvoke(callerClass:String,callerMethod:String,calleeClass:String,calleeMethod:String)

case class Treemap(value:Int,name:String,path:String,children:Seq[Treemap] = Nil)