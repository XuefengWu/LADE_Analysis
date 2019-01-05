import com.google.inject.AbstractModule
import domain.Repository
import infrostracture.RepoSlickImpl


class Module extends AbstractModule {
  override protected def configure(): Unit = {
    bind(classOf[Repository]).to(classOf[RepoSlickImpl])
  }
}