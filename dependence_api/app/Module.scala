import com.google.inject.AbstractModule

class Module extends AbstractModule {
  override protected def configure(): Unit = {
    bind(classOf[jv.domain.Repository]).to(classOf[jv.infrostracture.RepoSlickImpl])

    bind(classOf[sql.domain.Repository]).to(classOf[sql.infrostracture.RepoSlickImpl])

  }
}