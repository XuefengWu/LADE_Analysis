package sql.infrostracture

import java.util.UUID

import javax.inject.{Inject, Singleton}
import jv.infrostracture.schemas.Configure
import org.apache.commons.lang3.StringUtils
import play.api.db.slick.DatabaseConfigProvider
import slick.basic.DatabaseConfig
import slick.jdbc.JdbcProfile
import slick.jdbc.MySQLProfile.api._
import slick.lifted.TableQuery
import sql.domain.Repository
import sql.domain.model._
import sql.infrostracture.schemas.SqlActionTable

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.Future

@Singleton
class RepoSlickImpl@Inject()(dbConfigProvider: DatabaseConfigProvider) extends Repository {

  private val dbConfig: DatabaseConfig[JdbcProfile] = dbConfigProvider.get[JdbcProfile]
  val db = dbConfig.db

  private val sqlActionTable: TableQuery[SqlActionTable] = TableQuery[SqlActionTable]

  def selectTablePLProcedureConditions(name:String): Future[Seq[TableMethodOperator]] = {
    val leftQuery: DBIO[Seq[(String, String, String,String, String,String,String)]] =
      sql"""
           SELECT mp.clz,mp.`method`,mp.pkg,mp.`procedure`,cv.`table`,cv.`column` ,sc.op
           from JMethodPLProcedure mp,_PLProcedureSqlAction pa,SqlAction sa,`_SqlActionConditions` sac, SqlCondition sc, `_SqlLeftConditionValue` lc, SqlConditionValue cv
           where mp.id = pa.a and pa.b = sa.id
           and sa.id = sac.a and sac.b = sc.id
           and sc.id = lc.a and lc.b = cv.id
           and cv.`table` = $name
       """.as

    val left = db.run(leftQuery).map(_.map(v => TableMethodOperator(v._1,v._2,s"${v._3}.${v._4}",v._5,Some(v._6),"where")))

    val rightQuery: DBIO[Seq[(String, String, String,String, String,String,String)]] =
      sql"""
           SELECT mp.clz,mp.`method`,mp.pkg,mp.`procedure`,cv.`table`,cv.`column` ,sc.op
           from JMethodPLProcedure mp,_PLProcedureSqlAction pa,SqlAction sa,`_SqlActionConditions` sac, SqlCondition sc, `_SqlRightConditionValue` lc, SqlConditionValue cv
           where mp.id = pa.a and pa.b = sa.id
           and sa.id = sac.a and sac.b = sc.id
           and sc.id = lc.a and lc.b = cv.id
           and cv.`table` = $name
       """.as

    val right = db.run(rightQuery).map(_.map(v => TableMethodOperator(v._1,v._2,s"${v._3}.${v._4}",v._5,Some(v._6),"where")))

    left.flatMap(l => right.map(r => l ++ r))
  }

  def selectTablePLProcedureOperators(name:String): Future[Seq[TableMethodOperator]] = {
    val query: DBIO[Seq[(String, String, String,String, String,String,String)]] =
      sql"""
         SELECT mp.clz,mp.`method`,mp.pkg,mp.`procedure`, oc.`table`,oc.`column` ,oc.op
         from JMethodPLProcedure mp,_PLProcedureSqlAction pa,SqlAction sa,`_SqlActionOperationColumns` ao, SqlOperationColumn oc
         where mp.id = pa.a and pa.b = sa.id
         and sa.id = ao.a and ao.b = oc.id
         and oc.`table` = $name
       """.as
    db.run(query).map(_.map(v => TableMethodOperator(v._1,v._2,s"${v._3}.${v._4}",v._5,Some(v._6),v._7)))
  }

  def selectTableJavaOperators(name:String): Future[Seq[TableMethodOperator]] = {
    val query: DBIO[Seq[(String, String, String,String)]] =
      sql"""
           SELECT clz,`method`,`table`,operate from JMethodSqlTable mt
           where mt.`table` = $name
       """.as
    db.run(query).map(_.map(v => TableMethodOperator(v._1,v._2,"java_code",v._3,None,v._4)))
  }

  def selectTableJavaWriters(name:String): Future[Seq[TableMethodOperator]] = {
    val query: DBIO[Seq[(String, String, String,String)]] =
      sql"""
           SELECT clz,`method`,`table`,operate from JMethodSqlTable mt
           where mt.`table` = $name and mt.operate <> 'select'
       """.as
    db.run(query).map(_.map(v => TableMethodOperator(v._1,v._2,"java_code",v._3,None,v._4)))
  }

  def selectTablePLProcedureWriters(name:String): Future[Seq[TableMethodOperator]] = {
    val query: DBIO[Seq[(String, String, String,String, String,String,String)]] =
    sql"""
         SELECT mp.clz,mp.`method`,mp.pkg,mp.`procedure`, oc.`table`,oc.`column` ,oc.op
         from JMethodPLProcedure mp,_PLProcedureSqlAction pa,SqlAction sa,`_SqlActionOperationColumns` ao, SqlOperationColumn oc
         where mp.id = pa.a and pa.b = sa.id
         and sa.id = ao.a and ao.b = oc.id
         and sa.`action` <> 'select'
         and oc.`table` = $name
       """.as

    db.run(query).map(_.map(v => TableMethodOperator(v._1,v._2,s"${v._3}.${v._4}",v._5,Some(v._6),v._7)))
  }

  def findSqlAction(clz: String,method: String): Future[Seq[SqlAction]] = {
    val q = sqlActionTable.filter(v => v.clz === clz && v.method === method).take(1)
    println(q.result.statements.head)
    db.run(q.result).map(_.map(v => SqlAction(UUID.fromString(v._1), v._2, v._3, v._4)))
  }

  def findOperationColumns(actionId: String): Future[Seq[SqlOperationColumn]]= {
    val query: DBIO[Seq[(String, String, String)]] =
      sql"SELECT oc.id,oc.table,oc.column FROM _SqlActionOperationColumns _oc,SqlOperationColumn oc WHERE $actionId = _oc.A and _oc.B = oc.id ".as
    db.run(query).map(_.map(v => SqlOperationColumn(UUID.fromString(v._1),SqlTableColumn(v._2, v._3), "result")))
  }

  def findSqlConditions(actionId: String): Future[Seq[SqlCondition]]  = {
    def toSqlConditionValue(id:String,t:String,c:String,v:String,ref:Int):SqlConditionValue = {
      if(!StringUtils.isBlank(v)) {
        SqlConditionValue(UUID.fromString(id),None,Option(ColumnValue(v,ref>0)))
      } else {
        SqlConditionValue(UUID.fromString(id),Option(SqlTableColumn(t,c)),None)
      }
    }

    val query: DBIO[Seq[(String, String,String, String,String,Int, String, String, String, String, String,Int)]] =
    sql"""
      SELECT c.id,
         		lcv.id,lcv.`table`,lcv.`column`,lcv.value,(SELECT count(1) from SqlAction WHERE CONCAT(clz , "#" , `method`) = lcv.value) as lref,
         		c.op,
         		rcv.id,rcv.`table`,rcv.`column`,rcv.value,(SELECT count(1) from SqlAction WHERE CONCAT(clz , "#" , `method`) = rcv.value) as rref
               FROM SqlAction s,_SqlActionConditions _ac,SqlCondition c,
               _SqlLeftConditionValue _lef,SqlConditionValue lcv,
               _SqlRightConditionValue _righ,SqlConditionValue rcv
               WHERE s.id = _ac.A and _ac.B = c.id
               and c.id = _lef.a and _lef.b = lcv.id
               and c.id = _righ.a and _righ.b = rcv.id
      and s.id = $actionId  """.as

    db.run(query).map(_.map(v => SqlCondition(UUID.fromString(v._1),
                                              toSqlConditionValue(v._2,v._3,v._4,v._5,v._6),
                                              v._7,
                                              toSqlConditionValue(v._8,v._9,v._10,v._11,v._12))))
  }


  val configure: TableQuery[Configure] = TableQuery[Configure]

  def loadNodeColor():Future[Map[String,String]] = {
    val q = configure.filter(_.typ === "nodecolor")
    db.run(q.result).map(_.map(e => e._2 -> e._3).toMap)
  }


}
