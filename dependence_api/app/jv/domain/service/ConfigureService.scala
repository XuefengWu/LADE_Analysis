package jv.domain.service

import jv.domain.model.NodeConfigure

import scala.concurrent.{Await, Future}
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration

trait ConfigureService {
  self: ApplicationService =>

  private val nodeConfigures: Seq[NodeConfigure] = Await.result( repo.loadNodeConfigures(), Duration.Inf)
  private val nodeColors: Seq[NodeConfigure] = nodeConfigures.filter(_.typ == "nodecolor")
  protected val nodeHiddens:Seq[NodeConfigure] = nodeConfigures.filter(v => v.typ == "nodehidden")

  def getNodeColorConfigure(clz: String): Map[String, Any] = {
    nodeColors.find(v => clz.contains(v.key)).map(v => ("color" -> v.value)).toMap[String,String]
  }

  def isAnalysisInclude(clz:String):Boolean = clz.startsWith("com")

}
