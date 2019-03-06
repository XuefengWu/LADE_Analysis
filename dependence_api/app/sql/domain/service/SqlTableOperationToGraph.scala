package sql.domain.service

import common.domain.{Edge, Graph, Node}
import sql.domain.model.TableMethodOperator

trait SqlTableOperationToGraph {

  def toGraph(operators: Seq[TableMethodOperator]):Graph = {
      val graphs = operators.map(operatorToGraph)
    Graph(graphs.map(_.nodes).flatten,graphs.map(_.edges).flatten)
  }

  def operatorToGraph(operator: TableMethodOperator):Graph = {
    val operatorClzNode = Node(operator.clz,operator.clz)
    val methodNodeId = operator.clz + operator.method
    val operatorMethodNode = Node(methodNodeId, operator.method)
    val clzMethodEdge = Edge(operator.clz, methodNodeId)
    val invokerNode = operator.invoker match {
      case "java_code" =>
        val invokerId = s"${operator.clz}_${operator.invoker}_${operator.op}"
        Node(invokerId,invokerId)
      case _ => Node(operator.invoker+operator.op,operator.invoker)
    }
    val methodInvokeEdge = Edge(methodNodeId,invokerNode.id)
    val tableCoumnNode = operator.column match {
      case Some(c) =>
        val tableColumnId = operator.table + "." + c
        Node(tableColumnId,tableColumnId)
      case None =>
        Node(operator.table,operator.table)
    }

    val invokerTableColumnEdge = Edge(invokerNode.id,tableCoumnNode.id,Seq(operator.op))
    val nodes = operatorClzNode :: operatorMethodNode :: invokerNode :: tableCoumnNode :: Nil
    val edges = clzMethodEdge :: methodInvokeEdge :: invokerTableColumnEdge :: Nil
    Graph(nodes,edges)
  }

}
