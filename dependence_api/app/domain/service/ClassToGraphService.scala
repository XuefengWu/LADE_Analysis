package domain.service

import domain.dto.{Edge, Graph, Node}
import domain.model.JClass

trait ClassToGraphService extends ToGraphService {
  self: ApplicationService =>

  protected def classToGraph(cs: Seq[JClass]):Graph = {
    cs.foldLeft(Graph()){(z,clz) => {
      val dependencees = clz.dependencees
      val dependenceesEdges = dependencees.map(dependencee => c2e(clz,dependencee)).filter(e => e.a != e.b)
      val dependencers = clz.dependencers
      val dependencerEdges = dependencers.map(caller => c2e(caller,clz)).filter(e => e.a != e.b)
      z.copy(nodes = z.nodes :+ c2n(clz,dependencers),edges = z.edges ++ dependenceesEdges ++ dependencerEdges)
    }}
  }

  private def c2n(clz: JClass,dependencees:Seq[JClass]):Node = {
    Node(clz.id,clz.name,nodeProperties(clz,dependencees))
  }

  private def nodeProperties(clz: JClass,dependencees:Seq[JClass]):Map[String,Any] = {
    val properties = if(dependencees.isEmpty){
      Map.empty[String,AnyVal]
    } else {
      Map("dependencees"->dependencees.size)
    }
    appendColor(clz.name,properties)
  }

  private def c2e(a:JClass,b:JClass):Edge={
    Edge(a.id,b.id)
  }

}
