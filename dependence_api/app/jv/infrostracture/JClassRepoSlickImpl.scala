package jv.infrostracture

import jv.domain.model.{JClass, ClassCallee}
import jv.infrostracture.schemas.JClasses
import slick.lifted.TableQuery
import slick.jdbc.MySQLProfile.api._
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

trait JClassRepoSlickImpl extends BaseRepo {
  self: RepoSlickImpl =>


  private def executeToJClasses(q: Query[JClasses, (String, String, Option[String], Option[Int]), Seq]) = {
    db.run(q.result).map(_.map(v => JClass(v._1, v._2, v._3,v._4)))
  }

  val jclasses: TableQuery[JClasses] = TableQuery[JClasses]
  def findClass(name:String):Future[Seq[JClass]] = {
    val q = jclasses.filter(_.name === name).take(1)
    executeToJClasses(q)
  }

  def findDependencees(id:String):Future[Seq[JClass]] = {
    val q = jclasses.filter(_.id === id).take(1).flatMap(v => v.dependencees).take(99)
    executeToJClasses(q)
  }

  def findDependencers(id:String):Future[Seq[JClass]] = {
    val q = jclasses.filter(_.id === id).take(1).flatMap(v => v.dependencers).take(99)
    executeToJClasses(q)
  }

  def loadAllClasses():Future[Seq[JClass]] = {
    val q = jclasses.sortBy(_.name)
    executeToJClasses(q)
  }

  def findClassCallees(clz:String):Future[Seq[ClassCallee]] = {
    val query: DBIO[Seq[(String,Int)]] =
      sql"""SELECT b.clzname,COUNT(1) from JMethod a,`_MethodCallees` cl,JMethod b
                     WHERE a.id = cl.a and b.id = cl.b
                     AND a.clzname = $clz
                     AND b.clzname <> $clz
                     GROUP BY b.clzname
                    """.as
    db.run(query).map(_.map(v => ClassCallee(clz,v._1, v._2)))
  }
  def findClassCallers(clz:String):Future[Seq[ClassCallee]] = {
    val query: DBIO[Seq[(String,Int)]] =
      sql"""SELECT a.clzname,COUNT(1) from JMethod a,`_MethodCallees` cl,JMethod b
                     WHERE a.id = cl.a and b.id = cl.b
                     AND b.clzname = $clz
                     AND a.clzname <> $clz
                     GROUP BY a.clzname
                    """.as
    db.run(query).map(_.map(v => ClassCallee(v._1,clz, v._2)))
  }

  def findClassParent(clz:String):Future[Seq[ClassCallee]] = {
    val query: DBIO[Seq[String]] =
      sql"""SELECT DISTINCT p.name from JClass c,`_ClassParent` cp,JClass p
           WHERE c.id = cp.a AND cp.b = p.id
           AND c.name = $clz
        """.as

    db.run(query).map(_.map(v => ClassCallee(v,clz, 1,List("parent"))))
  }

  def findClassImplements(clz:String):Future[Seq[ClassCallee]] = {
    val query: DBIO[Seq[String]] =
      sql"""SELECT DISTINCT c.name from JClass c,`_ClassParent` cp,JClass p
           WHERE c.id = cp.a AND cp.b = p.id
           AND p.name = $clz
        """.as

    db.run(query).map(_.map(v => ClassCallee(clz,v, 1,List("implements"))))
  }

}