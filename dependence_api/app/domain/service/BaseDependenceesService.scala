package domain.service

trait BaseDependenceService {

  def isAnalysisInclude(clz:String):Boolean = clz.startsWith("org.springframework")

}
