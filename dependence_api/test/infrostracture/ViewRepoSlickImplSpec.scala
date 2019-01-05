package infrostracture

import domain.model.JClass
import org.scalatestplus.play.PlaySpec
import org.scalatestplus.play.guice.GuiceOneAppPerTest
import play.api.test.Injecting

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{Await, Future}

class ViewRepoSlickImplSpec extends PlaySpec with GuiceOneAppPerTest with Injecting {

  "ViewRepoSlickImpl find" should {
    "flux invoke web" in {
      val repo = inject[RepoSlickImpl]
      val invokesF = repo.loadATargetInvokeBTarget("spring-webflux","spring-web")
      val invokes = Await.result(invokesF, Duration.Inf)
      invokes.size must be >(1)
      println(invokes.size)
    }

    "VIEW_SPRING-WEBMVC is not exist" in {
      val repo = inject[RepoSlickImpl]
      val existF = repo.isViewExist("VIEW_SPRING-WEBMVC")
      val exist = Await.result(existF, Duration.Inf)
      exist mustBe(false)

      val exist2F = repo.isViewExist("session")
      val exist2 = Await.result(exist2F, Duration.Inf)
      exist2 mustBe(true)
    }


  }

}
