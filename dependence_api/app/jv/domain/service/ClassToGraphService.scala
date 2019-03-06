package jv.domain.service

import common.domain.{Edge, Graph, Node}
import jv.domain.model.{JClass,ClassCallee}

trait ClassToGraphService extends ConfigureService {
  self: ApplicationService =>

  def classCalleesToGraph(cc:Seq[ClassCallee]): Graph = {
    val clzs = cc.flatMap(v => Seq(v.a,v.b)).distinct
    val nodes = clzs.map(v => Node(v,v))
    val edges = cc.map(v => Edge(v.a,v.b,  v.properties :+ v.count.toString)).filterNot(v => v.a == v.b)
    Graph(nodes,edges)
  }

  protected def classToGraph(cs: Seq[JClass]):Graph = {
    cs.foldLeft(Graph()){(z,clz) => {
      val dependencees = clz.dependencees
      val dependenceesEdges = clz.dependencees.map(dependencee => c2e(clz,dependencee)).filter(e => e.a != e.b)
      val dependencersNode = c2n(clz,clz.dependencers)
      val dependencerEdges = clz.dependencers.map(caller => c2e(caller,clz)).filter(e => e.a != e.b)
      val parentEdges = clz.parents.map(p => c2e(clz,p,true)).filter(e => e.a != e.b)
      z.copy(nodes = z.nodes :+ dependencersNode,
             edges = z.edges ++ dependenceesEdges ++ dependencerEdges ++ parentEdges)
    }}
  }

  private def c2n(clz: JClass,dependencees:Seq[JClass] = Nil):Node = {
    Node(clz.id,clz.name,nodeProperties(clz,dependencees))
  }

  private def nodeProperties(clz: JClass,dependencees:Seq[JClass]):Map[String,Any] = {
    val properties = if(dependencees.isEmpty){
      Map.empty[String,AnyVal]
    } else {
      Map("dependencees"->dependencees.size)
    }
    properties ++ getNodeColorConfigure(clz.name)
  }

  private def c2e(a:JClass,b:JClass,isParent:Boolean = false):Edge={
    if(isParent) {
      Edge(a.id,b.id,List("parent"))
    } else {
      Edge(a.id,b.id)
    }
  }

}
