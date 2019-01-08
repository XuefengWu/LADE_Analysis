package jv.domain.service

import java.util.concurrent.ConcurrentHashMap

import jv.domain.Repository
import jv.domain.dto._
import javax.inject.{Inject, Singleton}

import scala.concurrent.{Await, Future}
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration

@Singleton
class ApplicationService @Inject()(val repo: Repository)
          extends MethodToGraphService with MethodCalleesService with MethodCallersService
          with ClassToGraphService with ClassDependenceesService with ClassDependencersService
          with ClassBaseService with MethodBaseService {

  private val cache = new ConcurrentHashMap[String,Seq[Any]]()

  def findMethodCallees(clz:String, name:String):Graph = {
    val methodWithCalleeSizeF = findMethodCallees(clz,name,9)
    Await.result(methodWithCalleeSizeF.map(methodToGraph) , Duration.Inf)
  }

  def findMethodCallers(clz:String, name:String):Graph = {
    val methodWithCallerSizeF = findMethodCallers(clz,name,9)
    Await.result(methodWithCallerSizeF.map(methodToGraph) , Duration.Inf)
  }

  def findMethodInvokes(clz:String, name:String):Graph = findMethodInvokes(clz,name,4)

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

  def findMethodInvokes(clz:String, name:String,callerDeep:Int):Graph = {
    val methodWithCallerSizeF = findMethodCallers(clz,name,callerDeep)
    val methodWithCalleeSizeF = findMethodCallees(clz,name,9)
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

  def findATargetInvokeBTarget(aTarget:String,bTarget:String): Seq[VMethodInvoke] = {
    val key = s"${aTarget}_${bTarget}_invokes"
    if(!cache.containsKey(key)) {
      println(s"doest hit cache: $key")
      cache.put(key, Await.result(loadATargetInvokeBTarget(aTarget,bTarget), Duration.Inf))
    }
    cache.get(key).asInstanceOf[Seq[VMethodInvoke]]
  }

  def cleanCache(): Unit = {
    cache.clear()
  }

}
