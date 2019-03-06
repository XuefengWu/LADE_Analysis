package jv.infrostracture

import jv.domain.Repository
import jv.domain.model.{JClass, JMethod, NodeConfigure}
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



  val configure: TableQuery[Configure] = TableQuery[Configure]

  def loadNodeConfigures():Future[Seq[NodeConfigure]] = {
    val q = configure.filter(_.typ like ("node%") )
    db.run(q.result).map(_.map(e => NodeConfigure(e._1,e._2, e._3)))
  }

}

