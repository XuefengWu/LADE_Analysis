package jv.domain.model

case class JMethod(id:String,clz:String,name:String,
                   callees:Seq[JMethod]=Nil,callers:Seq[JMethod]=Nil,callerSize:Int=0,parent:Option[JMethod] = None,child:Seq[JMethod] = Nil,module:Option[String]=None)

case class JClass(id:String,name:String,module:Option[String],loc:Option[Int],dependencees: Seq[JClass] = Nil,dependencers: Seq[JClass] = Nil,parents:Seq[JClass] = Nil)

case class NodeConfigure(typ:String,key:String,value:String)

case class PackageLoC(name:String, loc: Int, children: List[PackageLoC] = Nil)

case class ClassCallee(a:String,b:String,count:Int,properties:Seq[String] = Nil)