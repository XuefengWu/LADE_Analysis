package jv.infrostracture

import com.zaxxer.hikari.{HikariConfig, HikariDataSource}
import org.scalatestplus.play.PlaySpec

class HikariDataSourceSpec extends PlaySpec {

  "HikariDataSource" should {

    "create with url.local" in {
      val conf = new HikariConfig()
      conf.setJdbcUrl("jdbc:mysql://root:prisma@localhost:3306/default@default")
      val dataSource = new HikariDataSource(conf)
      val conn = dataSource.getConnection
      val stat = conn.createStatement()
      val res = stat.executeQuery("SELECT count(1) FROM `JClass`")
      res.next()
      val count = res.getInt(1)
      println(count)
    }

  }

}
