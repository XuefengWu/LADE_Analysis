package domain

import domain.dto.VMethodInvoke
import domain.model.{JClass, JMethod}

import scala.concurrent.Future


trait Repository {

  def findMethodCallees(id:String):Future[Seq[JMethod]]

  def findInterfaceMethod(id:String):Future[Option[JMethod]]

  def findImplementMethod(id:String):Future[Option[JMethod]]

  def findMethodCallers(id:String):Future[Seq[JMethod]]

  def findMethod(clz:String, name:String):Future[Seq[JMethod]]

  def countCallers(id:String):Future[Int]

  def findClass(name:String):Future[Seq[JClass]]

  def findDependencees(id:String):Future[Seq[JClass]]

  def findDependencers(id:String):Future[Seq[JClass]]

  def loadAllClasses():Future[Seq[JClass]]

  def findClassMethod(name:String):Future[Seq[JMethod]]

  def searchMethods(keys: Seq[String]):Future[Seq[JMethod]]

  def loadATargetInvokeBTarget(aTarget:String,bTarget:String):Future[Seq[VMethodInvoke]]

  def isViewExist(view: String):Future[Boolean]

  def loadNodeColor():Future[Map[String,String]]

}
