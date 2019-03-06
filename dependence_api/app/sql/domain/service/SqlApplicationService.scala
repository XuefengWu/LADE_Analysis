package sql.domain.service

import common.domain.Graph
import javax.inject.{Inject, Singleton}
import sql.domain.Repository
import sql.domain.model.{SqlAction, TableMethodOperator}

import scala.concurrent.{Await, Future}
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration

@Singleton
class SqlApplicationService @Inject()(val repo: Repository) extends SqlActionService with SqlActionToGraph
                                                         with TableMethodOperatorService  with SqlTableOperationToGraph {

  def getSqlAction(clz:String,method:String): Graph = {
    val actions = findSqlAction(clz,method)
    val gF = actions.map(v => v.map(a => toGraph(a)).getOrElse(Graph()))
    Await.result(gF,Duration.Inf)
  }

  def getTableWriters(name:String): Graph = {
    val writers = findTableWriters(name)
    val gF = writers.map(v => toGraph(v))
    Await.result(gF,Duration.Inf)
  }

  def getTablePlSqlOperators(name:String): Graph = {
    val writers = findTablePlSqlOperators(name)
    val gF = writers.map(v => toGraph(v))
    Await.result(gF,Duration.Inf)
  }

  def getTableJavaOperators(name:String): Graph = {
    val writers = findTableJavaOperators(name)
    val gF = writers.map(v => toGraph(v))
    Await.result(gF,Duration.Inf)
  }

}
