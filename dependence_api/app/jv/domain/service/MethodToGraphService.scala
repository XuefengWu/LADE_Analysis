package jv.domain.service

import common.domain.{Edge, Graph, Node}
import jv.domain.model.JMethod

trait MethodToGraphService extends ConfigureService{
  self: ApplicationService =>


  def methodToGraph(ms: Seq[JMethod]):Graph = {
    val parents: Seq[JMethod] = ms.map(_.parent).filter(_.isDefined).map(_.get)
    ms.foldLeft(Graph()){(z,method) => {
      val callees = method.callees
      val calleesEdges = callees.map(callee => m2e(method,callee))
      val callers = method.callers
      val callerEdges = callers.map(caller => m2e(caller,method))
      val edgeSeq = (z.edges ++ calleesEdges ++ callerEdges).filterNot(v => v.a == v.b)
      z.copy(nodes = z.nodes :+ m2n(method,callees,parents),edges = edgeSeq)
    }}
  }

  private def m2n(m: JMethod,callees:Seq[JMethod],parents: Seq[JMethod]):Node = {
    Node(m.id,m.clz+"."+m.name,nodeProperties(m, callees, parents))
  }

  private def nodeProperties(m: JMethod, callees: Seq[JMethod], parents: Seq[JMethod]) = {
    val properties = if(callees.isEmpty){
      Map("callers"-> m.callerSize)
    } else {
      Map("callers" -> m.callerSize, "callees" -> callees.size)
    }
    val isParent = parents.find(_.id == m.id).isDefined
    if(isParent) {
      properties + ("parent"->true)
    }
    properties ++ getNodeColorConfigure(m.clz)
  }

  private def m2e(a:JMethod, b:JMethod):Edge={
    if(b.parent.isDefined && b.parent.get.id.equalsIgnoreCase(a.id)) {
      Edge(a.id,b.id,List("parent"))
    }
    else {
      Edge(a.id,b.id)
    }
  }

}
