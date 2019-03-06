package sql.domain.service

import sql.domain.model.TableMethodOperator

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

trait TableMethodOperatorService {
  self:SqlApplicationService =>

  def findTableWriters(name:String): Future[Seq[TableMethodOperator]] = {
    val procedureWriters = repo.selectTablePLProcedureWriters(name)
    val javaWriters = repo.selectTableJavaWriters(name)
    procedureWriters.flatMap(v => javaWriters.map(w => w ++ v))
  }

  def findTablePlSqlOperators(name:String): Future[Seq[TableMethodOperator]] = {
    repo.selectTablePLProcedureOperators(name).flatMap(v => repo.selectTablePLProcedureConditions(name).map(w => w ++ v))
  }

  def findTableJavaOperators(name:String): Future[Seq[TableMethodOperator]] = {
    repo.selectTableJavaOperators(name)
  }


}
