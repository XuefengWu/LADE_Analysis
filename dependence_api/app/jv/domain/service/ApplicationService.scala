package jv.domain.service

import java.util.concurrent.ConcurrentHashMap

import common.domain.Graph
import jv.domain.Repository
import jv.domain.dto._
import javax.inject.{Inject, Singleton}
import jv.domain.model.JMethod

import scala.concurrent.{Await, Future}
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration

@Singleton
class ApplicationService @Inject()(val repo: Repository)
          extends MethodToGraphService with MethodCalleesService with MethodCallersService
          with ClassToGraphService with ClassDependenceesService with ClassDependencersService
          with ClassBaseService with MethodBaseService
          with PackageLocService with ClassInvokesService{

  private val cache = new ConcurrentHashMap[String,Seq[Any]]()

  def findMethodCallees(clz:String, name:String,deep:Option[Int],hide:Option[Seq[String]]):Graph = {
    val methodWithCalleeSizeF = findMethodCallees(clz,name,deep.getOrElse(3),hide.getOrElse(Nil))
    Await.result(methodWithCalleeSizeF.map(methodToGraph) , Duration.Inf)
  }

  def findMethodCallers(clz:String, name:String,deep:Option[Int]):Graph = {
    val methodWithCallerSizeF = findMethodCallers(clz,name,deep.getOrElse(3))
    Await.result(methodWithCallerSizeF.map(methodToGraph) , Duration.Inf)
  }

  def getAllClasses():Seq[SimpleClass] = {
    val rF = listAllClasses().map(v => v.map(jc => SimpleClass(jc.name)))
    Await.result(rF , Duration.Inf)
  }

  def findMethodByClasses(name:String):Seq[SimpleMethod] = {
    val rF = queryClassMethods(name).map(v => v.map(jm => SimpleMethod(jm.clz,jm.name)))
    Await.result(rF , Duration.Inf)
  }

  def searchMethods(keys: String):Seq[SimpleMethod] = {
    val rF = searchMethodsByCritical(keys.split("\\s+")).map(v => v.map(jm => SimpleMethod(jm.clz,jm.name)))
    Await.result(rF , Duration.Inf)
  }

  def findMethodInvokes(clz:String, name:String,deep:Option[Int]):Graph = {
    val methodWithCallerSizeF = findMethodCallers(clz,name,deep.getOrElse(3))
    val methodWithCalleeSizeF = findMethodCallees(clz,name,deep.getOrElse(3),Nil)
    val invokesF = for{
      callers <- methodWithCallerSizeF
      callees <- methodWithCalleeSizeF
    } yield {
      callers ++ callees
    }
    Await.result(invokesF.map(methodToGraph) , Duration.Inf)
  }

  def findClassDependences(name: String, deep: Int): Graph = {
    val dependenceesF = findClassDependencees(name, deep)
    val dependencersF = findClassDependencers(name, deep)
    val dependencesF = for{
      dependencees <- dependenceesF
      dependencers <- dependencersF
    } yield {
      dependencees ++ dependencers
    }
    Await.result(dependencesF.map(classToGraph) , Duration.Inf)
  }

  def findClassInvokes(clz:String,deep:Option[Int]):Graph = {
    val graphF = findClassInvokesF(clz,deep.getOrElse(3)).map(classCalleesToGraph)
    Await.result(graphF , Duration.Inf)
  }

  def findATargetInvokeBTarget(aTarget:String,bTarget:String): Seq[VMethodInvoke] = {
    val key = s"${aTarget}_${bTarget}_invokes"
    if(!cache.containsKey(key)) {
      println(s"doest hit cache: $key")
      cache.put(key, Await.result(loadATargetInvokeBTarget(aTarget,bTarget), Duration.Inf))
    }
    cache.get(key).asInstanceOf[Seq[VMethodInvoke]]
  }

  def getPackageLocs():Seq[Treemap] = {
    val f = calcPackageLoc().map(packageLocsToTreemaps)
    Await.result(f , Duration.Inf)
  }

  def cleanCache(): Unit = {
    cache.clear()
  }

}
