package jv.domain.service

import scala.concurrent.{Await, Future}
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration

trait ToGraphService {
  self: ApplicationService =>
  private val nodeColors: Map[String, String] = Await.result( repo.loadNodeColor(), Duration.Inf)

  def getNodeColorConfigure(clz: String): Map[String, Any] = {
    nodeColors.find(v => clz.contains(v._1)).map(v => ("color" -> v._2)).toMap[String,String]
  }

}
