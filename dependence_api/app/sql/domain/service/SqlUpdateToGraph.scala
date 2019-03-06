package sql.domain.service

import common.domain.Graph
import sql.domain.model.SqlAction

trait SqlUpdateToGraph extends ToGraph {
  self: SqlApplicationService =>

  def updateToGraph(selects: Seq[SqlAction]):Graph =
    selects.map(v => updateToGraph(v)).foldLeft(Graph())((acc,z) => Graph(acc.nodes ++ z.nodes,acc.edges ++ z.edges))

  private def updateToGraph(select: SqlAction):Graph = toGraph(select,"Update")



}
