package jv.infrostracture

import jv.domain.dto.VMethodInvoke
import slick.jdbc.MySQLProfile.api._

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.Future

trait VMethodATargetInvokeBTargetRepoSlickImpl extends BaseRepo {
  self: RepoSlickImpl =>


  def loadATargetInvokeBTarget(aTarget:String,bTarget:String):Future[Seq[VMethodInvoke]] = {
    val viewName = s"V_Method_${aTarget}_Invoke_${bTarget}".toUpperCase
    isViewExist(viewName).flatMap{case true => queryView(viewName)
                                 case false => queryByModule(aTarget,bTarget) }
  }

  private def queryByModule(aTarget:String,bTarget:String):Future[Seq[VMethodInvoke]] = {
    val query: DBIO[Seq[(String, String, String, String)]] =
      sql"SELECT a.clzname,a.name,b.clzname,b.name FROM JMethod a, JMethod b, `_MethodCallees` c  WHERE c.a = a.id and c.b = b.id  and a.module = $aTarget and b.module = $bTarget ORDER BY b.clzname,a.clzname".as
    db.run(query).map(_.map(v => VMethodInvoke(v._1, v._2, v._3, v._4)))
  }

  private def queryView(viewName: String):Future[Seq[VMethodInvoke]] = {
    val query: DBIO[Seq[(String, String, String, String)]] =
      sql"SELECT aClassName,aMethodName,bClassName,bMethodName FROM #$viewName ORDER BY bClassName, aClassName".as
    db.run(query).map(_.map(v => VMethodInvoke(v._1, v._2, v._3, v._4)))
  }

  def isViewExist(view: String):Future[Boolean] = {
    val countQ: DBIO[Seq[Int]] = sql"SELECT count(1) from information_schema.TABLES where TABLE_TYPE = 'view' and table_name = ${view}".as
    db.run(countQ).map(_.head > 0)
  }

}
