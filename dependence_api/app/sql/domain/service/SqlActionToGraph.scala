package sql.domain.service

import common.domain.Graph
import sql.domain.model.SqlAction

trait SqlActionToGraph extends SelectToGraph with SqlUpdateToGraph {
  self: SqlApplicationService =>

  def toGraph(action: SqlAction):Graph = {
    System.out.println("SqlActionToGraph.toGraph"+action)
    action.action match {
      case "select" => selectToGraph(Seq(action))
      case "update" => updateToGraph(Seq(action))
      case _ => Graph()
    }

  }

}
