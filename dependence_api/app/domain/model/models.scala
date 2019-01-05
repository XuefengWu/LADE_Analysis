package domain.model

case class JMethod(id:String,clz:String,name:String,
                   callees:Seq[JMethod]=Nil,callers:Seq[JMethod]=Nil,callerSize:Int=0,parent:Option[JMethod] = None,child:Option[JMethod] = None)

case class JClass(id:String,name:String,module:Option[String],dependencees: Seq[JClass] = Nil,dependencers: Seq[JClass] = Nil)

