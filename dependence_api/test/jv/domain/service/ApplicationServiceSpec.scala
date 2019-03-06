package jv.domain.service

import org.scalatestplus.play.PlaySpec
import org.scalatestplus.play.guice.GuiceOneAppPerTest
import play.api.test.Injecting

import scala.concurrent.Await
import scala.concurrent.duration.Duration

import scala.concurrent.ExecutionContext.Implicits.global

class ApplicationServiceSpec extends PlaySpec with GuiceOneAppPerTest with Injecting {

  "ApplicationService find" should {
    "class dependencees ok" in {
      val app = inject[ApplicationService]
      val dependenceesF = app.findClassDependencees("org.springframework.web.reactive.DispatcherHandler",9)
      dependenceesF.foreach(println)
      Await.result(dependenceesF , Duration.Inf)
    }

    "findMethodCallees ok" in {
      val app = inject[ApplicationService]
      val calleesF = app.findMethodCallees("org.springframework.web.reactive.DispatcherHandler","handle",3)
      calleesF.foreach(println)
      Await.result(calleesF , Duration.Inf)
    }

    "findMethodCallees for cbs ok" in {
      val app = inject[ApplicationService]
      val calleesF = app.findMethodCallees("com.ebao.life.claim.infrastructure.expose.MedicardCaseTransPolicyDAO","batchCreate",6)
      calleesF.foreach(println)
      Await.result(calleesF , Duration.Inf)
    }

    "findMethodCallees for cbs graph ok" in {
      val app = inject[ApplicationService]
      val calleesGraph = app.findMethodCallees("com.ebao.life.claim.infrastructure.expose.MedicardCaseTransPolicyDAO","batchCreate")
      println(calleesGraph)
    }

    "find class dependence ok" in {
      val app = inject[ApplicationService]
      val calleesF = app.findClassDependences("com.ebao.life.claim.std.audit.AuditDAOImpl",3)
      println(s"find class dependence ok: $calleesF")

    }

    "find class invokes ok" in {
      val app = inject[ApplicationService]
      val calleesF = app.findClassInvokes("com.ebao.life.ebiz.card.CardChangeServiceImpl",1)
      println(s"find class invokes ok: $calleesF")

    }

    "find class dependence ok with 3 nodecolor configure" in {
      val app = inject[ApplicationService]
      val calleesF = app.findClassDependences("com.ebao.life.newbiz.appentry.indv.IndividualAppEntryBean",3)
      println(s"find class dependence ok: $calleesF")

    }

    "appendColor" in {
      val app = inject[ApplicationService]
      val props = app.getNodeColorConfigure("com.ebao.life.newbiz.FF")
      println(props)
    }
  }

}
