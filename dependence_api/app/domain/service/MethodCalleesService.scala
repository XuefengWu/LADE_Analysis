package domain.service

import domain.model.JMethod

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

trait MethodCalleesService extends MethodBaseService {
  self: ApplicationService =>

  def findMethodCallees(clz:String, name:String,deep: Int): Future[Seq[JMethod]] = {
    val callers = repo.findMethod(clz, name)
    val methodWithCalleeF: Future[Seq[JMethod]] = callers.flatMap(ms => buildCallees(ms,deep)).map(_.distinct)
    methodWithCalleeF.map(ms => ms.map(v => (buildCallerSize(v))))
  }

  private def buildCallees(callers: Seq[JMethod],deep: Int):Future[Seq[JMethod]] = doBuildCallees(callers,deep,Nil)

  private def doBuildCallees(callers: Seq[JMethod],deep:Int,acc: Seq[JMethod]):Future[Seq[JMethod]] = {
    val methodsWithoutCallees = callers.filterNot(v => acc.contains(v))
    if(methodsWithoutCallees.isEmpty || deep == 0) {
      Future(acc ++ methodsWithoutCallees)
    } else {
      val methodPirCalleesF: Seq[(JMethod, Future[(Seq[JMethod],Option[JMethod])])] = methodsWithoutCallees.map(caller=>(caller,findCallees(caller)))
      val rrF: Seq[Future[(JMethod,Seq[JMethod])]] = methodPirCalleesF.map(methodPirCallees => methodPirCallees._2.map(vv =>
        (methodPirCallees._1.copy(child = vv._2),vv._1 ++ vv._2)
      ))
      val rrrF: Future[Seq[(JMethod, Seq[JMethod])]] = Future.sequence(rrF)
      val methodWithCalleesF: Future[Seq[JMethod]] = rrrF.map(vv => vv.map(vvv => vvv._1.copy(callees = vvv._2)))
      methodWithCalleesF.flatMap(methods => doBuildCallees(methods.flatMap(_.callees),deep - 1, acc ++ methods))
    }
  }

  private def findCallees(method: JMethod):Future[(Seq[JMethod],Option[JMethod])] = {
    val calleesF = repo.findMethodCallees(method.id).map(_.filter(v => isAnalysisInclude(v.clz)))
    val implMethodsF = repo.findImplementMethod(method.id).map(_.filter(v => isAnalysisInclude(v.clz)))
    for{
      callees <- calleesF
      implMethods <- implMethodsF
    } yield {
      (callees,implMethods)
    }

  }


}
