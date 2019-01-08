package jv.infrostracture.schemas



import slick.jdbc.MySQLProfile.api._
import slick.lifted.ProvenShape


class JMethods(tag: Tag) extends Table[(String, String, String)](tag, "JMethod") {
  def id = column[String]("id")

  def name = column[String]("name")

  def clzname = column[String]("clzname")

  // Every table needs a * projection with the same type as the table's type parameter
  def * :ProvenShape[(String, String, String)]  = (id, clzname, name)

  private val methodCallees = TableQuery[JMethodCallees]
  private val methods = TableQuery[JMethods]
  private val classes = TableQuery[JClasses]
  private val classParent = TableQuery[JClassParent]
  private val classMethods = TableQuery[ClassMethods]

  def callees = methodCallees.filter(_.a === id).flatMap(v=>methods.filter(_.id === v.b))
  def callers = methodCallees.filter(_.b === id).flatMap(v=>methods.filter(_.id === v.a))
  def callersRelations = methodCallees.filter(_.b === id)

  def interfaceMethod = {
        classMethods
        .join(classParent).on(_.a === _.a)
        .join(classMethods).on(_._2.b === _.a)
        .join(methods).on(_._2.b === _.id)
        .filter(v => v._1._1._1.b === id && v._2.name === name).map(_._2)
  }

  def implementMethod = {
    classMethods
      .join(classParent).on(_.a === _.b)
      .join(classMethods).on(_._2.a === _.a)
      .join(methods).on(_._2.b === _.id)
      .filter(v => v._1._1._1.b === id && v._2.name === name).map(_._2)
  }

}

class JMethodCallees(tag: Tag) extends Table[(String, String)](tag, "_MethodCallees") {

  def a = column[String]("a")

  def b = column[String]("b")

  // Every table needs a * projection with the same type as the table's type parameter
  def * :ProvenShape[(String, String)]  = (a,b)

}

class JClassParent(tag: Tag) extends Table[(String, String)](tag, "_ClassParent") {

  def a = column[String]("a")

  def b = column[String]("b")

  // Every table needs a * projection with the same type as the table's type parameter
  def * :ProvenShape[(String, String)]  = (a,b)

}

class JClasses(tag: Tag) extends Table[(String, String, Option[String])](tag, "JClass") {

  def id = column[String]("id")
  def name = column[String]("name")
  def module = column[Option[String]]("module")

  // Every table needs a * projection with the same type as the table's type parameter
  def * :ProvenShape[(String, String, Option[String])]  = (id,name,module)


  private val classParent = TableQuery[JClassParent]
  private val jclass = TableQuery[JClasses]
  private val classDependences = TableQuery[ClassDependences]

  def dependencees = classDependences.filter(_.a === id).flatMap(v => jclass.filter(_.id === v.b))
  def dependencers = classDependences.filter(_.b === id).flatMap(v => jclass.filter(_.id === v.a))
  def parentes = classParent.filter(_.a === id).flatMap(v => jclass.filter(_.id === v.b))
  def children = classParent.filter(_.b === id).flatMap(v => jclass.filter(_.id === v.a))

}

class ClassMethods(tag: Tag) extends Table[(String, String)](tag, "_ClassMethods") {

  def a = column[String]("a")

  def b = column[String]("b")

  // Every table needs a * projection with the same type as the table's type parameter
  def * :ProvenShape[(String, String)]  = (a,b)

}

class ClassDependences(tag: Tag) extends Table[(String, String)](tag, "_ClassDependences") {

  def a = column[String]("a")

  def b = column[String]("b")

  // Every table needs a * projection with the same type as the table's type parameter
  def * :ProvenShape[(String, String)]  = (a,b)

}

class Configure(tag: Tag) extends Table[(String, String, String)](tag, "Configure") {

  def typ = column[String]("type")

  def key = column[String]("key")

  def value = column[String]("value")

  // Every table needs a * projection with the same type as the table's type parameter
  def * :ProvenShape[(String, String, String)]  = (typ,key,value)

}
