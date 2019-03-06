package sql.infrostracture.schemas

import java.util.UUID

import slick.jdbc.MySQLProfile.api._
import slick.lifted.ProvenShape

class SqlActionTable(tag: Tag) extends Table[(String,String, String, String)](tag, "SqlAction") {

  def id = column[String]("id")

  def clz = column[String]("clz")

  def method = column[String]("method")

  def action = column[String]("action")

  // Every table needs a * projection with the same type as the table's type parameter
  def * :ProvenShape[(String,String, String, String)]  = (id,clz,method,action)

}
