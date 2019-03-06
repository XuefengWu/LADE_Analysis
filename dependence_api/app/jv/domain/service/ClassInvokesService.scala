package jv.domain.service

import jv.domain.model.ClassCallee

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

trait ClassInvokesService extends ConfigureService {
  self: ApplicationService =>

  def findClassInvokesF(clz:String,deep:Int):Future[Seq[ClassCallee]] = {
    for{
      callers <- findClassCallers(clz,deep)
      callees <- findClassCallees(clz,deep)
    } yield (callers ++ callees).distinct
  }

  private def findClassCallees(clz:String,deep:Int):Future[Seq[ClassCallee]] = {
    val implementsF = repo.findClassImplements(clz)
    val calleesF = repo.findClassCallees(clz).flatMap(v => implementsF.map(_ ++ v))
    if(deep == 1) {
      calleesF.map(_.filter(c => isAnalysisInclude(c.b)))
    } else {
      calleesF.map(_.filter(c => isAnalysisInclude(c.b)))
              .flatMap(callees => {
                for{
                  nextcallers <- findNextClassesCallers(deep - 1, callees)
                  nextCallees <- findNextClassesCallees(deep - 1, callees)
                }yield callees ++ nextcallers ++ nextCallees
              })
    }
  }

  private def findClassCallers(clz:String, deep:Int):Future[Seq[ClassCallee]] = {
    val parentsF = repo.findClassParent(clz)
    val callersF = repo.findClassCallers(clz).flatMap(v => parentsF.map(_ ++ v))
    if(deep == 1) {
      callersF.map(_.filter(c => isAnalysisInclude(c.a)))
    } else {
      callersF.map(_.filter(c => isAnalysisInclude(c.a)))
              .flatMap(callers => {
                for{
                  nextcallers <- findNextClassesCallers(deep - 1, callers)
                  nextCallees <- findNextClassesCallees(deep - 1, callers)
                }yield callers ++ nextcallers ++ nextCallees
              })
    }
  }


  private def findNextClassesCallees(deep: Int, callees: Seq[ClassCallee]): Future[Seq[ClassCallee]] = {
    val deeperCalleesF: Seq[Future[Seq[ClassCallee]]] = callees.map(c => findClassCallees(c.b, deep))
    Future.sequence(deeperCalleesF).map(_.flatten)
  }

  private def findNextClassesCallers(deep: Int, callees: Seq[ClassCallee]) = {

    val deeperCalleesF: Seq[Future[Seq[ClassCallee]]] = callees.map(c => findClassCallers(c.a, deep))
    Future.sequence(deeperCalleesF).map(_.flatten)
  }

}
