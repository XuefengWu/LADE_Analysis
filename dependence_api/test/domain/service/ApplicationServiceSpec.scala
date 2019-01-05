package domain.service

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


  }

}
