package domain.dto

case class Node(id:String,title:String,properties:Map[String,Any]=Map.empty,parent:Option[Node]=None)

case class Edge(a:String,b:String,labels:Seq[String]=Nil)

case class Graph(nodes:Seq[Node]=Nil,edges:Seq[Edge]=Nil)

case class SimpleClass(name: String)

case class SimpleMethod(clz:String,name: String)

case class VMethodInvoke(callerClass:String,callerMethod:String,calleeClass:String,calleeMethod:String)
