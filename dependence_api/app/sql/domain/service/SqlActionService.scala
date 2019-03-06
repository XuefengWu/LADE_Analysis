package sql.domain.service

import sql.domain.model.SqlAction

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.Future

trait SqlActionService {
  self:SqlApplicationService =>

  def findSqlAction(clz:String,method:String): Future[Option[SqlAction]] = {
    val sqlActionsF: Future[Seq[SqlAction]] = repo.findSqlAction(clz,method)
    sqlActionsF.flatMap(v => appendConditions(v)).flatMap(v => appendOperationColumns(v)).map(_.headOption)
  }

  private def appendConditions(sqlActions: Seq[SqlAction]): Future[Seq[SqlAction]] = {
    val res = sqlActions.map(a => repo.findSqlConditions(a.id.toString).map(ss => a.copy(conditions = ss)))
    Future.sequence(res)
  }

  private def appendOperationColumns(sqlActions: Seq[SqlAction]): Future[Seq[SqlAction]] = {
    val res = sqlActions.map(a =>  repo.findOperationColumns(a.id.toString).map(ss => a.copy(operations = ss)))
    Future.sequence(res)
  }

}
