package domain.service


import domain.model.{JClass, JMethod}

import scala.concurrent.Future

trait ClassBaseService {
  self: ApplicationService =>

  def listAllClasses():Future[Seq[JClass]] = repo.loadAllClasses()

  def queryClassMethods(name:String):Future[Seq[JMethod]] = repo.findClassMethod(name)

}
