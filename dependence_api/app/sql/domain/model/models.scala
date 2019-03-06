package sql.domain.model

import java.util.UUID

case class SqlTableColumn(table:String,column:String)

case class ColumnValue(value: String, isref: Boolean)

case class SqlConditionValue(id:UUID,tableColumn:Option[SqlTableColumn],value:Option[ColumnValue])

case class SqlCondition(id: UUID,left:SqlConditionValue,op:String,right: SqlConditionValue)

case class SqlOperationColumn(id:UUID,tableColumn:SqlTableColumn, op: String)

case class SqlAction(id: UUID, clz:String, method:String, action:String,
                     operations:Seq[SqlOperationColumn] = Nil, conditions:Seq[SqlCondition] = Nil)

//invoker: PLSQL procedure or java method inline sql
case class TableMethodOperator(clz:String,method:String,invoker: String,table: String,column: Option[String],op:String)
