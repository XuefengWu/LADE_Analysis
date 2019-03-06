package jv.infrostracture

import jv.domain.model.JMethod
import jv.infrostracture.schemas.JMethods
import slick.lifted.TableQuery
import slick.jdbc.MySQLProfile.api._
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global


trait JMethodRepoSlickImpl extends BaseRepo {
  self: RepoSlickImpl =>

  private def executeToJMethods(q: Query[JMethods, (String, String, String, Option[String]), Seq]) = {
    db.run(q.result).map(_.map(v => JMethod(v._1, v._2, v._3,module = v._4)))
  }

  val jmethods: TableQuery[JMethods] = TableQuery[JMethods]

  def findMethodCallees(id:String,hiddens:Seq[String]):Future[Seq[JMethod]] = {
    val q = jmethods.filter(v => v.id === id).take(1).flatMap(v => v.callees(hiddens)).take(99)
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

  def findImplementMethod(id:String):Future[Seq[JMethod]] = {
    val q = jmethods.filter(v => v.id === id).take(1).flatMap(v => v.implementMethod).distinct.result
    db.run(q).map(_.map(v => JMethod(v._1,v._2,v._3)))
  }

  def countCallers(id:String):Future[Int] = {
    val q = jmethods.filter(_.id === id).take(1).flatMap(v => v.callersRelations).size.result
    db.run(q)
  }

  def findClassMethod(name:String):Future[Seq[JMethod]] = {
    val q = jmethods.filter(_.clzname === name)
    executeToJMethods(q)
  }

}
