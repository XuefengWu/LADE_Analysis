package sql.domain.service

import common.domain.{Edge, Graph, Node}
import sql.domain.model._


trait SelectToGraph extends ToGraph {

  self: SqlApplicationService =>

  def selectToGraph(selects: Seq[SqlAction]):Graph =
    selects.map(v => selectToGraph(v)).foldLeft(Graph())((acc,z) => Graph(acc.nodes ++ z.nodes,acc.edges ++ z.edges))

  private def selectToGraph(select: SqlAction):Graph = toGraph(select,"Select")


}
