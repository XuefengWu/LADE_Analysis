import com.google.inject.AbstractModule
import jv.domain.Repository
import jv.infrostracture.RepoSlickImpl


class Module extends AbstractModule {
  override protected def configure(): Unit = {
    bind(classOf[Repository]).to(classOf[RepoSlickImpl])
  }
}