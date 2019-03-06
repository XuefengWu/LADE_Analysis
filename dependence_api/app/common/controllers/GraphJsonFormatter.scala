package common.controllers

import java.util.UUID

import common.domain.{Edge, Graph, Node}
import play.api.libs.json.{JsObject, JsString, Json, Writes}

object GraphJsonFormatter {

  implicit val propertiesWrites = new Writes[Map[String,Any]] {
    def writes(properties: Map[String,Any]) = JsObject(
      properties.map(v => (v._1,JsString(v._2.toString)))
    )
  }
  implicit val uuidWrites = new Writes[UUID] {
    def writes(uuid: UUID) = JsString(uuid.toString)
  }

  implicit val nodeWrites: Writes[Node] = Json.writes[Node]
  implicit val edgeWrites: Writes[Edge] = Json.writes[Edge]
  implicit val graphWrites: Writes[Graph] = Json.writes[Graph]

}
