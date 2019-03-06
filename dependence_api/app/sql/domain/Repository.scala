package sql.domain



import sql.domain.model.{SqlAction, SqlCondition, SqlOperationColumn, TableMethodOperator}

import scala.concurrent.Future

trait Repository {

  def findSqlAction(clz:String,method:String):Future[Seq[SqlAction]]

  def findOperationColumns(actionId: String):Future[Seq[SqlOperationColumn]]

  def findSqlConditions(actionId: String):Future[Seq[SqlCondition]]

  def loadNodeColor():Future[Map[String,String]]

  def selectTablePLProcedureWriters(name:String): Future[Seq[TableMethodOperator]]

  def selectTableJavaWriters(name:String): Future[Seq[TableMethodOperator]]

  def selectTablePLProcedureOperators(name:String): Future[Seq[TableMethodOperator]]

  def selectTableJavaOperators(name: String): Future[Seq[TableMethodOperator]]

  def selectTablePLProcedureConditions(name:String): Future[Seq[TableMethodOperator]]

}
