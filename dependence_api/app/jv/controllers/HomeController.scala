package jv.controllers

import jv.domain.dto.{VMethodInvoke, _}
import jv.domain.service.ApplicationService
import javax.inject._
import play.api.libs.json._
import play.api.mvc._

/**
  * This controller creates an `Action` to handle HTTP requests to the
  * application's home page.
  */
@Singleton
class HomeController @Inject()(cc: ControllerComponents,service:ApplicationService) extends AbstractController(cc) {

  import common.controllers.GraphJsonFormatter._
  implicit val simpleClassWrites: Writes[SimpleClass] = Json.writes[SimpleClass]
  implicit val simpleMethodWrites: Writes[SimpleMethod] = Json.writes[SimpleMethod]
  implicit val packageTreemap = Json.writes[Treemap]
  implicit val vmethodInvoke: Writes[VMethodInvoke] = Json.writes[VMethodInvoke]

  def getMethodCallees(clz:String, name:String) = Action { implicit request: Request[AnyContent] =>
    val deep = request.getQueryString("deep").map(_.toInt)
    val hide = request.getQueryString("hide").map(_.split(",").toSeq)
    val g = service.findMethodCallees(clz,name,deep,hide)
    Ok(Json.toJson(g))
  }

  def getMethodCallers(clz:String, name:String) = Action { implicit request: Request[AnyContent] =>
    val deep = request.getQueryString("deep").map(_.toInt)
    val g = service.findMethodCallers(clz,name,deep)
    Ok(Json.toJson(g))
  }

  def getMethodInvokes(clz:String, name:String) = Action { implicit request: Request[AnyContent] =>
    val deep = request.getQueryString("deep").map(_.toInt)
    val g = service.findMethodInvokes(clz,name,deep)
    Ok(Json.toJson(g))
  }

  def getClassMethods(name:String) = Action { implicit request: Request[AnyContent] =>
    val g = service.findMethodByClasses(name)
    Ok(Json.toJson(g))
  }

  def getClassDependences(name:String) = Action { implicit request: Request[AnyContent] =>
    val g = service.findClassDependences(name,4)
    Ok(Json.toJson(g))
  }
  def getClassInvokes(name:String) = Action { implicit request: Request[AnyContent] =>
    val deep = request.getQueryString("deep").map(_.toInt)
    val g = service.findClassInvokes(name,deep)
    Ok(Json.toJson(g))
  }

  def getAllClasses() = Action { implicit request: Request[AnyContent] =>
    val g = service.getAllClasses()
    Ok(Json.toJson(g))
  }

  def searchMethods(keys:String) = Action { implicit request: Request[AnyContent] =>
    val g = service.searchMethods(keys)
    Ok(Json.toJson(g))
  }

  def deleteCache() = Action { implicit request: Request[AnyContent] =>
    service.cleanCache()
    Ok("")
  }

  def getTargetAMethodInvokeTargetBMethod(aTarget:String,bTarget:String) = Action { implicit request: Request[AnyContent] =>
    val g = service.findATargetInvokeBTarget(aTarget,bTarget)
    Ok(Json.toJson(g))
  }

  def getPackageLocs()= Action { implicit request: Request[AnyContent] =>
    val g = service.getPackageLocs()
    Ok(Json.toJson(g))
  }

}
