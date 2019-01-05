package controllers

import org.scalatestplus.play._
import org.scalatestplus.play.guice._
import play.api.libs.json.{JsArray, JsValue}
import play.api.test._
import play.api.test.Helpers._

/**
 * Add your spec here.
 * You can mock out a whole application including requests, plugins etc.
 *
 * For more information, see https://www.playframework.com/documentation/latest/ScalaTestingWithScalaTest
 */
class HomeControllerSpec extends PlaySpec with GuiceOneAppPerTest with Injecting {

  "HomeController GET" should {

    "render the index page from a new instance of controller" in {
      val controller = new HomeController(stubControllerComponents(),null)
      val home = controller.getMethodCallees("org.springframework.web.reactive.DispatcherHandler","handle").apply(FakeRequest(GET, "/"))

      status(home) mustBe OK
      contentType(home) mustBe Some("text/html")
      contentAsString(home) must include ("Welcome to Play")
    }

    "render the index page from the application" in {
      val controller = inject[HomeController]
      val home = controller.getMethodCallees("org.springframework.web.reactive.DispatcherHandler","handle").apply(FakeRequest(GET, "/"))

      status(home) mustBe OK
      contentType(home) mustBe Some("application/json")
    }

    "get method callers" in {
      val controller = inject[HomeController]
      val home = controller.getMethodCallers("org.springframework.web.reactive.DispatcherHandler","handle").apply(FakeRequest(GET, "/"))

      status(home) mustBe OK
      contentType(home) mustBe Some("application/json")
    }

    "get class dependences" in {
      val controller = inject[HomeController]
      val home = controller.getClassDependences("org.springframework.web.reactive.DispatcherHandler").apply(FakeRequest(GET, "/"))
      status(home) mustBe OK
      contentType(home) mustBe Some("application/json")
    }

    "search methods" in {
      val controller = inject[HomeController]
      val home = controller.searchMethods("audi get").apply(FakeRequest(GET, "/"))
      status(home) mustBe OK
      println(contentAsJson(home))
      contentType(home) mustBe Some("application/json")
    }

    "method to method: reactive on web" in {
      val request = FakeRequest(GET, "/method_method/reactive/web")
      val home = route(app, request).get

      status(home) mustBe OK
      contentType(home) mustBe Some("application/json")
      val res: JsValue = contentAsJson(home)
      println(res.asInstanceOf[JsArray].value.size)
    }

    "method to method: web on reactive" in {
      val request = FakeRequest(GET, "/method_method/web/reactive")
      val home = route(app, request).get

      status(home) mustBe OK
      contentType(home) mustBe Some("application/json")
      val res: JsValue = contentAsJson(home)
      println(res.asInstanceOf[JsArray].value.size)
    }

  }
}
