package jv.infrostracture


import jv.domain.model.JClass
import org.scalatestplus.play.PlaySpec
import org.scalatestplus.play.guice.GuiceOneAppPerTest
import play.api.test.Injecting

import scala.concurrent.{Await, Future}
import scala.concurrent.duration.Duration

import scala.concurrent.ExecutionContext.Implicits.global

class RepoSlickImplSpec extends PlaySpec with GuiceOneAppPerTest with Injecting {

  "RepoSlickImpl find" should {
    "class dependencees ok" in {
      val repo = inject[RepoSlickImpl]
      val classesF = repo.findClass("org.springframework.web.reactive.DispatcherHandler")
      val dependenceesF = classesF.map(cs => cs.map(v => repo.findDependencees(v.id)))
      val ff: Future[Seq[JClass]] = dependenceesF.flatMap(v => Future.sequence(v)).map(_.flatten)
      val dependencees = Await.result(ff, Duration.Inf)
      dependencees.size must be >(10)
    }

    "class dependencers ok" in {
      val repo = inject[RepoSlickImpl]
      val classesF = repo.findClass("org.springframework.web.reactive.DispatcherHandler")
      val dependencersF: Future[Seq[Future[Seq[JClass]]]] = classesF.map(cs => cs.map(v => repo.findDependencers(v.id)))
      val ff: Future[Seq[JClass]] = dependencersF.flatMap(v => Future.sequence(v)).map(_.flatten)
      val dependencers = Await.result(ff, Duration.Inf)
      dependencers.size must be >(1)
    }

    "searchMethods" in {
      val repo = inject[RepoSlickImpl]
      val methodsF = repo.searchMethods(List("Dao"))
      methodsF.foreach(_.foreach(println))
      val methods = Await.result(methodsF, Duration.Inf)
      methods.size must be >(1)
    }
  }

}
