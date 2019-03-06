package sql.domain.service

import common.domain.{Edge, Graph, Node}
import sql.domain.model._

import scala.concurrent.{Await, Future}
import scala.concurrent.duration.Duration
import scala.concurrent.ExecutionContext.Implicits.global
import scala.util.Random

trait ToGraph {
  self: SqlApplicationService =>


   def toGraph(action: SqlAction, opAction: String,root: Option[Node]=None):Graph = {

    val selectId = action.id.toString
    val selectNode = Node(selectId,action.method,Map("action"->opAction))
    val rootToEdge: List[Edge] = root.map(r => List(Edge(r.id,selectId))).getOrElse(Nil)

    val opColumName = opAction match {
       case "Select" => "Result"
       case v => v
     }
    val resultId = selectId + "_" + opColumName
    val resultNode = Node(resultId,opColumName)
    val resultEdge = Edge(selectId,resultId)

    val operationG = operationsToG(resultId, action.operations)
    val operationNodes: List[Node] = operationG.map(_._1).flatten.toList
    val operationEdges: List[Edge] = operationG.map(_._2).flatten.toList
     val (operationSubQueryNodes,operationSubQueryEdges) = appendNodesSubQueryGraph(operationNodes)

    val condNodeId = selectId + "_condition"
    val condNode = Node(condNodeId,"Condition")
    val condEdge = Edge(selectId,condNodeId)

    val conditionG = conditionsToG(condNodeId,action.conditions)
    val condNodes: List[Node] = conditionG.map(_._1).flatten.toList
    val condEdges: List[Edge] = conditionG.map(_._2).flatten.toList

     val (condSubQueryNodes,condSubQueryEdges) = appendNodesSubQueryGraph(condNodes)

    val nodes: Seq[Node] = selectNode :: resultNode :: condNode :: operationNodes ::: condSubQueryNodes ::: condNodes
    val edges: Seq[Edge] = resultEdge :: condEdge :: rootToEdge ::: operationEdges ::: condSubQueryEdges ::: condEdges
    Graph(nodes,edges)
  }

  private def getSqlActionByTitle(title: String): Future[SqlAction] = {
    val ss = title.split("#")
    val clz = ss(0)
    val method = ss(1)
    println(s"ToGraph.getSqlActionByTitle: clz:$clz,method:$method")
    findSqlAction(clz,method).map(_.head)
  }

  private def appendNodesSubQueryGraph(nodes: List[Node]): (List[Node],List[Edge]) = {
    val subQuerySqlActionSF: Seq[Future[Graph]] = nodes.filter(_.properties.getOrElse("isref",false).equals(true)).map(v => appendNodeSubQueryGraph(v))
    val subQuerySqlActionF: Future[Seq[Graph]] = Future.sequence(subQuerySqlActionSF)
    val subQueryNodesAndEdgesF: Future[(List[Node], List[Edge])] = subQuerySqlActionF.map(g => (g.map(_.nodes).flatten.toList,g.map(_.edges).flatten.toList))
    Await.result(subQueryNodesAndEdgesF,Duration.Inf)
  }

  private def appendNodeSubQueryGraph(node: Node): Future[Graph] = {
    val subQuerySqlActionF: Future[SqlAction] = getSqlActionByTitle(node.title)
    subQuerySqlActionF.map(a => toGraph(a,"Select",Some(node)))
  }


  private def conditionsToG(condNodeId:String,conditions: Seq[SqlCondition]): Seq[(List[Node], List[Edge])] = {
    for{
      cond <- conditions
    } yield {
      val opId = cond.id.toString + "_op"
      val opNode = Node(opId,cond.op)
      val opEdge = Edge(condNodeId,opId)
      val l = condValueToG(opId,cond.left)
      val r = condValueToG(opId,cond.right)
      (opNode :: l._1 ::: r._1,opEdge :: l._2 ::: r._2)
    }
  }

  private def condValueToG(opId:String, condV: SqlConditionValue) = {
    val condValueId = condV.id.toString
    if(condV.tableColumn.isDefined) {
      val tc = condV.tableColumn.get
      tableColumnToG(opId,condValueId,tc)
    } else {
      val v = condV.value.get
      valueToG(opId,condValueId,v)
    }
  }

  private def operationsToG(opNodeId: String, operations: Seq[SqlOperationColumn]): Seq[(List[Node], List[Edge])] = {
    for {
      operation <- operations
    } yield {
      val tc = operation.tableColumn
      tableColumnToG(opNodeId,tc.table,tc)
    }
  }

  private def valueToG(rootId:String,nodeId:String,value:ColumnValue) = {
    val valueId = nodeId + "_value"

    val valueNode =if(value.isref){
      Node(valueId,value.value,Map("isref"->value.isref))
    } else {
      Node(valueId,value.value)
    }
    val edge = Edge(rootId,valueId)
    (valueNode :: Nil,edge :: Nil)
  }

  private def tableColumnToG(parentId:String,nodeId:String,tc:SqlTableColumn):(List[Node], List[Edge]) = {
    val _nodeId = if(nodeId.length > 0) nodeId else new Random().nextInt()
    val tableId = _nodeId + "_table"
    val tableNode = Node(tableId, tc.table,Map.empty ++ getNodeColorConfigure(tc.table))
    val tableEdge = Edge(parentId, tableId)
    val columnId = _nodeId + "_" + tc.column
    val columnNode = Node(columnId, tc.column,Map.empty ++ getNodeColorConfigure(tc.table+"."+tc.column))
    val columnEdge = Edge(tableId, columnId)
    (tableNode :: columnNode :: Nil, tableEdge :: columnEdge :: Nil)
  }

  private val nodeColors: Map[String, String] = Await.result( repo.loadNodeColor(), Duration.Inf)

  def getNodeColorConfigure(clz: String): Map[String, Any] = {
    nodeColors.find(v => clz.startsWith(v._1)).map(v => ("color" -> v._2)).toMap[String,String]
  }

}
