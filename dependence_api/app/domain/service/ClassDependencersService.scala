package domain.service

import domain.model.JClass

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

trait ClassDependencersService {
  self: ApplicationService =>

  def findClassDependencers(name:String, deep: Int): Future[Seq[JClass]] = {
    val clzF = repo.findClass(name)
    val classWithDependencersF: Future[Seq[JClass]] = clzF.flatMap(cs => buildDependencers(cs,deep)).map(_.distinct)
    classWithDependencersF
  }

  def buildDependencers(cs: Seq[JClass], deep: Int): Future[Seq[JClass]] = doBuildDependencers(cs,deep,Nil)

  private def doBuildDependencers(clzs: Seq[JClass], deep:Int, acc: Seq[JClass]):Future[Seq[JClass]] = {
    val clzsWithoutDependencers = clzs.filterNot(v => acc.contains(v))
    if(clzsWithoutDependencers.isEmpty || deep == 0) {
      Future(acc ++ clzsWithoutDependencers)
    } else {
      val dependencersF: Seq[(JClass, Future[Seq[JClass]])] = clzsWithoutDependencers.map(clz=>(clz,findDependencers(clz)))
      val rrF: Seq[Future[(JClass,Seq[JClass])]] = dependencersF.map(v => v._2.map(vv => (v._1,vv)))
      val rrrF: Future[Seq[(JClass, Seq[JClass])]] = Future.sequence(rrF)
      val clzWithDependencersF: Future[Seq[JClass]] = rrrF.map(vv => vv.map(vvv => vvv._1.copy(dependencers = vvv._2)))
      clzWithDependencersF.flatMap(dependencers => doBuildDependencers(dependencers.flatMap(_.dependencers),deep - 1, acc ++ dependencers))
    }
  }

  private def findDependencers(clz: JClass):Future[Seq[JClass]] = repo.findDependencers(clz.id).map(_.filter(v => isAnalysisInclude(v.name)))


}
