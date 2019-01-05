package domain.service

import domain.model.JClass

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

trait ClassDependenceesService extends BaseDependenceService {
  self: ApplicationService =>

  def findClassDependencees(name:String, deep: Int): Future[Seq[JClass]] = {
    val clzF = repo.findClass(name)
    val classWithDependencesF: Future[Seq[JClass]] = clzF.flatMap(cs => buildDependencees(cs,deep)).map(_.distinct)
    classWithDependencesF
  }

  def buildDependencees(cs: Seq[JClass], deep: Int): Future[Seq[JClass]] = doBuildDependencees(cs,deep,Nil)

  private def doBuildDependencees(clzs: Seq[JClass], deep:Int, acc: Seq[JClass]):Future[Seq[JClass]] = {
    val clzsWithoutDependencees = clzs.filterNot(v => acc.contains(v))
    if(clzsWithoutDependencees.isEmpty || deep == 0) {
      Future(acc ++ clzsWithoutDependencees)
    } else {
      val dependenceesF: Seq[(JClass, Future[Seq[JClass]])] = clzsWithoutDependencees.map(clz=>(clz,findDependencees(clz)))
      val rrF: Seq[Future[(JClass,Seq[JClass])]] = dependenceesF.map(v => v._2.map(vv => (v._1,vv)))
      val rrrF: Future[Seq[(JClass, Seq[JClass])]] = Future.sequence(rrF)
      val clzWithDependenceesF: Future[Seq[JClass]] = rrrF.map(vv => vv.map(vvv => vvv._1.copy(dependencees = vvv._2)))
      clzWithDependenceesF.flatMap(methods => doBuildDependencees(methods.flatMap(_.dependencees),deep - 1, acc ++ methods))
    }
  }

  private def findDependencees(clz: JClass):Future[Seq[JClass]] = repo.findDependencees(clz.id).map(_.filter(v => isAnalysisInclude(v.name)))

}
