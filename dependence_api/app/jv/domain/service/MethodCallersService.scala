package jv.domain.service



import jv.domain.model.JMethod

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

trait MethodCallersService extends MethodBaseService {
  self: ApplicationService =>

  def findMethodCallers(clz:String, name:String,deep: Int): Future[Seq[JMethod]] = {
    val methods = repo.findMethod(clz, name)
    val methodWithCallerF: Future[Seq[JMethod]] = methods.flatMap(ms => buildCallers(ms,deep)).map(_.distinct)
    methodWithCallerF
  }

  private def buildCallers(methods: Seq[JMethod],deep: Int):Future[Seq[JMethod]] = doBuildCallers(methods,deep,Nil)

  private def doBuildCallers(methods: Seq[JMethod],deep: Int,acc: Seq[JMethod]):Future[Seq[JMethod]] = {
    val methodsWithoutCallers = methods.filterNot(v => acc.contains(v))
    if(methodsWithoutCallers.isEmpty || deep == 0) {
      Future(acc ++ methodsWithoutCallers)
    } else {
      val methodPirCallersF: Seq[(JMethod, Future[(Seq[JMethod],Option[JMethod])])] = methodsWithoutCallers.map(method=>(method,findCallers(method)))
      val rrF: Seq[Future[(JMethod,Seq[JMethod])]] = methodPirCallersF.map(methodPirCallers => methodPirCallers._2.map(vv =>
        (methodPirCallers._1.copy(parent = vv._2),vv._1 ++ vv._2)
      ))
      val rrrF: Future[Seq[(JMethod, Seq[JMethod])]] = Future.sequence(rrF)
      val methodWithCallersF: Future[Seq[JMethod]] = rrrF.map(vv => vv.map(vvv => vvv._1.copy(callers = vvv._2)))
      methodWithCallersF.flatMap(methods => doBuildCallers(methods.flatMap(_.callers),deep-1, acc ++ methods))
    }
  }

  private def findCallers(method: JMethod):Future[(Seq[JMethod],Option[JMethod])] = {
    val callersF = repo.findMethodCallers(method.id).map(_.filter(v => isAnalysisInclude(v.clz)))
    val interfaceMethodsF = repo.findInterfaceMethod(method.id).map(_.filter(v => isAnalysisInclude(v.clz)))
    for{
      callers <- callersF
      interfaceMethods <- interfaceMethodsF
    } yield {
      (callers,interfaceMethods)
    }
  }

}
