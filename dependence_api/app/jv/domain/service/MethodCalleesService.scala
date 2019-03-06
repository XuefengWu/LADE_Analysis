package jv.domain.service

import jv.domain.model.{JClass, JMethod}

import scala.concurrent.{Await, Future}
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration

trait MethodCalleesService extends MethodBaseService with ConfigureService{
  self: ApplicationService =>

  def mergeMethodsToClasses(methods: Seq[JMethod]): Seq[JClass] = {
    mergeDuplicateClasses(methods.map(methodToClasses))
  }


  private def methodToClasses(m:JMethod):JClass = JClass(m.id,m.clz,m.module,None,
                                        m.callees.map(methodToClasses),m.callees.map(methodToClasses),
                                        m.parent.map(v => {List(methodToClasses(v))}).getOrElse(Nil))

  private def mergeDuplicateClasses(clzs: Seq[JClass]):Seq[JClass] = {
    val z = clzs.sortBy(_.name).foldLeft(List.empty[JClass])((z,v) => if(z.exists(_.name == v.name)) appendClzToClasses(v,z) else v :: z )
    z.map(c => c.copy(dependencees = replaceDistinctClzs(c.dependencees,z),
                    dependencers = replaceDistinctClzs(c.dependencers,z),
                    parents = replaceDistinctClzs(c.parents,z)))
  }

  private def appendClzToClasses(clz:JClass, clzs:List[JClass]):List[JClass] = {
   val res = clzs.map(c => if(c.name == clz.name) c.copy(dependencees = mergeDuplicateClasses(c.dependencees ++ clz.dependencees),
                                                dependencers = mergeDuplicateClasses(c.dependencers ++ clz.dependencers),
                                                parents = mergeDuplicateClasses(c.parents ++ clz.parents))
                            else c)
    res
  }

  private def replaceDistinctClzs(clazs: Seq[JClass], distincts: Seq[JClass]) = clazs.map(c => replaceDistinctClz(c,distincts))

  private def replaceDistinctClz(clz:JClass,distincts:Seq[JClass]):JClass = {
    distincts.find(_.name == clz.name).map(v => clz.copy(id = v.id)).getOrElse(clz)
  }

  def findMethodCallees(clz:String, name:String,deep: Int,hide:Seq[String]): Future[Seq[JMethod]] = {
    val method = repo.findMethod(clz, name)
    val methodWithCalleeF: Future[Seq[JMethod]] = method.flatMap(ms => buildCallees(ms,deep,hide)).map(_.distinct)
    methodWithCalleeF.map(ms => ms.map(v => (buildCallerSize(v))))
  }

  private def filterByHideOption(ms: Seq[JMethod],hide:Seq[String]):Seq[JMethod] = {
    ms.filterNot(v => hide.exists(h => (v.clz + "." + v.name).contains(h)))
  }

  private def buildCallees(callers: Seq[JMethod], deep: Int,hide:Seq[String]):Future[Seq[JMethod]] = doBuildCallees(callers,deep,hide,Nil)

  private def doBuildCallees(callers: Seq[JMethod],deep:Int,hide:Seq[String],acc: Seq[JMethod]):Future[Seq[JMethod]] = {
    val methodsWithoutCallees = callers.filterNot(v => acc.contains(v))
    val methodNeedCalees = methodsWithoutCallees
    if(methodNeedCalees.isEmpty || deep == 0) {
      Future(acc ++ methodNeedCalees)
    } else {
      val methodPirCalleesF: Seq[(JMethod, Future[(Seq[JMethod],Seq[JMethod])])] = methodNeedCalees.map(caller=>(caller,findCallees(caller,hide)))

      val rrF: Seq[Future[(JMethod,Seq[JMethod])]] = methodPirCalleesF.map(methodPirCallees => methodPirCallees._2.map(vv =>
        (methodPirCallees._1.copy(child = vv._2),vv._1 ++ vv._2)
      ))
      val rrrF: Future[Seq[(JMethod, Seq[JMethod])]] = Future.sequence(rrF)
      val methodWithCalleesF: Future[Seq[JMethod]] = rrrF.map(vv => vv.map(vvv => vvv._1.copy(callees = vvv._2)))
      methodWithCalleesF.flatMap(methods => doBuildCallees(methods.flatMap(_.callees),deep - 1, hide,acc ++ methods))
    }
  }

  private def findCallees(method: JMethod,hide:Seq[String]):Future[(Seq[JMethod],Seq[JMethod])] = {
    val calleesF = repo.findMethodCallees(method.id,nodeHiddens.filter(_.key == "module").map(_.value))
                        .map(_.filter(v => isAnalysisInclude(v.clz))).map(mergeGetSet)
    val implMethodsF = repo.findImplementMethod(method.id).map(_.filter(v => isAnalysisInclude(v.clz))).map(_.map(_.copy(parent = Some(method))))
    for{
      callees <- calleesF
      implMethods <- implMethodsF
    } yield {
      (filterByHideOption(callees,hide),filterByHideOption(implMethods,hide))
    }

  }

  private def mergeGetSet(methods: Seq[JMethod]): List[JMethod] = {
    methods.foldLeft[List[JMethod]](Nil)((z,v) => appendMethod(v,z))
  }
  private def appendMethod(method:JMethod, agg:List[JMethod]):List[JMethod] = {
    val _method = trimGetSet(method)
    if(agg.exists(m => m.clz+m.name == _method.clz+_method.name)) agg
    else _method :: agg
  }
  private def trimGetSet(method:JMethod):JMethod = {
    if(method.name.startsWith("set") || method.name.startsWith("get")) {
      method.copy(name = method.name.substring(0,3))
    } else {
      method
    }
  }
}
