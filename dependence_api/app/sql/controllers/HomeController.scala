package sql.controllers


import javax.inject._
import play.api.libs.json._
import play.api.mvc._
import sql.domain.service.SqlApplicationService

@Singleton
class HomeController @Inject()(cc: ControllerComponents,service:SqlApplicationService) extends AbstractController(cc) {
  import common.controllers.GraphJsonFormatter._

  def getSqlAction(clz:String, name:String) = Action { implicit request: Request[AnyContent] =>
    val g = service.getSqlAction(clz,name)
    Ok(Json.toJson(g))
  }

  def getTableWriters(name:String) = Action { implicit request: Request[AnyContent] =>
    val g = service.getTableWriters(name)
    Ok(Json.toJson(g))
  }

  def getTablePlSqlOperators(name:String) = Action { implicit request: Request[AnyContent] =>
    val g = service.getTablePlSqlOperators(name)
    Ok(Json.toJson(g))
  }

  def getTableJavaOperators(name:String) = Action { implicit request: Request[AnyContent] =>
    val g = service.getTableJavaOperators(name)
    Ok(Json.toJson(g))
  }

}