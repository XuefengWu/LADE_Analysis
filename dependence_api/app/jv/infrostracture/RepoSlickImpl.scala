package jv.infrostracture

import jv.domain.Repository
import jv.domain.model.{JClass, JMethod}
import jv.infrostracture.schemas.{Configure, JClasses, JMethods}
import javax.inject.{Inject, Singleton}
import play.api.db.slick.DatabaseConfigProvider
import slick.basic.DatabaseConfig
import slick.jdbc.JdbcProfile
import slick.jdbc.MySQLProfile.api._

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{Await, Future}

@Singleton
class RepoSlickImpl @Inject()(dbConfigProvider: DatabaseConfigProvider) extends Repository
                            with JClassRepoSlickImpl with JMethodRepoSlickImpl
                            with VMethodATargetInvokeBTargetRepoSlickImpl {

  private val dbConfig: DatabaseConfig[JdbcProfile] = dbConfigProvider.get[JdbcProfile]
  val db = dbConfig.db

}

trait BaseRepo {
  self: RepoSlickImpl =>

   def executeToJMethods(q: Query[JMethods, (String, String, String), Seq]) = {
    db.run(q.result).map(_.map(v => JMethod(v._1, v._2, v._3)))
  }

  def executeToJClasses(q: Query[JClasses, (String, String, Option[String]), Seq]) = {
    db.run(q.result).map(_.map(v => JClass(v._1, v._2, v._3)))
  }

  val configure: TableQuery[Configure] = TableQuery[Configure]

  def loadNodeColor():Future[Map[String,String]] = {
    val q = configure.filter(_.typ === "nodecolor")
    db.run(q.result).map(_.map(e => e._2 -> e._3).toMap)
  }

}


trait JMethodRepoSlickImpl extends BaseRepo {
  self: RepoSlickImpl =>

  val jmethods: TableQuery[JMethods] = TableQuery[JMethods]

  def findMethodCallees(id:String):Future[Seq[JMethod]] = {
    val q = jmethods.filter(v => v.id === id).take(1).flatMap(v => v.callees).take(99)
    executeToJMethods(q)
  }

  def findMethodCallers(id:String):Future[Seq[JMethod]] = {
    val q = jmethods.filter(v => v.id === id).take(1).flatMap(v => v.callers).take(99)
    executeToJMethods(q)
  }

  def findMethod(clz:String, name:String):Future[Seq[JMethod]] = {
    val q = jmethods.filter(v => v.clzname === clz && v.name === name)
    executeToJMethods(q)
  }

  def searchMethods(keys: Seq[String]):Future[Seq[JMethod]] = {
    def keyCritical(k: String, m: JMethods) = {
      (m.name like ("%"+k+"%")) || (m.clzname like ("%"+k+"%"))
    }

    if(keys.isEmpty) {
      Future[Seq[JMethod]](Nil)
    } else {
      val head = keys.head
      val tails = keys.tail
      val q = jmethods.filter(v => tails.foldLeft(keyCritical(head, v) )((acc, z) => acc && keyCritical(z, v))).take(99)
      executeToJMethods(q)
    }
  }

  def findInterfaceMethod(id:String):Future[Option[JMethod]] = {
    val q = jmethods.filter(v => v.id === id).take(1).flatMap(v => v.interfaceMethod).take(1).result
    db.run(q).map(_.map(v => JMethod(v._1,v._2,v._3)).headOption)
  }

  def findImplementMethod(id:String):Future[Option[JMethod]] = {
    val q = jmethods.filter(v => v.id === id).take(1).flatMap(v => v.implementMethod).take(1).result
    db.run(q).map(_.map(v => JMethod(v._1,v._2,v._3)).headOption)
  }

  def countCallers(id:String):Future[Int] = {
    val q = jmethods.filter(_.id === id).take(1).flatMap(v => v.callersRelations).size.result
    db.run(q)
  }

}

trait JClassRepoSlickImpl extends BaseRepo {
  self: RepoSlickImpl =>

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
    val q = jclasses
    executeToJClasses(q)
  }

  def findClassMethod(name:String):Future[Seq[JMethod]] = {
    val q = jmethods.filter(_.clzname === name)
    executeToJMethods(q)
  }

}