package jv.domain.service


import jv.domain.dto.Treemap
import jv.domain.model.{JClass, PackageLoC}

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

trait PackageLocService extends ClassBaseService {
  self: ApplicationService =>

  def packageLocsToTreemaps(pkgs: Seq[PackageLoC]):Seq[Treemap] = {
    pkgs.map(packageLocToTreemap)
  }

  private def packageLocToTreemap(pkg:PackageLoC): Treemap = {
    val value = pkg.loc
    val _lastIndex = pkg.name.lastIndexOf(".")
    val lastIndex = if(_lastIndex > 0) _lastIndex else 0
    val name = pkg.name.substring(lastIndex)
    val path = pkg.name.replace(".","/")
    Treemap(value,name,path,pkg.children.map(packageLocToTreemap))
  }

  def calcPackageLoc():Future[Seq[PackageLoC]] = {
    val classesF = repo.loadAllClasses().map(_.filter(_.loc.isDefined)).map(_.take(3000))
    classesF.map(calcPackageLoc)
  }

  def calcPackageLoc(classes: Seq[JClass]):Seq[PackageLoC] ={
    val pkgLocs: List[PackageLoC] = classes.filter(_.loc.isDefined).map(clzToPackageLoc)
                                        .foldLeft(List.empty[PackageLoC])((res,v) => mergePackageLocToList(v,res))
    println(s"calcPackageLoc size: ${pkgLocs.size}")
    packFlattenPackages(pkgLocs)
  }

  private def packFlattenPackages(pkgs:  List[PackageLoC]):Seq[PackageLoC] = {
    val roots: List[PackageLoC] = pkgs.map(p => p.name.substring(0,p.name.indexOf("."))).distinct.map(v => PackageLoC(v,0))
    pkgs.foldLeft(roots)((z,v) => appendToPackageRoots(v,z))
  }

  private def appendToPackageRoots(pkg: PackageLoC, roots:List[PackageLoC]):List[PackageLoC] = {
    val loc = pkg.loc
    val names: List[String] = pkg.name.split("\\.").toList
    names.foldLeft(("",roots))((z,v) => (z._1 + "." + v,appendToPackageRoots(z._1 + "." + v,loc,z._2)))._2
  }

  private def appendToPackageRoots(name:String,loc:Int,roots:List[PackageLoC]):List[PackageLoC] = {
    val _name = name.substring(1)
   val r = roots.map{pkg =>
     val n = pkg.name
     if(_name == n) {
       pkg.copy(loc = pkg.loc + loc)
     }  else if(_name.startsWith(n)) {
       if(pkg.children.isEmpty) {
         pkg.copy(children = List(PackageLoC(_name,loc)))
       } else {
         if(pkg.children.filter(_.name != _name).exists(v => (_name.split("\\.").length ==  v.name.split("\\.").length))) {
           pkg.copy(children = PackageLoC(_name,loc) :: pkg.children)
         } else {
           pkg.copy(children = appendToPackageRoots(name,loc,pkg.children))
         }
       }
     } else {
       pkg
     }
   }
    r
  }

  private def mergePackageLocToList(pkgLoc:PackageLoC, list: List[PackageLoC]):List[PackageLoC] = {
    list.find(_.name == pkgLoc.name) match {
      case Some(v) => list.map(e => if(e.name == v.name) e.copy(loc=e.loc+pkgLoc.loc) else e)
      case None => pkgLoc :: list
    }
  }

  private def clzToPackageLoc(clz:JClass):PackageLoC={
    val clzName = clz.name
    val loc:Int = clz.loc.getOrElse(0)
    PackageLoC(clzNameToPackageName(clzName),loc)
  }

  private def clzNameToPackageName(clzName:String):String = getParentName(clzName)

  private def getParentName(name:String) = name.substring(0,name.lastIndexOf("."))


}
