grammar PlSql;

swallow_to_semi
    : ~( ';' )+
    ;

compilation_unit
    : unit_statement* EOF
    ;

unit_statement
    : create_package
    | create_package_body
    | create_procedure_body
    | create_function_body
    | create_table
    ;


create_package
    : CREATE (OR REPLACE)? PACKAGE (schema_object_name '.')? package_name invoker_rights_clause? (IS | AS) package_obj_spec* END package_name? ';'
    ;

create_package_body
    : CREATE (OR REPLACE)? PACKAGE BODY (schema_object_name '.')? package_name (IS | AS) package_obj_body* (BEGIN seq_of_statements)? END package_name? ';'
    ;

package_obj_body
    :type_declaration
    ;

package_obj_spec
    : pragma_declaration
    | variable_declaration
    | subtype_declaration
    | cursor_declaration
    | exception_declaration
    | type_declaration
    | procedure_spec_declaration
    | function_spec_declaration
    ;

procedure_spec_declaration
    : PROCEDURE procedure_name (procedure_parameter_list)? ';'
    ;

function_spec_declaration
    : FUNCTION function_name (function_parameter_list)?
      RETURN type_spec (invoker_rights_clause|parallel_enable_clause|result_cache_clause|DETERMINISTIC|PIPELINED|AGGREGATE USING implementation_type_name)*
    ;

create_procedure_body
    : (CREATE (OR REPLACE)?)? procedure_body_spec
    ;

procedure_body_spec
    : PROCEDURE procedure_name (procedure_parameter_list)?
    (invoker_rights_clause? is_or_as (declare_spec* body | call_spec | EXTERNAL))?
    ';'
    ;

procedure_parameter_list
    : '(' procedure_parameter ( ',' procedure_parameter )* ')'
    ;

body
    : BEGIN seq_of_statements (EXCEPTION exception_handler+)? END label_name?
    ;

// $<Body - Specific Clause

exception_handler
    : WHEN exception_name (OR exception_name)* THEN seq_of_statements
    ;

// $>


// $<PL/SQL Statements

seq_of_statements
    : (statement ';' | label_declaration)+
    ;

label_declaration
    : ltp1= '<' '<' label_name '>' '>'
    ;


statement
    : body
    | block
    | assignment_statement
    | continue_statement
    | exit_statement
    | goto_statement
    | if_statement
    | loop_statement
    | forall_statement
    | null_statement
    | raise_statement
    | return_statement
    | case_statement
    | sql_statement
    | function_call
    | pipe_row_statement
    | procedure_call
    ;

procedure_call
    : routine_name function_argument?
    ;

pipe_row_statement
    : PIPE ROW '(' expression ')';

// $<SQL PL/SQL Statements

sql_statement
    : execute_immediate
    | data_manipulation_language_statements
    | cursor_manipulation_statements
    | transaction_control_statements
    ;

execute_immediate
    : EXECUTE IMMEDIATE expression (into_clause using_clause? | using_clause dynamic_returning_clause? | dynamic_returning_clause)?
    ;

using_clause
    : USING ('*' | using_element (',' using_element)*)
    ;

using_element
    : (IN OUT? | OUT)? select_list_elements column_alias?
    ;

// $<Execute Immediate - Specific Clause
dynamic_returning_clause
    : (RETURNING | RETURN) into_clause
    ;
// $>


// $<DML SQL PL/SQL Statements

data_manipulation_language_statements
    : merge_statement
    | lock_table_statement
    | select_statement
    | update_statement
    | delete_statement
    | insert_statement
    | explain_statement
    ;

// $>


delete_statement
    : DELETE FROM? general_table_ref where_clause? static_returning_clause? error_logging_clause?
    ;

insert_statement
    : INSERT (single_table_insert | multi_table_insert)
    ;


// Insert Specific Clauses

single_table_insert
    : insert_into_clause (values_clause static_returning_clause? | select_statement) error_logging_clause?
    ;

multi_table_insert
    : (ALL multi_table_element+ | conditional_insert_clause) select_statement
    ;

multi_table_element
    : insert_into_clause values_clause? error_logging_clause?
    ;

conditional_insert_clause
    : (ALL | FIRST)? conditional_insert_when_part+ conditional_insert_else_part?
    ;

conditional_insert_when_part
    : WHEN condition THEN multi_table_element+
    ;

conditional_insert_else_part
    : ELSE multi_table_element+
    ;

insert_into_clause
    : INTO general_table_ref paren_column_list?
    ;


values_clause
    : VALUES '(' expressions? ')'
    ;


explain_statement
    : EXPLAIN PLAN (SET STATEMENT_ID '=' quoted_string)? (INTO tableview_name)?
      FOR (select_statement | update_statement | delete_statement | insert_statement | merge_statement)
    ;

update_statement
    : UPDATE general_table_ref update_set_clause where_clause? static_returning_clause? error_logging_clause?
    ;


where_clause
    : WHERE (CURRENT OF cursor_name | condition_wrapper)
    ;

error_logging_clause
    : LOG ERRORS error_logging_into_part? expression? error_logging_reject_part?
    ;

error_logging_into_part
    : INTO tableview_name
    ;

error_logging_reject_part
    : REJECT LIMIT (UNLIMITED | expression)
    ;

static_returning_clause
    : (RETURNING | RETURN) expression (',' expression)* into_clause
    ;

general_table_ref
    : (dml_table_expression_clause | ONLY '(' dml_table_expression_clause ')') table_alias?
    ;


// $<Update - Specific Clauses
update_set_clause
    : SET
      (column_based_update_set_clause (',' column_based_update_set_clause)* | VALUE '(' identifier ')' '=' expression)
    ;

column_based_update_set_clause
    : column_name '=' expression
    | paren_column_list '=' subquery
    ;


// $>

// $>
merge_statement
    : MERGE INTO tableview_name table_alias? USING selected_tableview ON '(' condition ')'
      (merge_update_clause merge_insert_clause? | merge_insert_clause merge_update_clause?)?
      error_logging_clause?
    ;

// Merge Specific Clauses

merge_update_clause
    : WHEN MATCHED THEN UPDATE SET merge_element (',' merge_element)* where_clause? merge_update_delete_part?
    ;

merge_element
    : column_name '=' expression
    ;

merge_update_delete_part
    : DELETE where_clause
    ;

merge_insert_clause
    : WHEN NOT MATCHED THEN INSERT paren_column_list?
      VALUES '(' expressions? ')' where_clause?
    ;

column_list
    : (','? column_name)+
    ;

paren_column_list
    : LEFT_PAREN column_list RIGHT_PAREN
    ;

selected_tableview
    : (tableview_name | '(' select_statement ')') table_alias?
    ;


lock_table_statement
    : LOCK TABLE any_expr
    ;

// $<Merge - Specific Clauses

// $<Cursor Manipulation SQL PL/SQL Statements

cursor_manipulation_statements
    : close_statement
    | open_statement
    | fetch_statement
    | open_for_statement
    ;

close_statement
    : CLOSE cursor_name
    ;

open_statement
    : OPEN cursor_name ('(' expressions? ')')?
    ;

fetch_statement
    : FETCH cursor_name (it1=INTO (','? (variable_name|expression))+ | BULK COLLECT INTO (','? variable_name)+)
    ;

open_for_statement
    : OPEN variable_name FOR (select_statement | expression) using_clause?
    ;

// $>

// $<Transaction Control SQL PL/SQL Statements

transaction_control_statements
    : set_transaction_command
    | set_constraint_command
    | commit_statement
    | rollback_statement
    | savepoint_statement
    ;

set_transaction_command
    : SET TRANSACTION
      (READ (ONLY | WRITE) | ISOLATION LEVEL (SERIALIZABLE | READ COMMITTED) | USE ROLLBACK SEGMENT rollback_segment_name)?
      (NAME quoted_string)?
    ;

set_constraint_command
    : SET (CONSTRAINT | CONSTRAINTS) (ALL | constraint_name (',' constraint_name)*) (IMMEDIATE | DEFERRED)
    ;

commit_statement
    : COMMIT WORK?
      (COMMENT expression | FORCE (CORRUPT_XID expression| CORRUPT_XID_ALL | expression (',' expression)?))?
      write_clause?
    ;

write_clause
    : WRITE (WAIT|NOWAIT)? (IMMEDIATE|BATCH)?
    ;

rollback_statement
    : ROLLBACK WORK? (TO SAVEPOINT? savepoint_name | FORCE quoted_string)?
    ;

savepoint_statement
    : SAVEPOINT savepoint_name
    ;

case_statement
    : searched_case_statement
    | simple_case_statement
    ;

// $<CASE - Specific Clauses

simple_case_statement
    : label_name? ck1=CASE expression simple_case_when_part+  case_else_part? END CASE? label_name?
    ;

simple_case_when_part
    : WHEN expression_wrapper THEN (/*TODO{$case_statement::isStatement}?*/ seq_of_statements | expression_wrapper)
    ;

searched_case_statement
    : label_name? ck1=CASE searched_case_when_part+ case_else_part? END CASE? label_name?
    ;

searched_case_when_part
    : WHEN condition_wrapper THEN (/*TODO{$case_statement::isStatement}?*/ seq_of_statements | expression_wrapper)
    ;

case_else_part
    : ELSE (/*{$case_statement::isStatement}?*/ seq_of_statements | expression_wrapper)
    ;
// $>

block
    : declare_wrapper? body
    ;


declare_wrapper
    : DECLARE declare_spec*
    ;


assignment_statement
    : (general_element | bind_variable) ASSIGN_OP expression
    ;

continue_statement
    : CONTINUE label_name? (WHEN condition)?
    ;

exit_statement
    : EXIT label_name? (WHEN condition)?
    ;

goto_statement
    : GOTO label_name
    ;

if_statement
    : IF condition THEN then_part elsif_part* else_part? END IF
    ;

then_part
    :seq_of_statements
    ;

elsif_part
    : ELSIF condition THEN then_part
    ;

else_part
    : ELSE seq_of_statements
    ;

loop_statement
    : label_name? (WHILE condition | FOR cursor_loop_param)? LOOP seq_of_statements END LOOP label_name?
    ;

condition
    : expression
    ;

// $<Loop - Specific Clause

cursor_loop_param
    : index_name IN REVERSE? lower_bound range_separator='..' upper_bound
    | record_name IN (cursor_name ('(' expressions? ')')? | '(' select_statement ')')
    ;
// $>

forall_statement
    : FORALL index_name IN bounds_clause sql_statement (SAVE EXCEPTIONS)?
    ;

bounds_clause
    : lower_bound '..' upper_bound
    | INDICES OF collection_name between_bound?
    | VALUES OF index_name
    ;

between_bound
    : BETWEEN lower_bound AND upper_bound
    ;

lower_bound
    : concatenation
    ;

upper_bound
    : concatenation
    ;

null_statement
    : NULL
    ;

raise_statement
    : RAISE exception_name?
    ;

return_statement
    : RETURN cn1=condition?
    ;

strict_function_call
    : CALL? routine_name function_argument
    ;

function_call
    : CALL? routine_name function_argument?
    ;


// $<Body - Specific Clause

// $<PL/SQL Elements Declarations

declare_spec
    : variable_declaration
    | subtype_declaration
    | cursor_declaration
    | exception_declaration
    | pragma_declaration
    | record_declaration
    | table_declaration
    | create_procedure_body
    | create_function_body
    ;

create_function_body
    : (CREATE (OR REPLACE)?)? function_body_spec
    ;

function_body_spec
    : FUNCTION function_name (function_parameter_list)?
      RETURN type_spec (invoker_rights_clause|parallel_enable_clause|result_cache_clause|DETERMINISTIC|PIPELINED|AGGREGATE USING implementation_type_name)*
      (is_or_as (declare_spec* body | call_spec))?
      ';'
    ;

function_parameter_list
    :'(' parameter (',' parameter)* ')'
    ;

result_cache_clause
    : RESULT_CACHE relies_on_part?
    ;

relies_on_part
    : RELIES_ON '(' tableview_name (',' tableview_name)* ')'
    ;

parallel_enable_clause
    : PARALLEL_ENABLE partition_by_clause?
    ;

partition_by_clause
    : '(' PARTITION expression BY (ANY | (HASH | RANGE | LIST) paren_column_list) streaming_clause? ')'
    ;

streaming_clause
    : (ORDER | CLUSTER) expression BY paren_column_list
    ;

//incorporates constant_declaration
variable_declaration
    : identifier CONSTANT? type_spec (NOT NULL)? default_value_part? ';'
    ;

subtype_declaration
    : SUBTYPE type_name IS type_spec (RANGE expression '..' expression)? (NOT NULL)? ';'
    ;

//cursor_declaration incorportates curscursor_body and cursor_spec
cursor_declaration
    : CURSOR cursor_name ('(' parameter_spec (',' parameter_spec)* ')' )? (RETURN type_spec)? (IS select_statement)? ';'
    ;

parameter_spec
    : parameter_name (IN? type_spec)? default_value_part?
    ;

exception_declaration
    : exception_name EXCEPTION ';'
    ;

pragma_declaration
    : PRAGMA (SERIALLY_REUSABLE
    | AUTONOMOUS_TRANSACTION
    | EXCEPTION_INIT '(' exception_name ',' MINUS_SIGN? numeric ')' // Alris fix
    | INLINE '(' id1=identifier ',' expression ')'
    | RESTRICT_REFERENCES '(' (identifier | DEFAULT) (',' identifier)+ ')') ';'
    ;

record_declaration
    : record_type_dec
    | record_var_dec
    ;

// $<Record Declaration - Specific Clauses

//incorporates ref_cursor_type_definition
record_type_dec
    : TYPE type_name IS (RECORD '(' field_spec (',' field_spec)* ')' | REF CURSOR (RETURN type_spec)?) ';'
    ;

field_spec
    : column_name type_spec? (NOT NULL)? default_value_part?
    ;

record_var_dec
    : record_name type_name (AT_SIGN link_name)? (PERCENT_ROWTYPE | PERCENT_TYPE default_value_part?) ';'
    ;

// $>

table_declaration
    : (table_type_dec | table_var_dec) ';'
    ;

table_type_dec
    : TYPE type_name IS (TABLE OF type_spec table_indexed_by_part? (NOT NULL)? | varray_type_def)
    ;


table_indexed_by_part
    : (idx1=INDEXED | idx2=INDEX) BY type_spec
    ;

varray_type_def
    : (VARRAY | VARYING ARRAY) '(' expression ')' OF type_spec (NOT NULL)?
    ;

table_var_dec
    : table_var_name type_spec
    ;

type_declaration
    : TYPE identifier IS (table_type_def | varray_type_def | record_type_def | ref_cursor_type_def) ';'
    ;

record_type_def
    : RECORD '(' (','? field_spec)+ ')'
    ;

table_type_def
    : TABLE OF type_spec table_indexed_by_part? (NOT NULL_)?
    ;


ref_cursor_type_def
    : REF CURSOR (RETURN type_spec)?
    ;

// $>

// $<PL/SQL Statements

call_spec
    : LANGUAGE (java_spec | c_spec)
    ;

// $<Call Spec - Specific Clauses

java_spec
    : JAVA NAME CHAR_STRING
    ;

c_spec
    : C_LETTER (NAME CHAR_STRING)? LIBRARY identifier c_agent_in_clause? (WITH CONTEXT)? c_parameters_clause?
    ;

c_agent_in_clause
    : AGENT IN '(' expression (',' expression)* ')'
    ;

c_parameters_clause
    : PARAMETERS '(' (expression (',' expression)* | '.' '.' '.') ')'
    ;

procedure_parameter
    :parameter
    ;

parameter
    : parameter_name ( IN | OUT | INOUT | NOCOPY)* type_spec? default_value_part?
    ;

type_spec
    : datatype
    | REF? type_name (AT_SIGN link_name)? (PERCENT_ROWTYPE | PERCENT_TYPE)?
    ;

datatype
    : native_datatype_element precision_part? (WITH LOCAL? TIME ZONE)?
    | INTERVAL (YEAR | DAY) ('(' expression_wrapper ')')? TO (MONTH | SECOND) ('(' expression_wrapper ')')?
    ;

expression_wrapper
    : expression
    ;

default_value_part
    : (ASSIGN_OP | DEFAULT) expression
    ;

expressions
    : expression (',' expression)*
    ;

expression
    : strict_function_call
    | (logical_and_expression) ( OR expression )*
    ;

logical_expression
    : multiset_expression (IS NOT?
        (NULL_ | NAN | PRESENT | INFINITE | A_LETTER SET | EMPTY | OF TYPE?
        '(' ONLY? type_spec (',' type_spec)* ')'))*
    | NOT logical_expression
    | logical_expression AND logical_expression
    | logical_expression OR logical_expression
    ;

// $<Common PL/SQL Named Elements



cost_class_name
    : identifier
    ;

attribute_name
    : identifier
    ;

savepoint_name
    : identifier
    ;

rollback_segment_name
    : identifier
    ;

table_var_name
    : identifier
    ;

schema_object_name
    : id_expression
    ;

schema_name
    : identifier
    ;

routine_name
    : identifier ('.' id_expression)* (AT_SIGN link_name)?
    ;

package_name
    : (schema_name '.')? identifier // Alris: ������ ���� �����, TODO: ����� ������ ���� �� � ���� �����
    ;

implementation_type_name
    : identifier ('.' id_expression)?
    ;

parameter_name
    : identifier
    ;

reference_model_name
    : identifier
    ;

main_model_name
    : identifier
    ;


query_name
    : identifier
    ;

constraint_name
    : identifier ('.' id_expression)* (AT_SIGN link_name)?
    ;

label_name
    : id_expression
    ;

type_name
    : id_expression ('.' id_expression)*
    ;


exception_name
    : identifier ('.' id_expression)*
    ;

function_name
    : identifier ('.' id_expression)?
    ;

procedure_name
    : identifier ('.' id_expression)?
    ;


variable_name
    : (INTRODUCER char_set_name)? id_expression ('.' id_expression)?
    | bind_variable
    ;

index_name
    : identifier
    ;

cursor_name
    : identifier
    | bind_variable
    ;

record_name
    : identifier
    | bind_variable
    ;

collection_name
    : identifier ('.' id_expression)?
    ;

// database[.domain [.domain ]... ] [ @ connection_qualifier ]
link_name
    : identifier ('.' identifier)*
    ;

column_name
    : identifier ('.' id_expression)*
    ;

tableview_name
    : identifier ('.' id_expression)?
      (AT_SIGN link_name | /*TODO{!(input.LA(2) == SQL92_RESERVED_BY)}?*/ partition_extension_clause)?
    ;

char_set_name
    : id_expression ('.' id_expression)*
    ;

// $>

logical_and_expression
    : negated_expression ( AND negated_expression )*
    ;

negated_expression
    : NOT negated_expression
    | equality_expression
    ;

equality_expression
    : collection_type_expression
    | (multiset_expression (IS NOT?
      (NULL | NAN | PRESENT | INFINITE | A_LETTER SET | EMPTY | OF TYPE? '(' ONLY? type_spec (',' type_spec)* ')'))*)
    | cursor_expression
    ;

cursor_expression
    : CURSOR '(' subquery ')'
    ;

subquery
    : subquery_basic_elements subquery_operation_part*
    ;

selected_element
    : select_list_elements column_alias?
    ;

from_clause
    : FROM table_ref_list
    ;

select_list_elements
    : tableview_name '.' '*'
    | expression
    ;

table_ref_list
    : table_ref (',' table_ref)*
    ;

table_ref
    : table_ref_aux join_clause*
    ;

table_ref_aux
    : (dml_table_expression_clause
      | '(' table_ref subquery_operation_part* ')'
      | ONLY '(' dml_table_expression_clause ')'
      | dml_table_expression_clause
      )
    flashback_query_clause* (/*{isTableAlias()}?*/ table_alias)?
    ;

subquery_operation_part
    : (UNION ALL? | INTERSECT | MINUS) subquery_basic_elements
    ;

subquery_basic_elements
    : query_block
    | '(' subquery ')'
    ;

query_block
    : SELECT (DISTINCT | UNIQUE | ALL)? (ASTERISK | selected_element (',' selected_element)*)
      into_clause? from_clause where_clause? hierarchical_query_clause? group_by_clause? model_clause?
    ;

hierarchical_query_clause
    : CONNECT BY NOCYCLE? condition start_part?
    | start_part CONNECT BY NOCYCLE? condition
    ;

start_part
    : START WITH condition
    ;

model_clause
    : MODEL cell_reference_options* return_rows_clause? reference_model* main_model
    ;


cell_reference_options
    : (IGNORE | KEEP) NAV
    | UNIQUE (DIMENSION | SINGLE REFERENCE)
    ;

return_rows_clause
    : RETURN (UPDATED | ALL) ROWS
    ;

reference_model
    : REFERENCE reference_model_name ON '(' subquery ')' model_column_clauses cell_reference_options*
    ;

main_model
    : (MAIN main_model_name)? model_column_clauses cell_reference_options* model_rules_clause
    ;

model_column_clauses
    : model_column_partition_part? DIMENSION BY model_column_list MEASURES model_column_list
    ;

model_column_partition_part
    : PARTITION BY model_column_list
    ;

model_column_list
    : '(' (','? model_column)+  ')'
    ;

model_column
    : (expression | query_block) column_alias?
    ;

model_rules_clause
    : model_rules_part? '(' (','? model_rules_element)* ')'
    ;

model_rules_part
    : RULES (UPDATE | UPSERT ALL?)? ((AUTOMATIC | SEQUENTIAL) ORDER)? model_iterate_clause?
    ;

model_rules_element
    : (UPDATE | UPSERT ALL?)? cell_assignment order_by_clause? '=' expression
    ;

cell_assignment
    : model_expression
    ;

model_iterate_clause
    : ITERATE '(' expression ')' until_part?
    ;

until_part
    : UNTIL '(' condition ')'
    ;


dml_table_expression_clause
    : table_collection_expression
    | '(' select_statement subquery_restriction_clause? ')'
    | tableview_name sample_clause?
    ;

select_statement
    : subquery_factoring_clause? subquery (for_update_clause | order_by_clause | offset_clause | fetch_clause)*
    ;

subquery_factoring_clause
    : WITH (','? factoring_element)+
    ;


factoring_element
    : query_name paren_column_list? AS '(' subquery order_by_clause? ')'
      search_clause? cycle_clause?
    ;

search_clause
    : SEARCH (DEPTH | BREADTH) FIRST BY column_name ASC? DESC? (NULLS FIRST)? (NULLS LAST)?
      (',' column_name ASC? DESC? (NULLS FIRST)? (NULLS LAST)?)* SET column_name
    ;

cycle_clause
    : CYCLE column_list SET column_name TO expression DEFAULT expression
    ;

offset_clause
    : OFFSET expression (ROW | ROWS)
    ;

fetch_clause
    : FETCH (FIRST | NEXT) (expression PERCENT_KEYWORD?)? (ROW | ROWS) (ONLY | WITH TIES)
    ;


for_update_clause
    : FOR UPDATE for_update_of_part? for_update_options?
    ;

for_update_options
    : SKIP_ LOCKED
    | NOWAIT
    | WAIT expression
    ;

group_by_clause
    : GROUP BY group_by_elements (',' group_by_elements)* having_clause?
    | having_clause (GROUP BY group_by_elements (',' group_by_elements)*)?
    ;

group_by_elements
    : grouping_sets_clause
    | rollup_cube_clause
    | expression
    ;


grouping_sets_clause
    : GROUPING SETS '(' grouping_sets_elements (',' grouping_sets_elements)* ')'
    ;

grouping_sets_elements
    : rollup_cube_clause
    | '(' expressions? ')'
    | expression
    ;

rollup_cube_clause
    : (ROLLUP|CUBE) '(' grouping_sets_elements (',' grouping_sets_elements)* ')'
    ;

having_clause
    : HAVING condition
    ;

for_update_of_part
    : OF column_name (',' column_name)*
    ;

order_by_clause
    : ORDER SIBLINGS? BY order_by_elements (',' order_by_elements)*
    ;

order_by_elements
    : expression (ASC | DESC)? (NULLS (FIRST | LAST))?
    ;

subquery_restriction_clause
    : WITH (READ ONLY | CHECK OPTION (CONSTRAINT constraint_name)?)
    ;


sample_clause
    : SAMPLE BLOCK? '(' expression (',' expression)? ')' seed_part?
    ;

seed_part
    : SEED '(' expression ')'
    ;

table_collection_expression
    : (TABLE | THE) ('(' subquery ')' | '(' expression ')' ('(' '+' ')')?)
    ;



join_clause
    : (CROSS | NATURAL)? (INNER | outer_join_type)?
      JOIN any_expr
    ;

outer_join_type
    : (FULL | LEFT | RIGHT) OUTER?
    ;


flashback_query_clause
    : VERSIONS BETWEEN (SCN | TIMESTAMP) expression
    | AS OF (SCN | TIMESTAMP | SNAPSHOT) expression
    ;

into_clause
    : INTO into_clause_variable (',' into_clause_variable)*
    | BULK COLLECT INTO into_clause_variable (',' into_clause_variable)*
    ;

into_clause_variable
    : variable_name
    | collection_assoc_expression
    ;


table_alias
    : (identifier | alias_quoted_string)
    ;


partition_extension_clause
    : (SUBPARTITION | PARTITION) FOR? '(' expressions? ')'
    ;

column_alias
    : AS? (identifier | alias_quoted_string)
    | AS
    ;


alias_quoted_string
    : quoted_string
    ;

// (SQL%...)



collection_type_expression
    : collection_assoc_expression
    | collection_assoc_expression '.' FIRST
    | collection_assoc_expression '.' LAST
    | collection_assoc_expression '.' EXISTS '(' expression ')' // ��� ������������� �������� ����� ���� ������
    | collection_assoc_expression '.' PRIOR '(' expression ')'
    | collection_assoc_expression '.' NEXT '(' expression ')'
    | collection_assoc_expression '.' COUNT
    | collection_assoc_expression '.' LIMIT
    ;

collection_assoc_expression
    : collection_name ('(' expression ')')* ('.' variable_name)? // ������������� �������
    ;

multiset_part
    : collection_name
    | collection_assoc_expression
    | function_call
    ;

multiset_expression
    : multiset_part
      (MULTISET (EXCEPT | INTERSECT | UNION) (ALL | DISTINCT)?
      multiset_part)+
    | (relational_expression (NOT? multiset_type OF? concatenation)?)
    ;


multiset_type
    : MEMBER
    | SUBMULTISET
    ;

relational_expression
    : compound_expression
      (( '=' | not_equal_op | '<' | '>' | less_than_or_equals_op | greater_than_or_equals_op ) compound_expression)*
    ;

compound_expression
    : concatenation
      (NOT? (IN in_elements | BETWEEN between_elements | like_type concatenation like_escape_part?))?
    | function_call
    ;


in_elements
    : '(' subquery ')'
    | '(' concatenation_wrapper (',' concatenation_wrapper)* ')'
    | constant
    | bind_variable
    | general_element
    ;

between_elements
    : concatenation AND concatenation
    ;


concatenation
    : additive_expression (concatenation_op additive_expression)*
    ;

additive_expression
    : multiply_expression (('+' | '-') multiply_expression)*
    ;

multiply_expression
    : datetime_expression (('*' | '/' | MOD) datetime_expression)*
    ;

datetime_expression
    : model_expression
      (AT (LOCAL | TIME ZONE concatenation_wrapper) | interval_expression)?
    ;

model_expression
    : unary_expression ('[' model_expression_element ']')?
    ;

model_expression_element
    : (ANY | condition_wrapper) (',' (ANY | condition_wrapper))*
    | single_column_for_loop (',' single_column_for_loop)*
    | multi_column_for_loop
    ;

multi_column_for_loop
    : FOR paren_column_list
      IN  '(' (subquery | '(' expressions? ')') ')'
    ;


unary_expression
    : '-' unary_expression
    | '+' unary_expression
    | PRIOR unary_expression
    | CONNECT_BY_ROOT unary_expression
    | /*TODO {input.LT(1).getText().equalsIgnoreCase("new") && !input.LT(2).getText().equals(".")}?*/ NEW unary_expression
    |  DISTINCT unary_expression
    |  ALL unary_expression
    |  /*TODO{(input.LA(1) == SQL92_RESERVED_CASE || input.LA(2) == SQL92_RESERVED_CASE)}?*/ case_statement/*[false]*/
    |  quantified_expression
    |  standard_function
    |  atom
    ;

standard_function
    : string_function
    | numeric_function_wrapper
    | other_function
    ;
literal
    : CHAR_STRING
    | string_function
    | numeric
    | MAXVALUE
    ;

string_function
    : SUBSTR '(' expression ',' expression (',' expression)? ')'
    | TO_CHAR '(' (table_element | standard_function | expression)
                  (',' quoted_string)? (',' quoted_string)? ')'
    | DECODE '(' expressions  ')'
    | CHR '(' concatenation USING NCHAR_CS ')'
    | NVL '(' expression ',' expression ')'
    | TRIM '(' ((LEADING | TRAILING | BOTH)? quoted_string? FROM)? concatenation ')'
    | TO_DATE '(' expression (',' quoted_string)? ')'
    ;

numeric_function_wrapper
    : numeric_function (single_column_for_loop | multi_column_for_loop)?
    ;


numeric_function
   : SUM '(' (DISTINCT | ALL)? expression ')'
   | COUNT '(' ( ASTERISK | ((DISTINCT | UNIQUE | ALL)? concatenation)? ) ')' over_clause?
   | ROUND '(' expression (',' UNSIGNED_INTEGER)?  ')'
   | AVG '(' (DISTINCT | ALL)? expression ')'
   | MAX '(' (DISTINCT | ALL)? expression ')'
   | LEAST '(' expressions ')'
   | GREATEST '(' expressions ')'
   ;

other_function
    : over_clause_keyword function_argument_analytic over_clause?
    | /*TODO stantard_function_enabling_using*/ regular_id function_argument_modeling using_clause?
    | COUNT '(' ( ASTERISK | (DISTINCT | UNIQUE | ALL)? concatenation) ')' over_clause?
    | (CAST | XMLCAST) '(' (MULTISET '(' subquery ')' | concatenation) AS type_spec ')'
    | COALESCE '(' table_element (',' (numeric | quoted_string))? ')'
    | COLLECT '(' (DISTINCT | UNIQUE)? concatenation collect_order_by_part? ')'
    | within_or_over_clause_keyword function_argument within_or_over_part+
    | cursor_name ( PERCENT_ISOPEN | PERCENT_FOUND | PERCENT_NOTFOUND | PERCENT_ROWCOUNT )
    | DECOMPOSE '(' concatenation (CANONICAL | COMPATIBILITY)? ')'
    | EXTRACT '(' regular_id FROM concatenation ')'
    | (FIRST_VALUE | LAST_VALUE) function_argument_analytic respect_or_ignore_nulls? over_clause
    | standard_prediction_function_keyword
      '(' expressions cost_matrix_clause? using_clause? ')'
    | TRANSLATE '(' expression (USING (CHAR_CS | NCHAR_CS))? (',' expression)* ')'
    | TREAT '(' expression AS REF? type_spec ')'
    | TRIM '(' ((LEADING | TRAILING | BOTH)? quoted_string? FROM)? concatenation ')'
    ;

function_argument_analytic
    : '(' (','? argument respect_or_ignore_nulls?)* ')' keep_clause?
    ;

function_argument_modeling
    : '(' column_name (',' (numeric | NULL_) (',' (numeric | NULL_))?)?
      USING (tableview_name '.' ASTERISK | ASTERISK | (','? expression column_alias?)+)
      ')' keep_clause?
    ;

cost_matrix_clause
    : COST (MODEL AUTO? | '(' (','? cost_class_name)+ ')' VALUES '(' expressions? ')')
    ;

keep_clause
    : KEEP '(' DENSE_RANK (FIRST | LAST) order_by_clause ')' over_clause?
    ;

respect_or_ignore_nulls
    : (RESPECT | IGNORE) NULLS
    ;

within_or_over_part
    : WITHIN GROUP '(' order_by_clause ')'
    | over_clause
    ;

over_clause
    : OVER '(' any_expr ')'
    ;

collect_order_by_part
    : ORDER BY concatenation_wrapper
    ;

//create_table start
create_table
    : CREATE (GLOBAL TEMPORARY)? TABLE tableview_name
        (relational_table) (AS select_statement)?
      ';'
    ;

relational_table
    : ('(' relational_properties ')')?
      (ON COMMIT (DELETE | PRESERVE) ROWS)?
      physical_properties? column_properties?
      (CACHE | NOCACHE)? (RESULT_CACHE '(' MODE (DEFAULT | FORCE) ')')?
      parallel_clause?
      (ROWDEPENDENCIES | NOROWDEPENDENCIES)?
      (enable_disable_clause+)? row_movement_clause? flashback_archive_clause?
    ;

parallel_clause
    : NOPARALLEL
    | PARALLEL parallel_count=UNSIGNED_INTEGER?
    ;

enable_disable_clause
    : (ENABLE | DISABLE) (VALIDATE | NOVALIDATE)?
         (UNIQUE '(' (','? column_name)+ ')'
         | PRIMARY KEY
         | CONSTRAINT constraint_name
         ) using_index_clause? exceptions_clause?
         CASCADE? ((KEEP | DROP) INDEX)?
    ;

row_movement_clause
    : (ENABLE | DISABLE)? ROW MOVEMENT
    ;

flashback_archive_clause
    : FLASHBACK ARCHIVE flashback_archive=REGULAR_ID
    | NO FLASHBACK ARCHIVE
    ;

exceptions_clause
    : EXCEPTIONS INTO tableview_name
    ;

using_index_clause
    : USING INDEX (index_name | '(' create_index ')' | index_attributes )?
    ;

index_attributes
    : ( physical_attributes_clause
      | logging_clause
      | TABLESPACE (tablespace | DEFAULT)
      | key_compression
      | sort_or_nosort
      | REVERSE
      | visible_or_invisible
      | parallel_clause
      )+
    ;

tablespace
    : regular_id
    ;


logging_clause
    : LOGGING
     | NOLOGGING
     | FILESYSTEM_LIKE_LOGGING
    ;

key_compression
    : NOCOMPRESS
    | COMPRESS UNSIGNED_INTEGER
    ;

visible_or_invisible
    : VISIBLE
    | INVISIBLE
    ;


sort_or_nosort
    : SORT
    | NOSORT
    ;


physical_attributes_clause
    : (PCTFREE pctfree=UNSIGNED_INTEGER
      | PCTUSED pctused=UNSIGNED_INTEGER
      | INITRANS inittrans=UNSIGNED_INTEGER
      | storage_clause
      )+
    ;

storage_clause
    : STORAGE '('
         (INITIAL initial_size=size_clause
         | NEXT next_size=size_clause
         | MINEXTENTS minextents=(UNSIGNED_INTEGER | UNLIMITED)
         | MAXEXTENTS minextents=(UNSIGNED_INTEGER | UNLIMITED)
         | PCTINCREASE pctincrease=UNSIGNED_INTEGER
         | FREELISTS freelists=UNSIGNED_INTEGER
         | FREELIST GROUPS freelist_groups=UNSIGNED_INTEGER
         | OPTIMAL (size_clause | NULL_ )
         | BUFFER_POOL (KEEP | RECYCLE | DEFAULT)
         | FLASH_CACHE (KEEP | NONE | DEFAULT)
         | ENCRYPT
         )+
       ')'
    ;

size_clause
    : UNSIGNED_INTEGER REGULAR_ID?
    ;


create_index
    : CREATE (UNIQUE | BITMAP)? INDEX index_name
       ON (cluster_index_clause | table_index_clause | bitmap_join_index_clause)
       UNUSABLE?
       ';'
    ;


cluster_index_clause
    : CLUSTER cluster_name index_attributes?
    ;

cluster_name
    : (id_expression '.')? id_expression
    ;

table_index_clause
    : tableview_name table_alias? '(' (','? index_expr (ASC | DESC)? )+ ')'
          index_properties?
    ;

index_expr
    : column_name
    | expression
    ;

index_properties
    : (global_partitioned_index | local_partitioned_index | index_attributes)+
    | INDEXTYPE IS domain_index_clause
    ;

domain_index_clause
    : indextype local_domain_index_clause? parallel_clause? (PARAMETERS '(' odci_parameters ')' )?
    ;


indextype
    : (id_expression '.')? id_expression
    ;


local_domain_index_clause
    : LOCAL ('(' (','? PARTITION partition_name (PARAMETERS '(' odci_parameters ')' )? )+ ')' )?
    ;

partition_name
    : regular_id
    ;

odci_parameters
    : CHAR_STRING
    ;


local_partitioned_index
    : LOCAL (on_range_partitioned_table
            | on_list_partitioned_table
            | on_hash_partitioned_table
            | on_comp_partitioned_table
            )?
    ;


on_range_partitioned_table
    : '(' (','? PARTITION partition_name?
              ((segment_attributes_clause | key_compression)+ )?
              UNUSABLE? )+
      ')'
    ;

segment_attributes_clause
    : ( physical_attributes_clause
      | TABLESPACE tablespace_name=id_expression
      | logging_clause
      )+
    ;


on_list_partitioned_table
    : '(' (','? PARTITION partition_name?
              ((segment_attributes_clause | key_compression)+ )?
              UNUSABLE? )+
      ')'
    ;

on_hash_partitioned_table
    : STORE IN '(' (','? tablespace)+ ')'
    | '(' (','? PARTITION partition_name? (TABLESPACE tablespace)?
                key_compression? UNUSABLE?)+
      ')'
    ;

on_comp_partitioned_table
    : (STORE IN '(' (','? tablespace)+ ')' )?
        '(' (','? PARTITION partition_name?
            ((segment_attributes_clause | key_compression)+)?
            UNUSABLE index_subpartition_clause? )+
        ')'
    ;


index_subpartition_clause
    : STORE IN '(' (','? tablespace)+ ')'
    | '(' (','? SUBPARTITION subpartition_name? (TABLESPACE tablespace)?
        key_compression? UNUSABLE?)+
      ')'
    ;

subpartition_name
    : partition_name
    ;

global_partitioned_index
    : GLOBAL PARTITION BY (RANGE '(' (','? column_name)+ ')' '(' index_partitioning_clause ')'
                          | HASH '(' (','? column_name)+ ')'
                                            (individual_hash_partitions
                                            | hash_partitions_by_quantity
                                            )
                          )
    ;

individual_hash_partitions
    : '(' (','? PARTITION partition_name? partitioning_storage_clause?)+ ')'
    ;

partitioning_storage_clause
    : ( TABLESPACE tablespace
      | OVERFLOW (TABLESPACE tablespace)?
      | table_compression
      | key_compression
      | lob_partitioning_storage
      | VARRAY varray_item STORE AS (BASICFILE | SECUREFILE)? LOB lob_segname
      )+
    ;

table_compression
    : COMPRESS
        ( BASIC
        | FOR ( OLTP
              | (QUERY | ARCHIVE) (LOW | HIGH)?
              )
        )?
    | NOCOMPRESS
    ;

varray_item
    : (id_expression '.')? (id_expression '.')? id_expression
    ;

lob_partitioning_storage
    : LOB '(' lob_item ')'
       STORE AS (BASICFILE | SECUREFILE)?
               (lob_segname ('(' TABLESPACE tablespace ')' )?
               | '(' TABLESPACE tablespace ')'
               )
    ;


lob_segname
    : regular_id
    ;

lob_item
    : regular_id
    ;


hash_partitions_by_quantity
    : PARTITIONS hash_partition_quantity
       (STORE IN '(' (','? tablespace)+ ')')?
         (table_compression | key_compression)?
         (OVERFLOW STORE IN '(' (','? tablespace)+ ')' )?
    ;


hash_partition_quantity
    : UNSIGNED_INTEGER
    ;


index_partitioning_clause
    : PARTITION partition_name? VALUES LESS THAN '(' (','? literal)+ ')'
        segment_attributes_clause?
    ;

bitmap_join_index_clause
    : tableview_name '(' (','? (tableview_name | table_alias)? column_name (ASC | DESC)? )+ ')'
        FROM (','? tableview_name table_alias)+
        where_clause local_partitioned_index? index_attributes?
    ;


column_properties
    : object_type_col_properties
    | nested_table_col_properties
    | (varray_col_properties | lob_storage_clause) //TODO '(' ( ','? lob_partition_storage)+ ')'
    | xmltype_column_properties
    ;

xmltype_column_properties
    : XMLTYPE COLUMN? column_name xmltype_storage? xmlschema_spec?
    ;


xmltype_storage
    : STORE  AS (OBJECT RELATIONAL
                | (SECUREFILE | BASICFILE)? (CLOB | BINARY XML) (lob_segname ('(' lob_parameters ')')? | '(' lob_parameters ')')?
                )
    | STORE VARRAYS AS (LOBS | TABLES)
    ;

xmlschema_spec
    : (XMLSCHEMA DELIMITED_ID)? ELEMENT DELIMITED_ID
         (allow_or_disallow NONSCHEMA)?
         (allow_or_disallow ANYSCHEMA)?
    ;

allow_or_disallow
    : ALLOW
    | DISALLOW
    ;

lob_storage_clause
    : LOB ( '(' (','? lob_item)+ ')' STORE AS ( (SECUREFILE|BASICFILE) | '(' lob_storage_parameters ')' )+
          | '(' lob_item ')' STORE AS ( (SECUREFILE | BASICFILE) | lob_segname | '(' lob_storage_parameters ')' )+
          )
    ;

lob_storage_parameters
    :  TABLESPACE tablespace | (lob_parameters storage_clause? )
    |  storage_clause
    ;

lob_parameters
    : ( (ENABLE | DISABLE) STORAGE IN ROW
      | CHUNK UNSIGNED_INTEGER
      | PCTVERSION UNSIGNED_INTEGER
      | FREEPOOLS UNSIGNED_INTEGER
      | lob_retention_clause
      | lob_deduplicate_clause
      | lob_compression_clause
      | ENCRYPT encryption_spec
      | DECRYPT
      | (CACHE | NOCACHE | CACHE READS) logging_clause?
      )+
    ;

lob_compression_clause
    : NOCOMPRESS
    | COMPRESS (HIGH | MEDIUM | LOW)?
    ;

lob_retention_clause
    : RETENTION (MAX | MIN UNSIGNED_INTEGER | AUTO | NONE)?
    ;

encryption_spec
    : (USING  CHAR_STRING)? (IDENTIFIED BY REGULAR_ID)? CHAR_STRING? (NO? SALT)?
    ;

lob_deduplicate_clause
    : DEDUPLICATE
    | KEEP_DUPLICATES
    ;


varray_col_properties
    : VARRAY varray_item ( substitutable_column_clause? varray_storage_clause
                         | substitutable_column_clause
                         )
    ;

substitutable_column_clause
    : ELEMENT? IS OF TYPE? '(' type_name ')'
    | NOT? SUBSTITUTABLE AT ALL LEVELS
    ;

varray_storage_clause
    : STORE AS (SECUREFILE|BASICFILE)? LOB ( lob_segname? '(' lob_storage_parameters ')'
                                           | lob_segname
                                           )
    ;

nested_table_col_properties
    : NESTED TABLE  (nested_item | COLUMN_VALUE) substitutable_column_clause? (LOCAL | GLOBAL)?
       STORE AS tableview_name ( '(' ( '(' object_properties ')'
                                     | physical_properties
                                     | column_properties
                                     )+
                                  ')'
                               )?
        (RETURN AS? (LOCATOR | VALUE) )?
     ;

nested_item
    : regular_id
    ;

object_properties
    : (column_name | attribute_name) (DEFAULT expression)? ((','? inline_constraint)+ | inline_ref_constraint)?
    | out_of_line_constraint
    | out_of_line_ref_constraint
    | supplemental_logging_props
    ;

inline_ref_constraint
    : SCOPE IS tableview_name
    | WITH ROWID
    | (CONSTRAINT constraint_name)? references_clause constraint_state?
    ;


inline_constraint
    : (CONSTRAINT constraint_name)?
        ( NOT? NULL_
        | UNIQUE
        | PRIMARY KEY
        | references_clause
        | check_constraint
        )
      constraint_state?
    ;

check_constraint
    : CHECK '(' condition ')' DISABLE?
    ;

constraint_state
    : ( NOT? DEFERRABLE
      | INITIALLY (IMMEDIATE|DEFERRED)
      | (RELY|NORELY)
      | (ENABLE|DISABLE)
      | (VALIDATE|NOVALIDATE)
      | using_index_clause
      )+
    ;


references_clause
    : REFERENCES tableview_name paren_column_list
    ;


out_of_line_ref_constraint
    : SCOPE FOR '(' ref_col_or_attr=regular_id ')' IS tableview_name
    | REF '(' ref_col_or_attr=regular_id ')' WITH ROWID
    | (CONSTRAINT constraint_name)? FOREIGN KEY '(' ( ','? ref_col_or_attr=regular_id)+ ')' references_clause constraint_state?
    ;

out_of_line_constraint
    : ( (CONSTRAINT constraint_name)?
          ( UNIQUE '(' (','? column_name)+ ')'
          | PRIMARY KEY '(' (','? column_name)+ ')'
          | foreign_key_clause
          | CHECK '(' expression ')'
          )
       )
      constraint_state?
    ;

foreign_key_clause
    : FOREIGN KEY paren_column_list references_clause on_delete_clause?
    ;

on_delete_clause
    : ON DELETE (CASCADE | SET NULL_)
    ;


object_type_col_properties
    : COLUMN column=regular_id substitutable_column_clause
    ;

physical_properties
    : deferred_segment_creation?  segment_attributes_clause table_compression?
    ;

deferred_segment_creation
    : SEGMENT CREATION (IMMEDIATE | DEFERRED)
    ;


relational_properties
    : (','? (column_definition
            | virtual_column_definition
            | out_of_line_constraint
            | out_of_line_ref_constraint
            | supplemental_logging_props
            )
      )+
    ;

column_definition
    : column_name (datatype | type_name)
         SORT?  (DEFAULT expression)? (NOT NULL)? (ENCRYPT (USING  CHAR_STRING)? (IDENTIFIED BY regular_id)? CHAR_STRING? (NO? SALT)? )?  (inline_constraint* | inline_ref_constraint)
    ;

virtual_column_definition
    : column_name datatype? (GENERATED ALWAYS)? AS '(' expression ')'
        VIRTUAL? inline_constraint*
    ;

supplemental_logging_props
    : SUPPLEMENTAL LOG (supplemental_log_grp_clause | supplemental_id_key_clause)
    ;

supplemental_log_grp_clause
    : GROUP log_grp '(' (','? regular_id (NO LOG)?)+ ')' ALWAYS?
    ;

log_grp
    : UNSIGNED_INTEGER
    ;


supplemental_id_key_clause
    : DATA '('( ','? ( ALL
                     | PRIMARY KEY
                     | UNIQUE
                     | FOREIGN KEY
                     )
              )+
           ')'
      COLUMNS
    ;


//create_table end

atom
    : table_element outer_join_sign
    | bind_variable
    | constant
    | general_element
    | '(' subquery ')' subquery_operation_part*
    | '(' expressions ')'
    ;


general_element
    : general_element_part ('.' general_element_part)*
    ;

general_element_part
    : (INTRODUCER char_set_name)? id_expression
      ('.' id_expression)* function_argument?
    ;

table_element
    : (INTRODUCER char_set_name)? id_expression ('.' id_expression)*
    ;

condition_wrapper
    : expression
    ;

single_column_for_loop
    : FOR column_name
       ( IN '(' expressions? ')'
       | (LIKE expression)? FROM fromExpr=expression TO toExpr=expression
         action_type=(INCREMENT | DECREMENT) action_expr=expression)
    ;

quantified_expression
    : (SOME | EXISTS | ALL | ANY) ('(' subquery ')' | '(' expression ')')
    ;

interval_expression
    : DAY ('(' concatenation_wrapper ')')? TO SECOND ('(' concatenation_wrapper ')')?
    | YEAR ('(' concatenation_wrapper ')')? TO MONTH
    ;

concatenation_wrapper
    : concatenation
    ;

like_escape_part
    : ESCAPE concatenation
    ;


precision_part
    : '(' numeric (',' numeric)? (CHAR | BYTE)? ')'
    ;


//{ Rule #097 <COMMENT>
SINGLE_LINE_COMMENT
    : '--' ( ~('\r' | '\n') )* (NEWLINE|EOF) -> channel(2)
    ;
//:'--' ( ~('\r' | '\n') )* (NEWLINE|EOF) -> channel(HIDDEN)
MULTI_LINE_COMMENT
    : '/*' .*? '*/'  -> channel(2)
    ;

//:'/*' .*? '*/' -> channel(HIDDEN)

//{ Rule #358 <NATIONAL_CHAR_STRING_LIT> - subtoken typecast in <REGULAR_ID>, it also incorporates <character_representation>
//  Lowercase 'n' is a usual addition to the standard
NATIONAL_CHAR_STRING_LIT
    : N '\'' (~('\'' | '\r' | '\n' ) | '\'' '\'' | NEWLINE)* '\''
    ;
//}

//{ Rule #040 <BIT_STRING_LIT> - subtoken typecast in <REGULAR_ID>
//  Lowercase 'b' is a usual addition to the standard
BIT_STRING_LIT
    : B ('\'' ('0' | '1')* '\'' /*SEPARATOR?*/ )+
    ;
//}


//{ Rule #284 <HEX_STRING_LIT> - subtoken typecast in <REGULAR_ID>
//  Lowercase 'x' is a usual addition to the standard
HEX_STRING_LIT
    : X ('\'' ('a'..'f' | 'A'..'F' | '0'..'9')* '\'' /*SEPARATOR?*/ )+
    ;
DOUBLE_PERIOD:  '..';
PERIOD:         '.';
//}

// SQL*Plus prompt
// TODO should be grammar rule, but tricky to implement
// PROMPT
//     : 'prompt' SPACE ( ~('\r' | '\n') )* (NEWLINE|EOF)
//     ;

//{ Rule #360 <NEWLINE>
fragment
NEWLINE: '\r'? '\n';

numeric
    : UNSIGNED_INTEGER
    | APPROXIMATE_NUM_LIT
    ;


like_type
    : LIKE
    | LIKEC
    | LIKE2
    | LIKE4
    ;

constant
    : TIMESTAMP (quoted_string | bind_variable) (AT TIME ZONE quoted_string)?
    | INTERVAL (quoted_string | bind_variable | general_element_part)
      (DAY | HOUR | MINUTE | SECOND)
      ('(' (UNSIGNED_INTEGER | bind_variable) (',' (UNSIGNED_INTEGER | bind_variable) )? ')')?
      (TO ( DAY | HOUR | MINUTE | SECOND ('(' (UNSIGNED_INTEGER | bind_variable) ')')?))?
    | numeric
    | DATE quoted_string
    | quoted_string
    | NULL
    | TRUE
    | FALSE
    | DBTIMEZONE
    | SESSIONTIMEZONE
    | MINVALUE
    | MAXVALUE
    | DEFAULT
    ;

quoted_string
    : CHAR_STRING
    //| CHAR_STRING_PERL
    | NATIONAL_CHAR_STRING_LIT
    ;


bind_variable
    : (BINDVAR | ':' UNSIGNED_INTEGER)
      (INDICATOR? (BINDVAR | ':' UNSIGNED_INTEGER))?
      ('.' general_element_part)*
    ;


function_argument
    : '(' argument? (',' argument )* ')'
    ;

argument
    : (identifier ASSOCIATION_OPERATOR)? expression_wrapper
    ;


identifier
    : (INTRODUCER char_set_name)? id_expression
    ;

id_expression
    : regular_id
    | DELIMITED_ID
    ;

not_equal_op
    : NOT_EQUAL_OP
    | '<' '>'
    | '!' '='
    | '^' '='
    ;


greater_than_or_equals_op
    : '>='
    | '>' '='
    ;

less_than_or_equals_op
    : '<='
    | '<' '='
    ;

concatenation_op
    : '||'
    | '|' '|'
    ;

outer_join_sign
    : '(' '+' ')'
    ;

any_expr: (~';')* ;

//{ Rule #163 <DELIMITED_ID>
DELIMITED_ID
    : '"' (~('"' | '\r' | '\n') | '"' '"')+ '"'
    ;
//}


//{ Rule #546 <SQL_SPECIAL_CHAR> was split into single rules
 PERCENT:                   '%';
 AMPERSAND:                 '&';
 LEFT_PAREN:                '(';
 RIGHT_PAREN:               ')';
 DOUBLE_ASTERISK:           '**';
 ASTERISK:                  '*';
 PLUS_SIGN:                 '+';
 MINUS_SIGN:                '-';
 COMMA:                     ',';
 SOLIDUS:                   '/';
 AT_SIGN:                   '@';
 ASSIGN_OP:                 ':=';

// See OCI reference for more information about this
BINDVAR
    : ':' SIMPLE_LETTER  (SIMPLE_LETTER | '0' .. '9' | '_')*
    | ':' DELIMITED_ID  // not used in SQL but spotted in v$sqltext when using cursor_sharing
    | ':' UNSIGNED_INTEGER
    | QUESTION_MARK // not in SQL, not in Oracle, not in OCI, use this for JDBC
    ;

COLON
    : ':'
    ;

SEMICOLON
    : ';'
    ;

LESS_THAN_OR_EQUALS_OP
    : '<='
    ;

LESS_THAN_OP
    : '<'
    ;

GREATER_THAN_OR_EQUALS_OP
    : '>='
    ;

NOT_EQUAL_OP
    : '!='
    | '<>'
    | '^='
    | '~='
    ;

CARRET_OPERATOR_PART
    : '^'
    ;

TILDE_OPERATOR_PART
    : '~'
    ;

EXCLAMATION_OPERATOR_PART
    : '!'
    ;

GREATER_THAN_OP
    : '>'
    ;

fragment
QUESTION_MARK
    : '?'
    ;

// protected UNDERSCORE : '_' SEPARATOR ; // subtoken typecast within <INTRODUCER>
CONCATENATION_OP
    : '||'
    ;

VERTICAL_BAR
    : '|'
    ;

EQUALS_OP
    : '='
    ;

//{ Rule #532 <SQL_EMBDD_LANGUAGE_CHAR> was split into single rules:
LEFT_BRACKET
    : '['
    ;

RIGHT_BRACKET
    : ']'
    ;

//}

//{ Rule #319 <INTRODUCER>
INTRODUCER
    : '_' //(SEPARATOR {$type = UNDERSCORE;})?
    ;


SPACES
    // Alris: ��� TokenStreamRewriter ����� �������, ����� ����� ��������� �������� �����
    // : [ \t\r\n]+ -> skip
    : [ \t\r\n]+ -> channel(HIDDEN)
    ;


over_clause_keyword
    : AVG
    | CORR
    | LAG
    | LEAD
    | MAX
    | MEDIAN
    | MIN
    | NTILE
    | RATIO_TO_REPORT
    | ROW_NUMBER
    | SUM
    | VARIANCE
    | REGR_
    | STDDEV
    | VAR_
    | COVAR_
    ;


native_datatype_element
    : BINARY_INTEGER
    | PLS_INTEGER
    | NATURAL
    | BINARY_FLOAT
    | BINARY_DOUBLE
    | NATURALN
    | POSITIVE
    | POSITIVEN
    | SIGNTYPE
    | SIMPLE_INTEGER
    | NVARCHAR2
    | DEC
    | INTEGER
    | INT
    | NUMERIC
    | SMALLINT
    | NUMBER
    | DECIMAL
    | DOUBLE PRECISION?
    | FLOAT
    | REAL
    | NCHAR
    | LONG RAW?
    | CHAR
    | CHARACTER
    | VARCHAR2
    | VARCHAR
    | STRING
    | RAW
    | BOOLEAN
    | DATE
    | ROWID
    | UROWID
    | YEAR
    | MONTH
    | DAY
    | HOUR
    | MINUTE
    | SECOND
    | TIMEZONE_HOUR
    | TIMEZONE_MINUTE
    | TIMEZONE_REGION
    | TIMEZONE_ABBR
    | TIMESTAMP
    | TIMESTAMP_UNCONSTRAINED
    | TIMESTAMP_TZ_UNCONSTRAINED
    | TIMESTAMP_LTZ_UNCONSTRAINED
    | YMINTERVAL_UNCONSTRAINED
    | DSINTERVAL_UNCONSTRAINED
    | BFILE
    | BLOB
    | CLOB
    | NCLOB
    | MLSLABEL
    ;

is_or_as
    : (IS | AS)
    ;

invoker_rights_clause
    : AUTHID (CURRENT_USER|DEFINER)
    ;


within_or_over_clause_keyword
    : CUME_DIST
    | DENSE_RANK
    | LISTAGG
    | PERCENT_RANK
    | PERCENTILE_CONT
    | PERCENTILE_DISC
    | RANK
    ;

standard_prediction_function_keyword
    : PREDICTION
    | PREDICTION_BOUNDS
    | PREDICTION_COST
    | PREDICTION_DETAILS
    | PREDICTION_PROBABILITY
    | PREDICTION_SET
    ;

regular_id
    : non_reserved_keywords_pre12c
    | non_reserved_keywords_in_12c
    | REGULAR_ID
    | A_LETTER
    | AGENT
    | AGGREGATE
    | ANALYZE
    | AUTONOMOUS_TRANSACTION
    | BATCH
    | BINARY_INTEGER
    | BOOLEAN
    | C_LETTER
    | CHAR
    | CLUSTER
    | CONSTRUCTOR
    | CUSTOMDATUM
    | DECIMAL
    | DELETE
    | DETERMINISTIC
    | DSINTERVAL_UNCONSTRAINED
    | ERR
    | EXCEPTION
    | EXCEPTION_INIT
    | EXCEPTIONS
    | EXIT
    | FLOAT
    | FORALL
    | INDICES
    | INOUT
    | INTEGER
    | LANGUAGE
    | LONG
    | LOOP
    | NUMBER
    | ORADATA
    | OSERROR
    | OUT
    | OVERRIDING
    | PARALLEL_ENABLE
    | PIPELINED
    | PLS_INTEGER
    | POSITIVE
    | POSITIVEN
    | PRAGMA
    | RAISE
    | RAW
    | RECORD
    | REF
    | RENAME
    | RESTRICT_REFERENCES
    | RESULT
    | SELF
    | SERIALLY_REUSABLE
    | SET
    | SIGNTYPE
    | SIMPLE_INTEGER
    | SMALLINT
    | SQLDATA
    | SQLERROR
    | SUBTYPE
    | TIMESTAMP_LTZ_UNCONSTRAINED
    | TIMESTAMP_TZ_UNCONSTRAINED
    | TIMESTAMP_UNCONSTRAINED
    | TRIGGER
    | VARCHAR
    | VARCHAR2
    | VARIABLE
    | WARNING
    | WHILE
    | XMLAGG
    | YMINTERVAL_UNCONSTRAINED
    | REGR_
    | VAR_
    | COVAR_
    ;

non_reserved_keywords_in_12c
    : ACL
    | ACTION
    | ACTIONS
    | ACTIVE
    | ACTIVE_DATA
    | ACTIVITY
    | ADAPTIVE_PLAN
    | ADVANCED
    | AFD_DISKSTRING
    | ANOMALY
    | ANSI_REARCH
    | APPLICATION
    | APPROX_COUNT_DISTINCT
    | ARCHIVAL
    | ARCHIVED
    | ASIS
    | ASSIGN
    | AUTO_LOGIN
    | AUTO_REOPTIMIZE
    | AVRO
    | BACKGROUND
    | BATCHSIZE
    | BATCH_TABLE_ACCESS_BY_ROWID
    | BEGINNING
    | BEQUEATH
    | BITMAP_AND
    | BSON
    | CACHING
    | CALCULATED
    | CALLBACK
    | CAPACITY
    | CDBDEFAULT
    | CLASSIFIER
    | CLEANUP
    | CLIENT
    | CLUSTER_DETAILS
    | CLUSTER_DISTANCE
    | CLUSTERING
    | COMMON_DATA
    | COMPONENT
    | COMPONENTS
    | CON_DBID_TO_ID
    | CONDITION
    | CONDITIONAL
    | CON_GUID_TO_ID
    | CON_ID
    | CON_NAME_TO_ID
    | CONTAINER_DATA
    | CONTAINERS
    | CON_UID_TO_ID
    | COOKIE
    | COPY
    | CREATE_FILE_DEST
    | CREDENTIAL
    | CRITICAL
    | CUBE_AJ
    | CUBE_SJ
    | DATAMOVEMENT
    | DATAOBJ_TO_MAT_PARTITION
    | DATAPUMP
    | DATA_SECURITY_REWRITE_LIMIT
    | DAYS
    | DB_UNIQUE_NAME
    | DECORRELATE
    | DEFINE
    | DELEGATE
    | DELETE_ALL
    | DESTROY
    | DIMENSIONS
    | DISABLE_ALL
    | DISABLE_PARALLEL_DML
    | DISCARD
    | DISTRIBUTE
    | DUPLICATE
    | DV
    | EDITIONABLE
    | ELIM_GROUPBY
    | EM
    | ENABLE_ALL
    | ENABLE_PARALLEL_DML
    | EQUIPART
    | EVAL
    | EVALUATE
    | EXISTING
    | EXPRESS
    | EXTRACTCLOBXML
    | FACTOR
    | FAILOVER
    | FAILURE
    | FAMILY
    | FAR
    | FASTSTART
    | FEATURE_DETAILS
    | FETCH
    | FILE_NAME_CONVERT
    | FIXED_VIEW_DATA
    | FORMAT
    | GATHER_OPTIMIZER_STATISTICS
    | GET
    | ILM
    | INACTIVE
    | INDEXING
    | INHERIT
    | INMEMORY
    | INMEMORY_PRUNING
    | INPLACE
    | INTERLEAVED
    | JSON
    | JSON_ARRAY
    | JSON_ARRAYAGG
    | JSON_EQUAL
    | JSON_EXISTS
    | JSON_EXISTS2
    | JSONGET
    | JSON_OBJECT
    | JSON_OBJECTAGG
    | JSONPARSE
    | JSON_QUERY
    | JSON_SERIALIZE
    | JSON_TABLE
    | JSON_TEXTCONTAINS
    | JSON_TEXTCONTAINS2
    | JSON_VALUE
    | KEYSTORE
    | LABEL
    | LAX
    | LIFECYCLE
    | LINEAR
    | LOCKING
    | LOGMINING
    | MAP
    | MATCH
    | MATCHES
    | MATCH_NUMBER
    | MATCH_RECOGNIZE
    | MAX_SHARED_TEMP_SIZE
    | MEMCOMPRESS
    | METADATA
    | MODEL_NB
    | MODEL_SV
    | MODIFICATION
    | MODULE
    | MONTHS
    | MULTIDIMENSIONAL
    | NEG
    | NO_ADAPTIVE_PLAN
    | NO_ANSI_REARCH
    | NO_AUTO_REOPTIMIZE
    | NO_BATCH_TABLE_ACCESS_BY_ROWID
    | NO_CLUSTERING
    | NO_COMMON_DATA
    | NOCOPY
    | NO_DATA_SECURITY_REWRITE
    | NO_DECORRELATE
    | NO_ELIM_GROUPBY
    | NO_GATHER_OPTIMIZER_STATISTICS
    | NO_INMEMORY
    | NO_INMEMORY_PRUNING
    | NOKEEP
    | NONEDITIONABLE
    | NO_OBJECT_LINK
    | NO_PARTIAL_JOIN
    | NO_PARTIAL_ROLLUP_PUSHDOWN
    | NOPARTITION
    | NO_PQ_CONCURRENT_UNION
    | NO_PQ_REPLICATE
    | NO_PQ_SKEW
    | NO_PX_FAULT_TOLERANCE
    | NORELOCATE
    | NOREPLAY
    | NO_ROOT_SW_FOR_LOCAL
    | NO_SQL_TRANSLATION
    | NO_USE_CUBE
    | NO_USE_VECTOR_AGGREGATION
    | NO_VECTOR_TRANSFORM
    | NO_VECTOR_TRANSFORM_DIMS
    | NO_VECTOR_TRANSFORM_FACT
    | NO_ZONEMAP
    | OBJ_ID
    | OFFSET
    | OLS
    | OMIT
    | ONE
    | ORA_CHECK_ACL
    | ORA_CHECK_PRIVILEGE
    | ORA_CLUSTERING
    | ORA_INVOKING_USER
    | ORA_INVOKING_USERID
    | ORA_INVOKING_XS_USER
    | ORA_INVOKING_XS_USER_GUID
    | ORA_RAWCOMPARE
    | ORA_RAWCONCAT
    | ORA_WRITE_TIME
    | PARTIAL
    | PARTIAL_JOIN
    | PARTIAL_ROLLUP_PUSHDOWN
    | PAST
    | PATCH
    | PATH_PREFIX
    | PATTERN
    | PER
    | PERIOD
    | PERMUTE
    | PLUGGABLE
    | POOL_16K
    | POOL_2K
    | POOL_32K
    | POOL_4K
    | POOL_8K
    | PQ_CONCURRENT_UNION
    | PQ_DISTRIBUTE_WINDOW
    | PQ_FILTER
    | PQ_REPLICATE
    | PQ_SKEW
    | PRELOAD
    | PRETTY
    | PREV
    | PRINTBLOBTOCLOB
    | PRIORITY
    | PRIVILEGED
    | PROXY
    | PRUNING
    | PX_FAULT_TOLERANCE
    | REALM
    | REDEFINE
    | RELOCATE
    | RESTART
    | ROLESET
    | ROWID_MAPPING_TABLE
    | RUNNING
    | SAVE
    | SCRUB
    | SDO_GEOM_MBR
    | SECRET
    | SERIAL
    | SERVICE_NAME_CONVERT
    | SERVICES
    | SHARING
    | SHELFLIFE
    | SOURCE_FILE_DIRECTORY
    | SOURCE_FILE_NAME_CONVERT
    | SQL_TRANSLATION_PROFILE
    | STANDARD_HASH
    | STANDBYS
    | STATE
    | STATEMENT
    | STREAM
    | SUBSCRIBE
    | SUBSET
    | SUCCESS
    | SYSBACKUP
    | SYS_CHECK_PRIVILEGE
    | SYSDG
    | SYS_GET_COL_ACLIDS
    | SYSGUID
    | SYSKM
    | SYS_MKXTI
    | SYSOBJ
    | SYS_OP_CYCLED_SEQ
    | SYS_OP_HASH
    | SYS_OP_KEY_VECTOR_CREATE
    | SYS_OP_KEY_VECTOR_FILTER
    | SYS_OP_KEY_VECTOR_FILTER_LIST
    | SYS_OP_KEY_VECTOR_SUCCEEDED
    | SYS_OP_KEY_VECTOR_USE
    | SYS_OP_PART_ID
    | SYS_OP_ZONE_ID
    | SYS_RAW_TO_XSID
    | SYS_XSID_TO_RAW
    | SYS_ZMAP_FILTER
    | SYS_ZMAP_REFRESH
    | TAG
    | TEXT
    | TIER
    | TIES
    | TO_ACLID
    | TRANSLATION
    | TRUST
    | UCS2
    | UNCONDITIONAL
    | UNMATCHED
    | UNPLUG
    | UNSUBSCRIBE
    | USABLE
    | USE_CUBE
    | USE_HIDDEN_PARTITIONS
    | USER_DATA
    | USER_TABLESPACES
    | USE_VECTOR_AGGREGATION
    | USING_NO_EXPAND
    | UTF16BE
    | UTF16LE
    | UTF32
    | UTF8
    | V1
    | V2
    | VALID_TIME_END
    | VECTOR_TRANSFORM
    | VECTOR_TRANSFORM_DIMS
    | VECTOR_TRANSFORM_FACT
    | VERIFIER
    | VIOLATION
    | VISIBILITY
    | WEEK
    | WEEKS
    | WITH_PLSQL
    | WRAPPER
    | XS
    | YEARS
    | ZONEMAP
    ;

non_reserved_keywords_pre12c
    : ABORT
    | ABS
    | ACCESSED
    | ACCESS
    | ACCOUNT
    | ACOS
    | ACTIVATE
    | ACTIVE_COMPONENT
    | ACTIVE_FUNCTION
    | ACTIVE_TAG
    | ADD_COLUMN
    | ADD_GROUP
    | ADD_MONTHS
    | ADD
    | ADJ_DATE
    | ADMINISTER
    | ADMINISTRATOR
    | ADMIN
    | ADVISE
    | ADVISOR
    | AFTER
    | ALIAS
    | ALLOCATE
    | ALLOW
    | ALL_ROWS
    | ALWAYS
    | ANALYZE
    | ANCILLARY
    | AND_EQUAL
    | ANTIJOIN
    | ANYSCHEMA
    | APPENDCHILDXML
    | APPEND
    | APPEND_VALUES
    | APPLY
    | ARCHIVELOG
    | ARCHIVE
    | ARRAY
    | ASCII
    | ASCIISTR
    | ASIN
    | ASSEMBLY
    | ASSOCIATE
    | ASYNCHRONOUS
    | ASYNC
    | ATAN2
    | ATAN
    | AT
    | ATTRIBUTE
    | ATTRIBUTES
    | AUTHENTICATED
    | AUTHENTICATION
    | AUTHID
    | AUTHORIZATION
    | AUTOALLOCATE
    | AUTOEXTEND
    | AUTOMATIC
    | AUTO
    | AVAILABILITY
    | AVG
    | BACKUP
    | BASICFILE
    | BASIC
    | BATCH
    | BECOME
    | BEFORE
    | BEGIN
    | BEGIN_OUTLINE_DATA
    | BEHALF
    | BFILE
    | BFILENAME
    | BIGFILE
    | BINARY_DOUBLE_INFINITY
    | BINARY_DOUBLE
    | BINARY_DOUBLE_NAN
    | BINARY_FLOAT_INFINITY
    | BINARY_FLOAT
    | BINARY_FLOAT_NAN
    | BINARY
    | BIND_AWARE
    | BINDING
    | BIN_TO_NUM
    | BITAND
    | BITMAP
    | BITMAPS
    | BITMAP_TREE
    | BITS
    | BLOB
    | BLOCK
    | BLOCK_RANGE
    | BLOCKSIZE
    | BLOCKS
    | BODY
    | BOTH
    | BOUND
    | BRANCH
    | BREADTH
    | BROADCAST
    | BUFFER_CACHE
    | BUFFER
    | BUFFER_POOL
    | BUILD
    | BULK
    | BYPASS_RECURSIVE_CHECK
    | BYPASS_UJVC
    | BYTE
    | CACHE_CB
    | CACHE_INSTANCES
    | CACHE
    | CACHE_TEMP_TABLE
    | CALL
    | CANCEL
    | CARDINALITY
    | CASCADE
    | CASE
    | CAST
    | CATEGORY
    | CEIL
    | CELL_FLASH_CACHE
    | CERTIFICATE
    | CFILE
    | CHAINED
    | CHANGE_DUPKEY_ERROR_INDEX
    | CHANGE
    | CHARACTER
    | CHAR_CS
    | CHARTOROWID
    | CHECK_ACL_REWRITE
    | CHECKPOINT
    | CHILD
    | CHOOSE
    | CHR
    | CHUNK
    | CLASS
    | CLEAR
    | CLOB
    | CLONE
    | CLOSE_CACHED_OPEN_CURSORS
    | CLOSE
    | CLUSTER_BY_ROWID
    | CLUSTER_ID
    | CLUSTERING_FACTOR
    | CLUSTER_PROBABILITY
    | CLUSTER_SET
    | COALESCE
    | COALESCE_SQ
    | COARSE
    | CO_AUTH_IND
    | COLD
    | COLLECT
    | COLUMNAR
    | COLUMN_AUTH_INDICATOR
    | COLUMN
    | COLUMNS
    | COLUMN_STATS
    | COLUMN_VALUE
    | COMMENT
    | COMMIT
    | COMMITTED
    | COMPACT
    | COMPATIBILITY
    | COMPILE
    | COMPLETE
    | COMPLIANCE
    | COMPOSE
    | COMPOSITE_LIMIT
    | COMPOSITE
    | COMPOUND
    | COMPUTE
    | CONCAT
    | CONFIRM
    | CONFORMING
    | CONNECT_BY_CB_WHR_ONLY
    | CONNECT_BY_COMBINE_SW
    | CONNECT_BY_COST_BASED
    | CONNECT_BY_ELIM_DUPS
    | CONNECT_BY_FILTERING
    | CONNECT_BY_ISCYCLE
    | CONNECT_BY_ISLEAF
    | CONNECT_BY_ROOT
    | CONNECT_TIME
    | CONSIDER
    | CONSISTENT
    | CONSTANT
    | CONST
    | CONSTRAINT
    | CONSTRAINTS
    | CONTAINER
    | CONTENT
    | CONTENTS
    | CONTEXT
    | CONTINUE
    | CONTROLFILE
    | CONVERT
    | CORR_K
    | CORR
    | CORR_S
    | CORRUPTION
    | CORRUPT_XID_ALL
    | CORRUPT_XID
    | COSH
    | COS
    | COST
    | COST_XML_QUERY_REWRITE
    | COUNT
    | COVAR_POP
    | COVAR_SAMP
    | CPU_COSTING
    | CPU_PER_CALL
    | CPU_PER_SESSION
    | CRASH
    | CREATE_STORED_OUTLINES
    | CREATION
    | CROSSEDITION
    | CROSS
    | CSCONVERT
    | CUBE_GB
    | CUBE
    | CUME_DISTM
    | CUME_DIST
    | CURRENT_DATE
    | CURRENT
    | CURRENT_SCHEMA
    | CURRENT_TIME
    | CURRENT_TIMESTAMP
    | CURRENT_USER
    | CURRENTV
    | CURSOR
    | CURSOR_SHARING_EXACT
    | CURSOR_SPECIFIC_SEGMENT
    | CV
    | CYCLE
    | DANGLING
    | DATABASE
    | DATAFILE
    | DATAFILES
    | DATA
    | DATAOBJNO
    | DATAOBJ_TO_PARTITION
    | DATE_MODE
    | DAY
    | DBA
    | DBA_RECYCLEBIN
    | DBMS_STATS
    | DB_ROLE_CHANGE
    | DBTIMEZONE
    | DB_VERSION
    | DDL
    | DEALLOCATE
    | DEBUGGER
    | DEBUG
    | DECLARE
    | DEC
    | DECOMPOSE
    | DECREMENT
    | DECR
    | DECRYPT
    | DEDUPLICATE
    | DEFAULTS
    | DEFERRABLE
    | DEFERRED
    | DEFINED
    | DEFINER
    | DEGREE
    | DELAY
    | DELETEXML
    | DEMAND
    | DENSE_RANKM
    | DENSE_RANK
    | DEPENDENT
    | DEPTH
    | DEQUEUE
    | DEREF
    | DEREF_NO_REWRITE
    | DETACHED
    | DETERMINES
    | DICTIONARY
    | DIMENSION
    | DIRECT_LOAD
    | DIRECTORY
    | DIRECT_PATH
    | DISABLE
    | DISABLE_PRESET
    | DISABLE_RPKE
    | DISALLOW
    | DISASSOCIATE
    | DISCONNECT
    | DISKGROUP
    | DISK
    | DISKS
    | DISMOUNT
    | DISTINGUISHED
    | DISTRIBUTED
    | DML
    | DML_UPDATE
    | DOCFIDELITY
    | DOCUMENT
    | DOMAIN_INDEX_FILTER
    | DOMAIN_INDEX_NO_SORT
    | DOMAIN_INDEX_SORT
    | DOUBLE
    | DOWNGRADE
    | DRIVING_SITE
    | DROP_COLUMN
    | DROP_GROUP
    | DST_UPGRADE_INSERT_CONV
    | DUMP
    | DYNAMIC
    | DYNAMIC_SAMPLING_EST_CDN
    | DYNAMIC_SAMPLING
    | EACH
    | EDITIONING
    | EDITION
    | EDITIONS
    | ELEMENT
    | ELIMINATE_JOIN
    | ELIMINATE_OBY
    | ELIMINATE_OUTER_JOIN
    | EMPTY_BLOB
    | EMPTY_CLOB
    | EMPTY
    | ENABLE
    | ENABLE_PRESET
    | ENCODING
    | ENCRYPTION
    | ENCRYPT
    | END_OUTLINE_DATA
    | ENFORCED
    | ENFORCE
    | ENQUEUE
    | ENTERPRISE
    | ENTITYESCAPING
    | ENTRY
    | ERROR_ARGUMENT
    | ERROR
    | ERROR_ON_OVERLAP_TIME
    | ERRORS
    | ESCAPE
    | ESTIMATE
    | EVALNAME
    | EVALUATION
    | EVENTS
    | EVERY
    | EXCEPTIONS
    | EXCEPT
    | EXCHANGE
    | EXCLUDE
    | EXCLUDING
    | EXECUTE
    | EXEMPT
    | EXISTSNODE
    | EXPAND_GSET_TO_UNION
    | EXPAND_TABLE
    | EXPIRE
    | EXPLAIN
    | EXPLOSION
    | EXP
    | EXPORT
    | EXPR_CORR_CHECK
    | EXTENDS
    | EXTENT
    | EXTENTS
    | EXTERNALLY
    | EXTERNAL
    | EXTRACT
    | EXTRACTVALUE
    | EXTRA
    | FACILITY
    | FACT
    | FACTORIZE_JOIN
    | FAILED_LOGIN_ATTEMPTS
    | FAILED
    | FAILGROUP
    | FALSE
    | FAST
    | FBTSCAN
    | FEATURE_ID
    | FEATURE_SET
    | FEATURE_VALUE
    | FILE
    | FILESYSTEM_LIKE_LOGGING
    | FILTER
    | FINAL
    | FINE
    | FINISH
    | FIRSTM
    | FIRST
    | FIRST_ROWS
    | FIRST_VALUE
    | FLAGGER
    | FLASHBACK
    | FLASH_CACHE
    | FLOB
    | FLOOR
    | FLUSH
    | FOLDER
    | FOLLOWING
    | FOLLOWS
    | FORCE
    | FORCE_XML_QUERY_REWRITE
    | FOREIGN
    | FOREVER
    | FORWARD
    | FRAGMENT_NUMBER
    | FREELIST
    | FREELISTS
    | FREEPOOLS
    | FRESH
    | FROM_TZ
    | FULL
    | FULL_OUTER_JOIN_TO_OUTER
    | FUNCTION
    | FUNCTIONS
    | GATHER_PLAN_STATISTICS
    | GBY_CONC_ROLLUP
    | GBY_PUSHDOWN
    | GENERATED
    | GLOBALLY
    | GLOBAL
    | GLOBAL_NAME
    | GLOBAL_TOPIC_ENABLED
    | GREATEST
    | GROUP_BY
    | GROUP_ID
    | GROUPING_ID
    | GROUPING
    | GROUPS
    | GUARANTEED
    | GUARANTEE
    | GUARD
    | HASH_AJ
    | HASHKEYS
    | HASH
    | HASH_SJ
    | HEADER
    | HEAP
    | HELP
    | HEXTORAW
    | HEXTOREF
    | HIDDEN_KEYWORD
    | HIDE
    | HIERARCHY
    | HIGH
    | HINTSET_BEGIN
    | HINTSET_END
    | HOT
    | HOUR
    | HWM_BROKERED
    | HYBRID
    | IDENTIFIER
    | IDENTITY
    | IDGENERATORS
    | IDLE_TIME
    | ID
    | IF
    | IGNORE
    | IGNORE_OPTIM_EMBEDDED_HINTS
    | IGNORE_ROW_ON_DUPKEY_INDEX
    | IGNORE_WHERE_CLAUSE
    | IMMEDIATE
    | IMPACT
    | IMPORT
    | INCLUDE
    | INCLUDE_VERSION
    | INCLUDING
    | INCREMENTAL
    | INCREMENT
    | INCR
    | INDENT
    | INDEX_ASC
    | INDEX_COMBINE
    | INDEX_DESC
    | INDEXED
    | INDEXES
    | INDEX_FFS
    | INDEX_FILTER
    | INDEX_JOIN
    | INDEX_ROWS
    | INDEX_RRS
    | INDEX_RS_ASC
    | INDEX_RS_DESC
    | INDEX_RS
    | INDEX_SCAN
    | INDEX_SKIP_SCAN
    | INDEX_SS_ASC
    | INDEX_SS_DESC
    | INDEX_SS
    | INDEX_STATS
    | INDEXTYPE
    | INDEXTYPES
    | INDICATOR
    | INFINITE
    | INFORMATIONAL
    | INITCAP
    | INITIALIZED
    | INITIALLY
    | INITIAL
    | INITRANS
    | INLINE
    | INLINE_XMLTYPE_NT
    | IN_MEMORY_METADATA
    | INNER
    | INSERTCHILDXMLAFTER
    | INSERTCHILDXMLBEFORE
    | INSERTCHILDXML
    | INSERTXMLAFTER
    | INSERTXMLBEFORE
    | INSTANCE
    | INSTANCES
    | INSTANTIABLE
    | INSTANTLY
    | INSTEAD
    | INSTR2
    | INSTR4
    | INSTRB
    | INSTRC
    | INSTR
    | INTERMEDIATE
    | INTERNAL_CONVERT
    | INTERNAL_USE
    | INTERPRETED
    | INTERVAL
    | INT
    | INVALIDATE
    | INVISIBLE
    | IN_XQUERY
    | ISOLATION_LEVEL
    | ISOLATION
    | ITERATE
    | ITERATION_NUMBER
    | JAVA
    | JOB
    | JOIN
    | KEEP_DUPLICATES
    | KEEP
    | KERBEROS
    | KEY_LENGTH
    | KEY
    | KEYSIZE
    | KEYS
    | KILL
    | LAG
    | LAST_DAY
    | LAST
    | LAST_VALUE
    | LATERAL
    | LAYER
    | LDAP_REGISTRATION_ENABLED
    | LDAP_REGISTRATION
    | LDAP_REG_SYNC_INTERVAL
    | LEADING
    | LEAD
    | LEAST
    | LEFT
    | LENGTH2
    | LENGTH4
    | LENGTHB
    | LENGTHC
    | LENGTH
    | LESS
    | LEVEL
    | LEVELS
    | LIBRARY
    | LIFE
    | LIFETIME
    | LIKE2
    | LIKE4
    | LIKEC
    | LIKE_EXPAND
    | LIMIT
    | LINK
    | LISTAGG
    | LIST
    | LN
    | LNNVL
    | LOAD
    | LOB
    | LOBNVL
    | LOBS
    | LOCAL_INDEXES
    | LOCAL
    | LOCALTIME
    | LOCALTIMESTAMP
    | LOCATION
    | LOCATOR
    | LOCKED
    | LOGFILE
    | LOGFILES
    | LOGGING
    | LOGICAL
    | LOGICAL_READS_PER_CALL
    | LOGICAL_READS_PER_SESSION
    | LOG
    | LOGOFF
    | LOGON
    | LOG_READ_ONLY_VIOLATIONS
    | LOWER
    | LOW
    | LPAD
    | LTRIM
    | MAIN
    | MAKE_REF
    | MANAGED
    | MANAGEMENT
    | MANAGE
    | MANAGER
    | MANUAL
    | MAPPING
    | MASTER
    | MATCHED
    | MATERIALIZED
    | MATERIALIZE
    | MAXARCHLOGS
    | MAXDATAFILES
    | MAXEXTENTS
    | MAXIMIZE
    | MAXINSTANCES
    | MAXLOGFILES
    | MAXLOGHISTORY
    | MAXLOGMEMBERS
    | MAX
    | MAXSIZE
    | MAXTRANS
    | MAXVALUE
    | MEASURE
    | MEASURES
    | MEDIAN
    | MEDIUM
    | MEMBER
    | MEMORY
    | MERGEACTIONS
    | MERGE_AJ
    | MERGE_CONST_ON
    | MERGE
    | MERGE_SJ
    | METHOD
    | MIGRATE
    | MIGRATION
    | MINEXTENTS
    | MINIMIZE
    | MINIMUM
    | MINING
    | MIN
    | MINUS_NULL
    | MINUTE
    | MINVALUE
    | MIRRORCOLD
    | MIRRORHOT
    | MIRROR
    | MLSLABEL
    | MODEL_COMPILE_SUBQUERY
    | MODEL_DONTVERIFY_UNIQUENESS
    | MODEL_DYNAMIC_SUBQUERY
    | MODEL_MIN_ANALYSIS
    | MODEL
    | MODEL_NO_ANALYSIS
    | MODEL_PBY
    | MODEL_PUSH_REF
    | MODIFY_COLUMN_TYPE
    | MODIFY
    | MOD
    | MONITORING
    | MONITOR
    | MONTH
    | MONTHS_BETWEEN
    | MOUNT
    | MOUNTPATH
    | MOVEMENT
    | MOVE
    | MULTISET
    | MV_MERGE
    | NAMED
    | NAME
    | NAMESPACE
    | NAN
    | NANVL
    | NATIONAL
    | NATIVE_FULL_OUTER_JOIN
    | NATIVE
    | NATURAL
    | NAV
    | NCHAR_CS
    | NCHAR
    | NCHR
    | NCLOB
    | NEEDED
    | NESTED
    | NESTED_TABLE_FAST_INSERT
    | NESTED_TABLE_GET_REFS
    | NESTED_TABLE_ID
    | NESTED_TABLE_SET_REFS
    | NESTED_TABLE_SET_SETID
    | NETWORK
    | NEVER
    | NEW
    | NEW_TIME
    | NEXT_DAY
    | NEXT
    | NL_AJ
    | NLJ_BATCHING
    | NLJ_INDEX_FILTER
    | NLJ_INDEX_SCAN
    | NLJ_PREFETCH
    | NLS_CALENDAR
    | NLS_CHARACTERSET
    | NLS_CHARSET_DECL_LEN
    | NLS_CHARSET_ID
    | NLS_CHARSET_NAME
    | NLS_COMP
    | NLS_CURRENCY
    | NLS_DATE_FORMAT
    | NLS_DATE_LANGUAGE
    | NLS_INITCAP
    | NLS_ISO_CURRENCY
    | NL_SJ
    | NLS_LANG
    | NLS_LANGUAGE
    | NLS_LENGTH_SEMANTICS
    | NLS_LOWER
    | NLS_NCHAR_CONV_EXCP
    | NLS_NUMERIC_CHARACTERS
    | NLS_SORT
    | NLSSORT
    | NLS_SPECIAL_CHARS
    | NLS_TERRITORY
    | NLS_UPPER
    | NO_ACCESS
    | NOAPPEND
    | NOARCHIVELOG
    | NOAUDIT
    | NO_BASETABLE_MULTIMV_REWRITE
    | NO_BIND_AWARE
    | NO_BUFFER
    | NOCACHE
    | NO_CARTESIAN
    | NO_CHECK_ACL_REWRITE
    | NO_CLUSTER_BY_ROWID
    | NO_COALESCE_SQ
    | NO_CONNECT_BY_CB_WHR_ONLY
    | NO_CONNECT_BY_COMBINE_SW
    | NO_CONNECT_BY_COST_BASED
    | NO_CONNECT_BY_ELIM_DUPS
    | NO_CONNECT_BY_FILTERING
    | NO_COST_XML_QUERY_REWRITE
    | NO_CPU_COSTING
    | NOCPU_COSTING
    | NOCYCLE
    | NODELAY
    | NO_DOMAIN_INDEX_FILTER
    | NO_DST_UPGRADE_INSERT_CONV
    | NO_ELIMINATE_JOIN
    | NO_ELIMINATE_OBY
    | NO_ELIMINATE_OUTER_JOIN
    | NOENTITYESCAPING
    | NO_EXPAND_GSET_TO_UNION
    | NO_EXPAND
    | NO_EXPAND_TABLE
    | NO_FACT
    | NO_FACTORIZE_JOIN
    | NO_FILTERING
    | NOFORCE
    | NO_FULL_OUTER_JOIN_TO_OUTER
    | NO_GBY_PUSHDOWN
    | NOGUARANTEE
    | NO_INDEX_FFS
    | NO_INDEX
    | NO_INDEX_SS
    | NO_LOAD
    | NOLOCAL
    | NOLOGGING
    | NOMAPPING
    | NOMAXVALUE
    | NO_MERGE
    | NOMINIMIZE
    | NOMINVALUE
    | NO_MODEL_PUSH_REF
    | NO_MONITORING
    | NOMONITORING
    | NO_MONITOR
    | NO_MULTIMV_REWRITE
    | NO
    | NO_NATIVE_FULL_OUTER_JOIN
    | NONBLOCKING
    | NONE
    | NO_NLJ_BATCHING
    | NO_NLJ_PREFETCH
    | NONSCHEMA
    | NOORDER
    | NO_ORDER_ROLLUPS
    | NO_OUTER_JOIN_TO_ANTI
    | NO_OUTER_JOIN_TO_INNER
    | NOOVERRIDE
    | NO_PARALLEL_INDEX
    | NOPARALLEL_INDEX
    | NO_PARALLEL
    | NOPARALLEL
    | NO_PARTIAL_COMMIT
    | NO_PLACE_DISTINCT
    | NO_PLACE_GROUP_BY
    | NO_PQ_MAP
    | NO_PRUNE_GSETS
    | NO_PULL_PRED
    | NO_PUSH_PRED
    | NO_PUSH_SUBQ
    | NO_PX_JOIN_FILTER
    | NO_QKN_BUFF
    | NO_QUERY_TRANSFORMATION
    | NO_REF_CASCADE
    | NORELY
    | NOREPAIR
    | NORESETLOGS
    | NO_RESULT_CACHE
    | NOREVERSE
    | NO_REWRITE
    | NOREWRITE
    | NORMAL
    | NOROWDEPENDENCIES
    | NOSCHEMACHECK
    | NOSEGMENT
    | NO_SEMIJOIN
    | NO_SEMI_TO_INNER
    | NO_SET_TO_JOIN
    | NOSORT
    | NO_SQL_TUNE
    | NO_STAR_TRANSFORMATION
    | NO_STATEMENT_QUEUING
    | NO_STATS_GSETS
    | NOSTRICT
    | NO_SUBQUERY_PRUNING
    | NO_SUBSTRB_PAD
    | NO_SWAP_JOIN_INPUTS
    | NOSWITCH
    | NO_TABLE_LOOKUP_BY_NL
    | NO_TEMP_TABLE
    | NOTHING
    | NOTIFICATION
    | NO_TRANSFORM_DISTINCT_AGG
    | NO_UNNEST
    | NO_USE_HASH_AGGREGATION
    | NO_USE_HASH_GBY_FOR_PUSHDOWN
    | NO_USE_HASH
    | NO_USE_INVISIBLE_INDEXES
    | NO_USE_MERGE
    | NO_USE_NL
    | NOVALIDATE
    | NO_XDB_FASTPATH_INSERT
    | NO_XML_DML_REWRITE
    | NO_XMLINDEX_REWRITE_IN_SELECT
    | NO_XMLINDEX_REWRITE
    | NO_XML_QUERY_REWRITE
    | NTH_VALUE
    | NTILE
    | NULLIF
    | NULLS
    | NUMERIC
    | NUM_INDEX_KEYS
    | NUMTODSINTERVAL
    | NUMTOYMINTERVAL
    | NVARCHAR2
    | NVL2
    | NVL
    | OBJECT2XML
    | OBJECT
    | OBJNO
    | OBJNO_REUSE
    | OCCURENCES
    | OFFLINE
    | OFF
    | OIDINDEX
    | OID
    | OLAP
    | OLD
    | OLD_PUSH_PRED
    | OLTP
    | ONLINE
    | ONLY
    | OPAQUE
    | OPAQUE_TRANSFORM
    | OPAQUE_XCANONICAL
    | OPCODE
    | OPEN
    | OPERATIONS
    | OPERATOR
    | OPT_ESTIMATE
    | OPTIMAL
    | OPTIMIZE
    | OPTIMIZER_FEATURES_ENABLE
    | OPTIMIZER_GOAL
    | OPT_PARAM
    | ORA_BRANCH
    | ORADEBUG
    | ORA_DST_AFFECTED
    | ORA_DST_CONVERT
    | ORA_DST_ERROR
    | ORA_GET_ACLIDS
    | ORA_GET_PRIVILEGES
    | ORA_HASH
    | ORA_ROWSCN
    | ORA_ROWSCN_RAW
    | ORA_ROWVERSION
    | ORA_TABVERSION
    | ORDERED
    | ORDERED_PREDICATES
    | ORDINALITY
    | OR_EXPAND
    | ORGANIZATION
    | OR_PREDICATES
    | OTHER
    | OUTER_JOIN_TO_ANTI
    | OUTER_JOIN_TO_INNER
    | OUTER
    | OUTLINE_LEAF
    | OUTLINE
    | OUT_OF_LINE
    | OVERFLOW
    | OVERFLOW_NOMOVE
    | OVERLAPS
    | OVER
    | OWNER
    | OWNERSHIP
    | OWN
    | PACKAGE
    | PACKAGES
    | PARALLEL_INDEX
    | PARALLEL
    | PARAMETERS
    | PARAM
    | PARENT
    | PARITY
    | PARTIALLY
    | PARTITION_HASH
    | PARTITION_LIST
    | PARTITION
    | PARTITION_RANGE
    | PARTITIONS
    | PARTNUMINST
    | PASSING
    | PASSWORD_GRACE_TIME
    | PASSWORD_LIFE_TIME
    | PASSWORD_LOCK_TIME
    | PASSWORD
    | PASSWORD_REUSE_MAX
    | PASSWORD_REUSE_TIME
    | PASSWORD_VERIFY_FUNCTION
    | PATH
    | PATHS
    | PBL_HS_BEGIN
    | PBL_HS_END
    | PCTINCREASE
    | PCTTHRESHOLD
    | PCTUSED
    | PCTVERSION
    | PENDING
    | PERCENTILE_CONT
    | PERCENTILE_DISC
    | PERCENT_KEYWORD
    | PERCENT_RANKM
    | PERCENT_RANK
    | PERFORMANCE
    | PERMANENT
    | PERMISSION
    | PFILE
    | PHYSICAL
    | PIKEY
    | PIV_GB
    | PIVOT
    | PIV_SSF
    | PLACE_DISTINCT
    | PLACE_GROUP_BY
    | PLAN
    | PLSCOPE_SETTINGS
    | PLSQL_CCFLAGS
    | PLSQL_CODE_TYPE
    | PLSQL_DEBUG
    | PLSQL_OPTIMIZE_LEVEL
    | PLSQL_WARNINGS
    | POINT
    | POLICY
    | POST_TRANSACTION
    | POWERMULTISET_BY_CARDINALITY
    | POWERMULTISET
    | POWER
    | PQ_DISTRIBUTE
    | PQ_MAP
    | PQ_NOMAP
    | PREBUILT
    | PRECEDES
    | PRECEDING
    | PRECISION
    | PRECOMPUTE_SUBQUERY
    | PREDICATE_REORDERS
    | PREDICTION_BOUNDS
    | PREDICTION_COST
    | PREDICTION_DETAILS
    | PREDICTION
    | PREDICTION_PROBABILITY
    | PREDICTION_SET
    | PREPARE
    | PRESENT
    | PRESENTNNV
    | PRESENTV
    | PRESERVE
    | PRESERVE_OID
    | PREVIOUS
    | PRIMARY
    | PRIVATE
    | PRIVATE_SGA
    | PRIVILEGE
    | PRIVILEGES
    | PROCEDURAL
    | PROCEDURE
    | PROCESS
    | PROFILE
    | PROGRAM
    | PROJECT
    | PROPAGATE
    | PROTECTED
    | PROTECTION
    | PULL_PRED
    | PURGE
    | PUSH_PRED
    | PUSH_SUBQ
    | PX_GRANULE
    | PX_JOIN_FILTER
    | QB_NAME
    | QUERY_BLOCK
    | QUERY
    | QUEUE_CURR
    | QUEUE
    | QUEUE_ROWP
    | QUIESCE
    | QUORUM
    | QUOTA
    | RANDOM_LOCAL
    | RANDOM
    | RANGE
    | RANKM
    | RANK
    | RAPIDLY
    | RATIO_TO_REPORT
    | RAWTOHEX
    | RAWTONHEX
    | RBA
    | RBO_OUTLINE
    | RDBA
    | READ
    | READS
    | REAL
    | REBALANCE
    | REBUILD
    | RECORDS_PER_BLOCK
    | RECOVERABLE
    | RECOVER
    | RECOVERY
    | RECYCLEBIN
    | RECYCLE
    | REDACTION
    | REDO
    | REDUCED
    | REDUNDANCY
    | REF_CASCADE_CURSOR
    | REFERENCED
    | REFERENCE
    | REFERENCES
    | REFERENCING
    | REF
    | REFRESH
    | REFTOHEX
    | REGEXP_COUNT
    | REGEXP_INSTR
    | REGEXP_LIKE
    | REGEXP_REPLACE
    | REGEXP_SUBSTR
    | REGISTER
    | REGR_AVGX
    | REGR_AVGY
    | REGR_COUNT
    | REGR_INTERCEPT
    | REGR_R2
    | REGR_SLOPE
    | REGR_SXX
    | REGR_SXY
    | REGR_SYY
    | REGULAR
    | REJECT
    | REKEY
    | RELATIONAL
    | RELY
    | REMAINDER
    | REMOTE_MAPPED
    | REMOVE
    | REPAIR
    | REPEAT
    | REPLACE
    | REPLICATION
    | REQUIRED
    | RESETLOGS
    | RESET
    | RESIZE
    | RESOLVE
    | RESOLVER
    | RESPECT
    | RESTORE_AS_INTERVALS
    | RESTORE
    | RESTRICT_ALL_REF_CONS
    | RESTRICTED
    | RESTRICT
    | RESULT_CACHE
    | RESUMABLE
    | RESUME
    | RETENTION
    | RETRY_ON_ROW_CHANGE
    | RETURNING
    | RETURN
    | REUSE
    | REVERSE
    | REWRITE
    | REWRITE_OR_ERROR
    | RIGHT
    | ROLE
    | ROLES
    | ROLLBACK
    | ROLLING
    | ROLLUP
    | ROUND
    | ROWDEPENDENCIES
    | ROWID
    | ROWIDTOCHAR
    | ROWIDTONCHAR
    | ROW_LENGTH
    | ROW
    | ROW_NUMBER
    | ROWNUM
    | ROWS
    | RPAD
    | RTRIM
    | RULE
    | RULES
    | SALT
    | SAMPLE
    | SAVE_AS_INTERVALS
    | SAVEPOINT
    | SB4
    | SCALE
    | SCALE_ROWS
    | SCAN_INSTANCES
    | SCAN
    | SCHEDULER
    | SCHEMACHECK
    | SCHEMA
    | SCN_ASCENDING
    | SCN
    | SCOPE
    | SD_ALL
    | SD_INHIBIT
    | SD_SHOW
    | SEARCH
    | SECOND
    | SECUREFILE_DBA
    | SECUREFILE
    | SECURITY
    | SEED
    | SEG_BLOCK
    | SEG_FILE
    | SEGMENT
    | SELECTIVITY
    | SEMIJOIN_DRIVER
    | SEMIJOIN
    | SEMI_TO_INNER
    | SEQUENCED
    | SEQUENCE
    | SEQUENTIAL
    | SERIALIZABLE
    | SERVERERROR
    | SESSION_CACHED_CURSORS
    | SESSION
    | SESSIONS_PER_USER
    | SESSIONTIMEZONE
    | SESSIONTZNAME
    | SETS
    | SETTINGS
    | SET_TO_JOIN
    | SEVERE
    | SHARED
    | SHARED_POOL
    | SHOW
    | SHRINK
    | SHUTDOWN
    | SIBLINGS
    | SID
    | SIGNAL_COMPONENT
    | SIGNAL_FUNCTION
    | SIGN
    | SIMPLE
    | SINGLE
    | SINGLETASK
    | SINH
    | SIN
    | SKIP_EXT_OPTIMIZER
    | SKIP_
    | SKIP_UNQ_UNUSABLE_IDX
    | SKIP_UNUSABLE_INDEXES
    | SMALLFILE
    | SNAPSHOT
    | SOME
    | SORT
    | SOUNDEX
    | SOURCE
    | SPACE_KEYWORD
    | SPECIFICATION
    | SPFILE
    | SPLIT
    | SPREADSHEET
    | SQLLDR
    | SQL
    | SQL_TRACE
    | SQRT
    | STALE
    | STANDALONE
    | STANDBY_MAX_DATA_DELAY
    | STANDBY
    | STAR
    | STAR_TRANSFORMATION
    | STARTUP
    | STATEMENT_ID
    | STATEMENT_QUEUING
    | STATEMENTS
    | STATIC
    | STATISTICS
    | STATS_BINOMIAL_TEST
    | STATS_CROSSTAB
    | STATS_F_TEST
    | STATS_KS_TEST
    | STATS_MODE
    | STATS_MW_TEST
    | STATS_ONE_WAY_ANOVA
    | STATS_T_TEST_INDEP
    | STATS_T_TEST_INDEPU
    | STATS_T_TEST_ONE
    | STATS_T_TEST_PAIRED
    | STATS_WSR_TEST
    | STDDEV
    | STDDEV_POP
    | STDDEV_SAMP
    | STOP
    | STORAGE
    | STORE
    | STREAMS
    | STRICT
    | STRING
    | STRIPE_COLUMNS
    | STRIPE_WIDTH
    | STRIP
    | STRUCTURE
    | SUBMULTISET
    | SUBPARTITION
    | SUBPARTITION_REL
    | SUBPARTITIONS
    | SUBQUERIES
    | SUBQUERY_PRUNING
    | SUBSTITUTABLE
    | SUBSTR2
    | SUBSTR4
    | SUBSTRB
    | SUBSTRC
    | SUBSTR
    | SUCCESSFUL
    | SUMMARY
    | SUM
    | SUPPLEMENTAL
    | SUSPEND
    | SWAP_JOIN_INPUTS
    | SWITCH
    | SWITCHOVER
    | SYNCHRONOUS
    | SYNC
    | SYSASM
    | SYS_AUDIT
    | SYSAUX
    | SYS_CHECKACL
    | SYS_CONNECT_BY_PATH
    | SYS_CONTEXT
    | SYSDATE
    | SYSDBA
    | SYS_DBURIGEN
    | SYS_DL_CURSOR
    | SYS_DM_RXFORM_CHR
    | SYS_DM_RXFORM_NUM
    | SYS_DOM_COMPARE
    | SYS_DST_PRIM2SEC
    | SYS_DST_SEC2PRIM
    | SYS_ET_BFILE_TO_RAW
    | SYS_ET_BLOB_TO_IMAGE
    | SYS_ET_IMAGE_TO_BLOB
    | SYS_ET_RAW_TO_BFILE
    | SYS_EXTPDTXT
    | SYS_EXTRACT_UTC
    | SYS_FBT_INSDEL
    | SYS_FILTER_ACLS
    | SYS_FNMATCHES
    | SYS_FNREPLACE
    | SYS_GET_ACLIDS
    | SYS_GET_PRIVILEGES
    | SYS_GETTOKENID
    | SYS_GETXTIVAL
    | SYS_GUID
    | SYS_MAKEXML
    | SYS_MAKE_XMLNODEID
    | SYS_MKXMLATTR
    | SYS_OP_ADT2BIN
    | SYS_OP_ADTCONS
    | SYS_OP_ALSCRVAL
    | SYS_OP_ATG
    | SYS_OP_BIN2ADT
    | SYS_OP_BITVEC
    | SYS_OP_BL2R
    | SYS_OP_BLOOM_FILTER_LIST
    | SYS_OP_BLOOM_FILTER
    | SYS_OP_C2C
    | SYS_OP_CAST
    | SYS_OP_CEG
    | SYS_OP_CL2C
    | SYS_OP_COMBINED_HASH
    | SYS_OP_COMP
    | SYS_OP_CONVERT
    | SYS_OP_COUNTCHG
    | SYS_OP_CSCONV
    | SYS_OP_CSCONVTEST
    | SYS_OP_CSR
    | SYS_OP_CSX_PATCH
    | SYS_OP_DECOMP
    | SYS_OP_DESCEND
    | SYS_OP_DISTINCT
    | SYS_OP_DRA
    | SYS_OP_DUMP
    | SYS_OP_DV_CHECK
    | SYS_OP_ENFORCE_NOT_NULL
    | SYSOPER
    | SYS_OP_EXTRACT
    | SYS_OP_GROUPING
    | SYS_OP_GUID
    | SYS_OP_IIX
    | SYS_OP_ITR
    | SYS_OP_LBID
    | SYS_OP_LOBLOC2BLOB
    | SYS_OP_LOBLOC2CLOB
    | SYS_OP_LOBLOC2ID
    | SYS_OP_LOBLOC2NCLOB
    | SYS_OP_LOBLOC2TYP
    | SYS_OP_LSVI
    | SYS_OP_LVL
    | SYS_OP_MAKEOID
    | SYS_OP_MAP_NONNULL
    | SYS_OP_MSR
    | SYS_OP_NICOMBINE
    | SYS_OP_NIEXTRACT
    | SYS_OP_NII
    | SYS_OP_NIX
    | SYS_OP_NOEXPAND
    | SYS_OP_NTCIMG
    | SYS_OP_NUMTORAW
    | SYS_OP_OIDVALUE
    | SYS_OP_OPNSIZE
    | SYS_OP_PAR_1
    | SYS_OP_PARGID_1
    | SYS_OP_PARGID
    | SYS_OP_PAR
    | SYS_OP_PIVOT
    | SYS_OP_R2O
    | SYS_OP_RAWTONUM
    | SYS_OP_RDTM
    | SYS_OP_REF
    | SYS_OP_RMTD
    | SYS_OP_ROWIDTOOBJ
    | SYS_OP_RPB
    | SYS_OPTLOBPRBSC
    | SYS_OP_TOSETID
    | SYS_OP_TPR
    | SYS_OP_TRTB
    | SYS_OPTXICMP
    | SYS_OPTXQCASTASNQ
    | SYS_OP_UNDESCEND
    | SYS_OP_VECAND
    | SYS_OP_VECBIT
    | SYS_OP_VECOR
    | SYS_OP_VECXOR
    | SYS_OP_VERSION
    | SYS_OP_VREF
    | SYS_OP_VVD
    | SYS_OP_XMLCONS_FOR_CSX
    | SYS_OP_XPTHATG
    | SYS_OP_XPTHIDX
    | SYS_OP_XPTHOP
    | SYS_OP_XTXT2SQLT
    | SYS_ORDERKEY_DEPTH
    | SYS_ORDERKEY_MAXCHILD
    | SYS_ORDERKEY_PARENT
    | SYS_PARALLEL_TXN
    | SYS_PATHID_IS_ATTR
    | SYS_PATHID_IS_NMSPC
    | SYS_PATHID_LASTNAME
    | SYS_PATHID_LASTNMSPC
    | SYS_PATH_REVERSE
    | SYS_PXQEXTRACT
    | SYS_RID_ORDER
    | SYS_ROW_DELTA
    | SYS_SC_2_XMLT
    | SYS_SYNRCIREDO
    | SYSTEM_DEFINED
    | SYSTEM
    | SYSTIMESTAMP
    | SYS_TYPEID
    | SYS_UMAKEXML
    | SYS_XMLANALYZE
    | SYS_XMLCONTAINS
    | SYS_XMLCONV
    | SYS_XMLEXNSURI
    | SYS_XMLGEN
    | SYS_XMLI_LOC_ISNODE
    | SYS_XMLI_LOC_ISTEXT
    | SYS_XMLINSTR
    | SYS_XMLLOCATOR_GETSVAL
    | SYS_XMLNODEID_GETCID
    | SYS_XMLNODEID_GETLOCATOR
    | SYS_XMLNODEID_GETOKEY
    | SYS_XMLNODEID_GETPATHID
    | SYS_XMLNODEID_GETPTRID
    | SYS_XMLNODEID_GETRID
    | SYS_XMLNODEID_GETSVAL
    | SYS_XMLNODEID_GETTID
    | SYS_XMLNODEID
    | SYS_XMLT_2_SC
    | SYS_XMLTRANSLATE
    | SYS_XMLTYPE2SQL
    | SYS_XQ_ASQLCNV
    | SYS_XQ_ATOMCNVCHK
    | SYS_XQBASEURI
    | SYS_XQCASTABLEERRH
    | SYS_XQCODEP2STR
    | SYS_XQCODEPEQ
    | SYS_XQCON2SEQ
    | SYS_XQCONCAT
    | SYS_XQDELETE
    | SYS_XQDFLTCOLATION
    | SYS_XQDOC
    | SYS_XQDOCURI
    | SYS_XQDURDIV
    | SYS_XQED4URI
    | SYS_XQENDSWITH
    | SYS_XQERRH
    | SYS_XQERR
    | SYS_XQESHTMLURI
    | SYS_XQEXLOBVAL
    | SYS_XQEXSTWRP
    | SYS_XQEXTRACT
    | SYS_XQEXTRREF
    | SYS_XQEXVAL
    | SYS_XQFB2STR
    | SYS_XQFNBOOL
    | SYS_XQFNCMP
    | SYS_XQFNDATIM
    | SYS_XQFNLNAME
    | SYS_XQFNNM
    | SYS_XQFNNSURI
    | SYS_XQFNPREDTRUTH
    | SYS_XQFNQNM
    | SYS_XQFNROOT
    | SYS_XQFORMATNUM
    | SYS_XQFTCONTAIN
    | SYS_XQFUNCR
    | SYS_XQGETCONTENT
    | SYS_XQINDXOF
    | SYS_XQINSERT
    | SYS_XQINSPFX
    | SYS_XQIRI2URI
    | SYS_XQLANG
    | SYS_XQLLNMFRMQNM
    | SYS_XQMKNODEREF
    | SYS_XQNILLED
    | SYS_XQNODENAME
    | SYS_XQNORMSPACE
    | SYS_XQNORMUCODE
    | SYS_XQ_NRNG
    | SYS_XQNSP4PFX
    | SYS_XQNSPFRMQNM
    | SYS_XQPFXFRMQNM
    | SYS_XQ_PKSQL2XML
    | SYS_XQPOLYABS
    | SYS_XQPOLYADD
    | SYS_XQPOLYCEL
    | SYS_XQPOLYCSTBL
    | SYS_XQPOLYCST
    | SYS_XQPOLYDIV
    | SYS_XQPOLYFLR
    | SYS_XQPOLYMOD
    | SYS_XQPOLYMUL
    | SYS_XQPOLYRND
    | SYS_XQPOLYSQRT
    | SYS_XQPOLYSUB
    | SYS_XQPOLYUMUS
    | SYS_XQPOLYUPLS
    | SYS_XQPOLYVEQ
    | SYS_XQPOLYVGE
    | SYS_XQPOLYVGT
    | SYS_XQPOLYVLE
    | SYS_XQPOLYVLT
    | SYS_XQPOLYVNE
    | SYS_XQREF2VAL
    | SYS_XQRENAME
    | SYS_XQREPLACE
    | SYS_XQRESVURI
    | SYS_XQRNDHALF2EVN
    | SYS_XQRSLVQNM
    | SYS_XQRYENVPGET
    | SYS_XQRYVARGET
    | SYS_XQRYWRP
    | SYS_XQSEQ2CON4XC
    | SYS_XQSEQ2CON
    | SYS_XQSEQDEEPEQ
    | SYS_XQSEQINSB
    | SYS_XQSEQRM
    | SYS_XQSEQRVS
    | SYS_XQSEQSUB
    | SYS_XQSEQTYPMATCH
    | SYS_XQSTARTSWITH
    | SYS_XQSTATBURI
    | SYS_XQSTR2CODEP
    | SYS_XQSTRJOIN
    | SYS_XQSUBSTRAFT
    | SYS_XQSUBSTRBEF
    | SYS_XQTOKENIZE
    | SYS_XQTREATAS
    | SYS_XQ_UPKXML2SQL
    | SYS_XQXFORM
    | TABLE
    | TABLE_LOOKUP_BY_NL
    | TABLES
    | TABLESPACE
    | TABLESPACE_NO
    | TABLE_STATS
    | TABNO
    | TANH
    | TAN
    | TBLORIDXPARTNUM
    | TEMPFILE
    | TEMPLATE
    | TEMPORARY
    | TEMP_TABLE
    | TEST
    | THAN
    | THE
    | THEN
    | THREAD
    | THROUGH
    | TIME
    | TIMEOUT
    | TIMES
    | TIMESTAMP
    | TIMEZONE_ABBR
    | TIMEZONE_HOUR
    | TIMEZONE_MINUTE
    | TIME_ZONE
    | TIMEZONE_OFFSET
    | TIMEZONE_REGION
    | TIV_GB
    | TIV_SSF
    | TO_BINARY_DOUBLE
    | TO_BINARY_FLOAT
    | TO_BLOB
    | TO_CHAR
    | TO_CLOB
    | TO_DATE
    | TO_DSINTERVAL
    | TO_LOB
    | TO_MULTI_BYTE
    | TO_NCHAR
    | TO_NCLOB
    | TO_NUMBER
    | TOPLEVEL
    | TO_SINGLE_BYTE
    | TO_TIME
    | TO_TIMESTAMP
    | TO_TIMESTAMP_TZ
    | TO_TIME_TZ
    | TO_YMINTERVAL
    | TRACE
    | TRACING
    | TRACKING
    | TRAILING
    | TRANSACTION
    | TRANSFORM_DISTINCT_AGG
    | TRANSITIONAL
    | TRANSITION
    | TRANSLATE
    | TREAT
    | TRIGGERS
    | TRIM
    | TRUE
    | TRUNCATE
    | TRUNC
    | TRUSTED
    | TUNING
    | TX
    | TYPE
    | TYPES
    | TZ_OFFSET
    | UB2
    | UBA
    | UID
    | UNARCHIVED
    | UNBOUNDED
    | UNBOUND
    | UNDER
    | UNDO
    | UNDROP
    | UNIFORM
    | UNISTR
    | UNLIMITED
    | UNLOAD
    | UNLOCK
    | UNNEST_INNERJ_DISTINCT_VIEW
    | UNNEST
    | UNNEST_NOSEMIJ_NODISTINCTVIEW
    | UNNEST_SEMIJ_VIEW
    | UNPACKED
    | UNPIVOT
    | UNPROTECTED
    | UNQUIESCE
    | UNRECOVERABLE
    | UNRESTRICTED
    | UNTIL
    | UNUSABLE
    | UNUSED
    | UPDATABLE
    | UPDATED
    | UPDATEXML
    | UPD_INDEXES
    | UPD_JOININDEX
    | UPGRADE
    | UPPER
    | UPSERT
    | UROWID
    | USAGE
    | USE_ANTI
    | USE_CONCAT
    | USE_HASH_AGGREGATION
    | USE_HASH_GBY_FOR_PUSHDOWN
    | USE_HASH
    | USE_INVISIBLE_INDEXES
    | USE_MERGE_CARTESIAN
    | USE_MERGE
    | USE
    | USE_NL
    | USE_NL_WITH_INDEX
    | USE_PRIVATE_OUTLINES
    | USER_DEFINED
    | USERENV
    | USERGROUP
    | USER
    | USER_RECYCLEBIN
    | USERS
    | USE_SEMI
    | USE_STORED_OUTLINES
    | USE_TTT_FOR_GSETS
    | USE_WEAK_NAME_RESL
    | USING
    | VALIDATE
    | VALIDATION
    | VALUE
    | VARIANCE
    | VAR_POP
    | VARRAY
    | VARRAYS
    | VAR_SAMP
    | VARYING
    | VECTOR_READ
    | VECTOR_READ_TRACE
    | VERIFY
    | VERSIONING
    | VERSION
    | VERSIONS_ENDSCN
    | VERSIONS_ENDTIME
    | VERSIONS
    | VERSIONS_OPERATION
    | VERSIONS_STARTSCN
    | VERSIONS_STARTTIME
    | VERSIONS_XID
    | VIRTUAL
    | VISIBLE
    | VOLUME
    | VSIZE
    | WAIT
    | WALLET
    | WELLFORMED
    | WHENEVER
    | WHEN
    | WHITESPACE
    | WIDTH_BUCKET
    | WITHIN
    | WITHOUT
    | WORK
    | WRAPPED
    | WRITE
    | XDB_FASTPATH_INSERT
    | X_DYN_PRUNE
    | XID
    | XML2OBJECT
    | XMLATTRIBUTES
    | XMLCAST
    | XMLCDATA
    | XMLCOLATTVAL
    | XMLCOMMENT
    | XMLCONCAT
    | XMLDIFF
    | XML_DML_RWT_STMT
    | XMLELEMENT
    | XMLEXISTS2
    | XMLEXISTS
    | XMLFOREST
    | XMLINDEX_REWRITE_IN_SELECT
    | XMLINDEX_REWRITE
    | XMLINDEX_SEL_IDX_TBL
    | XMLISNODE
    | XMLISVALID
    | XML
    | XMLNAMESPACES
    | XMLPARSE
    | XMLPATCH
    | XMLPI
    | XMLQUERY
    | XMLQUERYVAL
    | XMLROOT
    | XMLSCHEMA
    | XMLSERIALIZE
    | XMLTABLE
    | XMLTRANSFORMBLOB
    | XMLTRANSFORM
    | XMLTYPE
    | XPATHTABLE
    | XS_SYS_CONTEXT
    | YEAR
    | YES
    | ZONE
    ;

A_LETTER:                     A;
ADD:                          A D D;
AFTER:                        A F T E R;
AGENT:                        A G E N T;
AGGREGATE:                    A G G R E G A T E;
ALL:                          A L L;
ALTER:                        A L T E R;
ANALYZE:                      A N A L Y Z E;
AND:                          A N D;
ANY:                          A N Y;
ARRAY:                        A R R A Y;
AS:                           A S;
ASC:                          A S C;
ASSOCIATE:                    A S S O C I A T E;
ASSOCIATION_OPERATOR:         '=>';
AT:                           A T;
ATTRIBUTE:                    A T T R I B U T E;
AUDIT:                        A U D I T;
AUTHID:                       A U T H I D;
AUTO:                         A U T O;
AUTOMATIC:                    A U T O M A T I C;
AUTONOMOUS_TRANSACTION:       A U T O N O M O U S '_' T R A N S A C T I O N;
ABORT:                        'ABORT';
ABS:                          'ABS';
ACCESS:                       'ACCESS';
ACCESSED:                     'ACCESSED';
ACCOUNT:                      'ACCOUNT';
ACL:                          'ACL';
ACOS:                         'ACOS';
ACTION:                       'ACTION';
ACTIONS:                      'ACTIONS';
ACTIVATE:                     'ACTIVATE';
ACTIVE:                       'ACTIVE';
ACTIVE_COMPONENT:             'ACTIVE_COMPONENT';
ACTIVE_DATA:                  'ACTIVE_DATA';
ACTIVE_FUNCTION:              'ACTIVE_FUNCTION';
ACTIVE_TAG:                   'ACTIVE_TAG';
ACTIVITY:                     'ACTIVITY';
ADAPTIVE_PLAN:                'ADAPTIVE_PLAN';
ADD_COLUMN:                   'ADD_COLUMN';
ADD_GROUP:                    'ADD_GROUP';
ADD_MONTHS:                   'ADD_MONTHS';
ADJ_DATE:                     'ADJ_DATE';
ADMIN:                        'ADMIN';
ADMINISTER:                   'ADMINISTER';
ADMINISTRATOR:                'ADMINISTRATOR';
ADVANCED:                     'ADVANCED';
ADVISE:                       'ADVISE';
ADVISOR:                      'ADVISOR';
AFD_DISKSTRING:               'AFD_DISKSTRING';
ALIAS:                        'ALIAS';
ALLOCATE:                     'ALLOCATE';
ALLOW:                        'ALLOW';
ALL_ROWS:                     'ALL_ROWS';
ALWAYS:                       'ALWAYS';
ANCILLARY:                    'ANCILLARY';
AND_EQUAL:                    'AND_EQUAL';
ANOMALY:                      'ANOMALY';
ANSI_REARCH:                  'ANSI_REARCH';
ANTIJOIN:                     'ANTIJOIN';
ANYSCHEMA:                    'ANYSCHEMA';
APPEND:                       'APPEND';
APPENDCHILDXML:               'APPENDCHILDXML';
APPEND_VALUES:                'APPEND_VALUES';
APPLICATION:                  'APPLICATION';
APPLY:                        'APPLY';
APPROX_COUNT_DISTINCT:        'APPROX_COUNT_DISTINCT';
ARCHIVAL:                     'ARCHIVAL';
ARCHIVE:                      'ARCHIVE';
ARCHIVED:                     'ARCHIVED';
ARCHIVELOG:                   'ARCHIVELOG';
ASCII:                        'ASCII';
ASCIISTR:                     'ASCIISTR';
ASIN:                         'ASIN';
ASIS:                         'ASIS';
ASSEMBLY:                     'ASSEMBLY';
ASSIGN:                       'ASSIGN';
ASYNC:                        'ASYNC';
ASYNCHRONOUS:                 'ASYNCHRONOUS';
ATAN2:                        'ATAN2';
ATAN:                         'ATAN';
ATTRIBUTES:                   'ATTRIBUTES';
AUTHENTICATED:                'AUTHENTICATED';
AUTHENTICATION:               'AUTHENTICATION';
AUTHORIZATION:                'AUTHORIZATION';
AUTOALLOCATE:                 'AUTOALLOCATE';
AUTOBACKUP:                   'AUTOBACKUP';
AUTOEXTEND:                   'AUTOEXTEND';
AUTO_LOGIN:                   'AUTO_LOGIN';
AUTO_REOPTIMIZE:              'AUTO_REOPTIMIZE';
AVAILABILITY:                 'AVAILABILITY';
AVRO:                         'AVRO';
BATCH:                        B A T C H;
BEFORE:                       B E F O R E;
BEGIN:                        B E G I N;
BETWEEN:                      B E T W E E N;
BFILE:                        B F I L E;
BINARY_DOUBLE:                B I N A R Y '_' D O U B L E;
BINARY_FLOAT:                 B I N A R Y '_' F L O A T;
BINARY_INTEGER:               B I N A R Y '_' I N T E G E R;
BLOB:                         B L O B;
BLOCK:                        B L O C K;
BODY:                         B O D Y;
BOOLEAN:                      B O O L E A N;
BOTH:                         B O T H;
BREADTH:                      B R E A D T H;
BULK:                         B U L K;
BY:                           B Y;
BYTE:                         B Y T E;
BACKGROUND:                   'BACKGROUND';
BACKUP:                       'BACKUP';
BACKUPSET:                    'BACKUPSET';
BASIC:                        'BASIC';
BASICFILE:                    'BASICFILE';
BATCHSIZE:                    'BATCHSIZE';
BATCH_TABLE_ACCESS_BY_ROWID:  'BATCH_TABLE_ACCESS_BY_ROWID';
BECOME:                       'BECOME';
BEGINNING:                    'BEGINNING';
BEGIN_OUTLINE_DATA:           'BEGIN_OUTLINE_DATA';
BEHALF:                       'BEHALF';
BEQUEATH:                     'BEQUEATH';
BFILENAME:                    'BFILENAME';
BIGFILE:                      'BIGFILE';
BINARY:                       'BINARY';
BINARY_DOUBLE_INFINITY:       'BINARY_DOUBLE_INFINITY';
BINARY_DOUBLE_NAN:            'BINARY_DOUBLE_NAN';
BINARY_FLOAT_INFINITY:        'BINARY_FLOAT_INFINITY';
BINARY_FLOAT_NAN:             'BINARY_FLOAT_NAN';
BIND_AWARE:                   'BIND_AWARE';
BINDING:                      'BINDING';
BIN_TO_NUM:                   'BIN_TO_NUM';
BITAND:                       'BITAND';
BITMAP_AND:                   'BITMAP_AND';
BITMAP:                       'BITMAP';
BITMAPS:                      'BITMAPS';
BITMAP_TREE:                  'BITMAP_TREE';
BITS:                         'BITS';
BLOCK_RANGE:                  'BLOCK_RANGE';
BLOCKS:                       'BLOCKS';
BLOCKSIZE:                    'BLOCKSIZE';
BOUND:                        'BOUND';
BRANCH:                       'BRANCH';
BROADCAST:                    'BROADCAST';
BSON:                         'BSON';
BUFFER:                       'BUFFER';
BUFFER_CACHE:                 'BUFFER_CACHE';
BUFFER_POOL:                  'BUFFER_POOL';
BUILD:                        'BUILD';
BYPASS_RECURSIVE_CHECK:       'BYPASS_RECURSIVE_CHECK';
BYPASS_UJVC:                  'BYPASS_UJVC';
C_LETTER:                     C;
CACHE:                        C A C H E;
CALL:                         C A L L;
CANONICAL:                    C A N O N I C A L;
CASCADE:                      C A S C A D E;
CASE:                         C A S E;
CAST:                         C A S T;
CHAR:                         C H A R;
CHAR_CS:                      C H A R '_' C S;
CHARACTER:                    C H A R A C T E R;
CHECK:                        C H E C K;
CHR:                          C H R;
CLOB:                         C L O B;
CLOSE:                        C L O S E;
CLUSTER:                      C L U S T E R;
CLUSTER_DETAILS:              'CLUSTER_DETAILS';
CLUSTER_DISTANCE:             'CLUSTER_DISTANCE';
CLUSTER_ID:                   'CLUSTER_ID';
CLUSTERING:                   'CLUSTERING';
CLUSTERING_FACTOR:            'CLUSTERING_FACTOR';
CLUSTER_PROBABILITY:          'CLUSTER_PROBABILITY';
CLUSTER_SET:                  'CLUSTER_SET';
COALESCE:                     'COALESCE';
COALESCE_SQ:                  'COALESCE_SQ';
COARSE:                       'COARSE';
CO_AUTH_IND:                  'CO_AUTH_IND';
COLD:                         'COLD';
COLLECT:                      C O L L E C T;
COLUMNAR:                     'COLUMNAR';
COLUMN_AUTH_INDICATOR:        'COLUMN_AUTH_INDICATOR';
COLUMN:                       'COLUMN';
COLUMNS:                      C O L U M N S;
COMMENT:                      C O M M E N T;
COMMIT:                       C O M M I T;
COMMITTED:                    C O M M I T T E D;
COMPATIBILITY:                C O M P A T I B I L I T Y;
COMPILE:                      C O M P I L E;
COMPOUND:                     C O M P O U N D;
CONNECT:                      C O N N E C T;
CONNECT_BY_ROOT:              C O N N E C T '_' B Y '_' R O O T;
CONSTANT:                     C O N S T A N T;
CONSTRAINT:                   C O N S T R A I N T;
CONSTRAINTS:                  C O N S T R A I N T S;
CONSTRUCTOR:                  C O N S T R U C T O R;
CONTENT:                      C O N T E N T;
CONTEXT:                      C O N T E X T;
CONTINUE:                     C O N T I N U E;
CONVERT:                      C O N V E R T;
CORRUPT_XID:                  C O R R U P T '_' X I D;
CORRUPT_XID_ALL:              C O R R U P T '_' X I D '_' A L L;
COST:                         C O S T;
COUNT:                        C O U N T;
CREATE:                       C R E A T E;
CROSS:                        C R O S S;
CUBE:                         C U B E;
CURRENT:                      C U R R E N T;
CURRENT_USER:                 C U R R E N T '_' U S E R;
CURSOR:                       C U R S O R;
CUSTOMDATUM:                  C U S T O M D A T U M;
CYCLE:                        C Y C L E;
CACHE_CB:                     'CACHE_CB';
CACHE_INSTANCES:              'CACHE_INSTANCES';
CACHE_TEMP_TABLE:             'CACHE_TEMP_TABLE';
CACHING:                      'CACHING';
CALCULATED:                   'CALCULATED';
CALLBACK:                     'CALLBACK';
CANCEL:                       'CANCEL';
CAPACITY:                     'CAPACITY';
CARDINALITY:                  'CARDINALITY';
CATEGORY:                     'CATEGORY';
CDBDEFAULT:                   'CDB$DEFAULT';
CEIL:                         'CEIL';
CELL_FLASH_CACHE:             'CELL_FLASH_CACHE';
CERTIFICATE:                  'CERTIFICATE';
CFILE:                        'CFILE';
CHAINED:                      'CHAINED';
CHANGE:                       'CHANGE';
CHANGETRACKING:               'CHANGETRACKING';
CHANGE_DUPKEY_ERROR_INDEX:    'CHANGE_DUPKEY_ERROR_INDEX';
CHARTOROWID:                  'CHARTOROWID';
CHECK_ACL_REWRITE:            'CHECK_ACL_REWRITE';
CHECKPOINT:                   'CHECKPOINT';
CHILD:                        'CHILD';
CHOOSE:                       'CHOOSE';
CHUNK:                        'CHUNK';
CLASS:                        'CLASS';
CLASSIFIER:                   'CLASSIFIER';
CLEANUP:                      'CLEANUP';
CLEAR:                        'CLEAR';
CLIENT:                       'CLIENT';
CLONE:                        'CLONE';
CLOSE_CACHED_OPEN_CURSORS:    'CLOSE_CACHED_OPEN_CURSORS';
CLUSTER_BY_ROWID:             'CLUSTER_BY_ROWID';
COLUMN_STATS:                 'COLUMN_STATS';
COLUMN_VALUE:                 'COLUMN_VALUE';
COMMON_DATA:                  'COMMON_DATA';
COMPACT:                      'COMPACT';
COMPLETE:                     'COMPLETE';
COMPLIANCE:                   'COMPLIANCE';
COMPONENT:                    'COMPONENT';
COMPONENTS:                   'COMPONENTS';
COMPOSE:                      'COMPOSE';
COMPOSITE:                    'COMPOSITE';
COMPOSITE_LIMIT:              'COMPOSITE_LIMIT';
COMPRESS:                     'COMPRESS';
COMPUTE:                      'COMPUTE';
CONCAT:                       'CONCAT';
CON_DBID_TO_ID:               'CON_DBID_TO_ID';
CONDITIONAL:                  'CONDITIONAL';
CONDITION:                    'CONDITION';
CONFIRM:                      'CONFIRM';
CONFORMING:                   'CONFORMING';
CON_GUID_TO_ID:               'CON_GUID_TO_ID';
CON_ID:                       'CON_ID';
CON_NAME_TO_ID:               'CON_NAME_TO_ID';
CONNECT_BY_CB_WHR_ONLY:       'CONNECT_BY_CB_WHR_ONLY';
CONNECT_BY_COMBINE_SW:        'CONNECT_BY_COMBINE_SW';
CONNECT_BY_COST_BASED:        'CONNECT_BY_COST_BASED';
CONNECT_BY_ELIM_DUPS:         'CONNECT_BY_ELIM_DUPS';
CONNECT_BY_FILTERING:         'CONNECT_BY_FILTERING';
CONNECT_BY_ISCYCLE:           'CONNECT_BY_ISCYCLE';
CONNECT_BY_ISLEAF:            'CONNECT_BY_ISLEAF';
CONNECT_TIME:                 'CONNECT_TIME';
CONSIDER:                     'CONSIDER';
CONSISTENT:                   'CONSISTENT';
CONST:                        'CONST';
CONTAINER:                    'CONTAINER';
CONTAINER_DATA:               'CONTAINER_DATA';
CONTAINERS:                   'CONTAINERS';
CONTENTS:                     'CONTENTS';
CONTROLFILE:                  'CONTROLFILE';
CON_UID_TO_ID:                'CON_UID_TO_ID';
COOKIE:                       'COOKIE';
COPY:                         'COPY';
CORR_K:                       'CORR_K';
CORR_S:                       'CORR_S';
CORRUPTION:                   'CORRUPTION';
COS:                          'COS';
COSH:                         'COSH';
COST_XML_QUERY_REWRITE:       'COST_XML_QUERY_REWRITE';
COVAR_POP:                    'COVAR_POP';
COVAR_SAMP:                   'COVAR_SAMP';
CPU_COSTING:                  'CPU_COSTING';
CPU_PER_CALL:                 'CPU_PER_CALL';
CPU_PER_SESSION:              'CPU_PER_SESSION';
CRASH:                        'CRASH';
CREATE_FILE_DEST:             'CREATE_FILE_DEST';
CREATE_STORED_OUTLINES:       'CREATE_STORED_OUTLINES';
CREATION:                     'CREATION';
CREDENTIAL:                   'CREDENTIAL';
CRITICAL:                     'CRITICAL';
CROSSEDITION:                 'CROSSEDITION';
CSCONVERT:                    'CSCONVERT';
CUBE_AJ:                      'CUBE_AJ';
CUBE_GB:                      'CUBE_GB';
CUBE_SJ:                      'CUBE_SJ';
CUME_DISTM:                   'CUME_DISTM';
CURRENT_DATE:                 'CURRENT_DATE';
CURRENT_SCHEMA:               'CURRENT_SCHEMA';
CURRENT_TIME:                 'CURRENT_TIME';
CURRENT_TIMESTAMP:            'CURRENT_TIMESTAMP';
CURRENTV:                     'CURRENTV';
CURSOR_SHARING_EXACT:         'CURSOR_SHARING_EXACT';
CURSOR_SPECIFIC_SEGMENT:      'CURSOR_SPECIFIC_SEGMENT';
CV:                           'CV';
DATA:                         D A T A;
DATABASE:                     D A T A B A S E;
DATE:                         D A T E;
DAY:                          D A Y;
DB_ROLE_CHANGE:               D B '_' R O L E '_' C H A N G E;
DBTIMEZONE:                   D B T I M E Z O N E;
DDL:                          D D L;
DEBUG:                        D E B U G;
DEC:                          D E C;
DECIMAL:                      D E C I M A L;
DECLARE:                      D E C L A R E;
DECOMPOSE:                    D E C O M P O S E;
DECREMENT:                    D E C R E M E N T;
DEFAULT:                      D E F A U L T;
DEFAULTS:                     D E F A U L T S;
DEFERRED:                     D E F E R R E D;
DEFINER:                      D E F I N E R;
DELETE:                       D E L E T E;
DEPTH:                        D E P T H;
DESC:                         D E S C;
DETERMINISTIC:                D E T E R M I N I S T I C;
DIMENSION:                    D I M E N S I O N;
DISABLE:                      D I S A B L E;
DISASSOCIATE:                 D I S A S S O C I A T E;
DISTINCT:                     D I S T I N C T;
DOCUMENT:                     D O C U M E N T;
DOUBLE:                       D O U B L E;
DROP:                         D R O P;
DSINTERVAL_UNCONSTRAINED:     D S I N T E R V A L '_' U N C O N S T R A I N E D;
DANGLING:                     'DANGLING';
DATAFILE:                     'DATAFILE';
DATAFILES:                    'DATAFILES';
DATAGUARDCONFIG:              'DATAGUARDCONFIG';
DATAMOVEMENT:                 'DATAMOVEMENT';
DATAOBJNO:                    'DATAOBJNO';
DATAOBJ_TO_MAT_PARTITION:     'DATAOBJ_TO_MAT_PARTITION';
DATAOBJ_TO_PARTITION:         'DATAOBJ_TO_PARTITION';
DATAPUMP:                     'DATAPUMP';
DATA_SECURITY_REWRITE_LIMIT:  'DATA_SECURITY_REWRITE_LIMIT';
DATE_MODE:                    'DATE_MODE';
DAYS:                         'DAYS';
DBA:                          'DBA';
DBA_RECYCLEBIN:               'DBA_RECYCLEBIN';
DBMS_STATS:                   'DBMS_STATS';
DB_UNIQUE_NAME:               'DB_UNIQUE_NAME';
DB_VERSION:                   'DB_VERSION';
DEALLOCATE:                   'DEALLOCATE';
DEBUGGER:                     'DEBUGGER';
DECORRELATE:                  'DECORRELATE';
DECR:                         'DECR';
DECRYPT:                      'DECRYPT';
DEDUPLICATE:                  'DEDUPLICATE';
DEFERRABLE:                   'DEFERRABLE';
DEFINED:                      'DEFINED';
DEFINE:                       'DEFINE';
DEGREE:                       'DEGREE';
DELAY:                        'DELAY';
DELEGATE:                     'DELEGATE';
DELETE_ALL:                   'DELETE_ALL';
DELETEXML:                    'DELETEXML';
DEMAND:                       'DEMAND';
DENSE_RANKM:                  'DENSE_RANKM';
DEPENDENT:                    'DEPENDENT';
DEQUEUE:                      'DEQUEUE';
DEREF:                        'DEREF';
DEREF_NO_REWRITE:             'DEREF_NO_REWRITE';
DESTROY:                      'DESTROY';
DETACHED:                     'DETACHED';
DETERMINES:                   'DETERMINES';
DICTIONARY:                   'DICTIONARY';
DIMENSIONS:                   'DIMENSIONS';
DIRECT_LOAD:                  'DIRECT_LOAD';
DIRECTORY:                    'DIRECTORY';
DIRECT_PATH:                  'DIRECT_PATH';
DISABLE_ALL:                  'DISABLE_ALL';
DISABLE_PARALLEL_DML:         'DISABLE_PARALLEL_DML';
DISABLE_PRESET:               'DISABLE_PRESET';
DISABLE_RPKE:                 'DISABLE_RPKE';
DISALLOW:                     'DISALLOW';
DISCARD:                      'DISCARD';
DISCONNECT:                   'DISCONNECT';
DISK:                         'DISK';
DISKGROUP:                    'DISKGROUP';
DISKGROUP_PLUS:               '\'+ DISKGROUP';
DISKS:                        'DISKS';
DISMOUNT:                     'DISMOUNT';
DISTINGUISHED:                'DISTINGUISHED';
DISTRIBUTED:                  'DISTRIBUTED';
DISTRIBUTE:                   'DISTRIBUTE';
DML:                          'DML';
DML_UPDATE:                   'DML_UPDATE';
DOCFIDELITY:                  'DOCFIDELITY';
DOMAIN_INDEX_FILTER:          'DOMAIN_INDEX_FILTER';
DOMAIN_INDEX_NO_SORT:         'DOMAIN_INDEX_NO_SORT';
DOMAIN_INDEX_SORT:            'DOMAIN_INDEX_SORT';
DOWNGRADE:                    'DOWNGRADE';
DRIVING_SITE:                 'DRIVING_SITE';
DROP_COLUMN:                  'DROP_COLUMN';
DROP_GROUP:                   'DROP_GROUP';
DST_UPGRADE_INSERT_CONV:      'DST_UPGRADE_INSERT_CONV';
DUMP:                         'DUMP';
DUMPSET:                      'DUMPSET';
DUPLICATE:                    'DUPLICATE';
DV:                           'DV';
DYNAMIC:                      'DYNAMIC';
DYNAMIC_SAMPLING:             'DYNAMIC_SAMPLING';
DYNAMIC_SAMPLING_EST_CDN:     'DYNAMIC_SAMPLING_EST_CDN';
EACH:                         E A C H;
ELEMENT:                      E L E M E N T;
ELSE:                         E L S E;
ELSIF:                        E L S I F;
EMPTY:                        E M P T Y;
ENABLE:                       E N A B L E;
ENCODING:                     E N C O D I N G;
END:                          E N D;
ENTITYESCAPING:               E N T I T Y E S C A P I N G;
ERRORS:                       E R R O R S;
ESCAPE:                       E S C A P E;
EXCEPT:                       E X C E P T;
EVALNAME:                     E V A L N A M E;
EXCEPTION:                    E X C E P T I O N;
EXCEPTION_INIT:               E X C E P T I O N '_' I N I T;
EXCEPTIONS:                   E X C E P T I O N S;
EXCLUDE:                      E X C L U D E;
EXCLUSIVE:                    E X C L U S I V E;
EXECUTE:                      E X E C U T E;
EXISTS:                       E X I S T S;
EXIT:                         E X I T;
EXPLAIN:                      E X P L A I N;
EXTERNAL:                     E X T E R N A L;
EXTEND:                       E X T E N D;
EXTRACT:                      E X T R A C T;
EDITIONABLE:                  'EDITIONABLE';
EDITION:                      'EDITION';
EDITIONING:                   'EDITIONING';
EDITIONS:                     'EDITIONS';
ELIM_GROUPBY:                 'ELIM_GROUPBY';
ELIMINATE_JOIN:               'ELIMINATE_JOIN';
ELIMINATE_OBY:                'ELIMINATE_OBY';
ELIMINATE_OUTER_JOIN:         'ELIMINATE_OUTER_JOIN';
EM:                           'EM';
EMPTY_BLOB:                   'EMPTY_BLOB';
EMPTY_CLOB:                   'EMPTY_CLOB';
ENABLE_ALL:                   'ENABLE_ALL';
ENABLE_PARALLEL_DML:          'ENABLE_PARALLEL_DML';
ENABLE_PRESET:                'ENABLE_PRESET';
ENCRYPT:                      'ENCRYPT';
ENCRYPTION:                   'ENCRYPTION';
END_OUTLINE_DATA:             'END_OUTLINE_DATA';
ENFORCED:                     'ENFORCED';
ENFORCE:                      'ENFORCE';
ENQUEUE:                      'ENQUEUE';
ENTERPRISE:                   'ENTERPRISE';
ENTRY:                        'ENTRY';
EQUIPART:                     'EQUIPART';
ERR:                          'ERR';
ERROR_ARGUMENT:               'ERROR_ARGUMENT';
ERROR:                        'ERROR';
ERROR_ON_OVERLAP_TIME:        'ERROR_ON_OVERLAP_TIME';
ESTIMATE:                     'ESTIMATE';
EVAL:                         'EVAL';
EVALUATE:                     'EVALUATE';
EVALUATION:                   'EVALUATION';
EVENTS:                       'EVENTS';
EVERY:                        'EVERY';
EXCHANGE:                     'EXCHANGE';
EXCLUDING:                    'EXCLUDING';
EXEMPT:                       'EXEMPT';
EXISTING:                     'EXISTING';
EXISTSNODE:                   'EXISTSNODE';
EXPAND_GSET_TO_UNION:         'EXPAND_GSET_TO_UNION';
EXPAND_TABLE:                 'EXPAND_TABLE';
EXP:                          'EXP';
EXPIRE:                       'EXPIRE';
EXPLOSION:                    'EXPLOSION';
EXPORT:                       'EXPORT';
EXPR_CORR_CHECK:              'EXPR_CORR_CHECK';
EXPRESS:                      'EXPRESS';
EXTENDS:                      'EXTENDS';
EXTENT:                       'EXTENT';
EXTENTS:                      'EXTENTS';
EXTERNALLY:                   'EXTERNALLY';
EXTRACTCLOBXML:               'EXTRACTCLOBXML';
EXTRACTVALUE:                 'EXTRACTVALUE';
EXTRA:                        'EXTRA';
FAILURE:                      F A I L U R E;
FALSE:                        F A L S E;
FETCH:                        F E T C H;
FILE:                         'FILE';
FILE_NAME_CONVERT:            'FILE_NAME_CONVERT';
FILESYSTEM_LIKE_LOGGING:      'FILESYSTEM_LIKE_LOGGING';
FILTER:                       'FILTER';
FINAL:                        F I N A L;
FIRST:                        F I R S T;
FIRST_VALUE:                  F I R S T '_' V A L U E;
FLOAT:                        F L O A T;
FOLLOWING:                    F O L L O W I N G;
FOLLOWS:                      F O L L O W S;
FOR:                          F O R;
FORALL:                       F O R A L L;
FORCE:                        F O R C E;
FROM:                         F R O M;
FULL:                         F U L L;
FUNCTION:                     F U N C T I O N;
FUNCTIONS:                    'FUNCTIONS';
FACILITY:                     'FACILITY';
FACT:                         'FACT';
FACTOR:                       'FACTOR';
FACTORIZE_JOIN:               'FACTORIZE_JOIN';
FAILED:                       'FAILED';
FAILED_LOGIN_ATTEMPTS:        'FAILED_LOGIN_ATTEMPTS';
FAILGROUP:                    'FAILGROUP';
FAILOVER:                     'FAILOVER';
FAMILY:                       'FAMILY';
FAR:                          'FAR';
FAST:                         'FAST';
FASTSTART:                    'FASTSTART';
FBTSCAN:                      'FBTSCAN';
FEATURE_DETAILS:              'FEATURE_DETAILS';
FEATURE_ID:                   'FEATURE_ID';
FEATURE_SET:                  'FEATURE_SET';
FEATURE_VALUE:                'FEATURE_VALUE';
FINE:                         'FINE';
FINISH:                       'FINISH';
FIRSTM:                       'FIRSTM';
FIRST_ROWS:                   'FIRST_ROWS';
FIXED_VIEW_DATA:              'FIXED_VIEW_DATA';
FLAGGER:                      'FLAGGER';
FLASHBACK:                    'FLASHBACK';
FLASH_CACHE:                  'FLASH_CACHE';
FLOB:                         'FLOB';
FLOOR:                        'FLOOR';
FLUSH:                        'FLUSH';
FOLDER:                       'FOLDER';
FORCE_XML_QUERY_REWRITE:      'FORCE_XML_QUERY_REWRITE';
FOREIGN:                      'FOREIGN';
FOREVER:                      'FOREVER';
FORMAT:                       'FORMAT';
FORWARD:                      'FORWARD';
FRAGMENT_NUMBER:              'FRAGMENT_NUMBER';
FREELIST:                     'FREELIST';
FREELISTS:                    'FREELISTS';
FREEPOOLS:                    'FREEPOOLS';
FRESH:                        'FRESH';
FROM_TZ:                      'FROM_TZ';
FULL_OUTER_JOIN_TO_OUTER:     'FULL_OUTER_JOIN_TO_OUTER';
GOTO:                         G O T O;
GRANT:                        G R A N T;
GROUP:                        G R O U P;
GROUPING:                     G R O U P I N G;
GATHER_OPTIMIZER_STATISTICS:  'GATHER_OPTIMIZER_STATISTICS';
GATHER_PLAN_STATISTICS:       'GATHER_PLAN_STATISTICS';
GBY_CONC_ROLLUP:              'GBY_CONC_ROLLUP';
GBY_PUSHDOWN:                 'GBY_PUSHDOWN';
GENERATED:                    'GENERATED';
GET:                          'GET';
GLOBAL:                       'GLOBAL';
GLOBALLY:                     'GLOBALLY';
GLOBAL_NAME:                  'GLOBAL_NAME';
GLOBAL_TOPIC_ENABLED:         'GLOBAL_TOPIC_ENABLED';
GROUP_BY:                     'GROUP_BY';
GROUP_ID:                     'GROUP_ID';
GROUPING_ID:                  'GROUPING_ID';
GROUPS:                       'GROUPS';
GUARANTEED:                   'GUARANTEED';
GUARANTEE:                    'GUARANTEE';
GUARD:                        'GUARD';
HASH:                         H A S H;
HAVING:                       H A V I N G;
HIDE:                         H I D E;
HOUR:                         H O U R;
HASH_AJ:                      'HASH_AJ';
HASHKEYS:                     'HASHKEYS';
HASH_SJ:                      'HASH_SJ';
HEADER:                       'HEADER';
HEAP:                         'HEAP';
HELP:                         'HELP';
HEXTORAW:                     'HEXTORAW';
HEXTOREF:                     'HEXTOREF';
HIDDEN_KEYWORD:               'HIDDEN';
HIERARCHY:                    'HIERARCHY';
HIGH:                         'HIGH';
HINTSET_BEGIN:                'HINTSET_BEGIN';
HINTSET_END:                  'HINTSET_END';
HOT:                          'HOT';
HWM_BROKERED:                 'HWM_BROKERED';
HYBRID:                       'HYBRID';
IF:                           I F;
IGNORE:                       I G N O R E;
IMMEDIATE:                    I M M E D I A T E;
IN:                           I N;
INCLUDE:                      I N C L U D E;
INCLUDING:                    I N C L U D I N G;
INCREMENT:                    I N C R E M E N T;
INDENT:                       I N D E N T;
INDEX:                        I N D E X;
INDEXED:                      I N D E X E D;
INDICATOR:                    I N D I C A T O R;
INDICES:                      I N D I C E S;
INFINITE:                     I N F I N I T E;
INLINE:                       I N L I N E;
INNER:                        I N N E R;
INOUT:                        I N O U T;
INSERT:                       I N S E R T;
INSTANTIABLE:                 I N S T A N T I A B L E;
INSTEAD:                      I N S T E A D;
INT:                          I N T;
INTEGER:                      I N T E G E R;
INTERSECT:                    I N T E R S E C T;
INTERVAL:                     I N T E R V A L;
INTO:                         I N T O;
INVALIDATE:                   I N V A L I D A T E;
IS:                           I S;
ISOLATION:                    I S O L A T I O N;
ITERATE:                      I T E R A T E;
IDENTIFIED:                   'IDENTIFIED';
IDENTIFIER:                   'IDENTIFIER';
IDENTITY:                     'IDENTITY';
IDGENERATORS:                 'IDGENERATORS';
ID:                           'ID';
IDLE_TIME:                    'IDLE_TIME';
IGNORE_OPTIM_EMBEDDED_HINTS:  'IGNORE_OPTIM_EMBEDDED_HINTS';
IGNORE_ROW_ON_DUPKEY_INDEX:   'IGNORE_ROW_ON_DUPKEY_INDEX';
IGNORE_WHERE_CLAUSE:          'IGNORE_WHERE_CLAUSE';
ILM:                          'ILM';
IMPACT:                       'IMPACT';
IMPORT:                       'IMPORT';
INACTIVE:                     'INACTIVE';
INCLUDE_VERSION:              'INCLUDE_VERSION';
INCREMENTAL:                  'INCREMENTAL';
INCR:                         'INCR';
INDEX_ASC:                    'INDEX_ASC';
INDEX_COMBINE:                'INDEX_COMBINE';
INDEX_DESC:                   'INDEX_DESC';
INDEXES:                      'INDEXES';
INDEX_FFS:                    'INDEX_FFS';
INDEX_FILTER:                 'INDEX_FILTER';
INDEXING:                     'INDEXING';
INDEX_JOIN:                   'INDEX_JOIN';
INDEX_ROWS:                   'INDEX_ROWS';
INDEX_RRS:                    'INDEX_RRS';
INDEX_RS_ASC:                 'INDEX_RS_ASC';
INDEX_RS_DESC:                'INDEX_RS_DESC';
INDEX_RS:                     'INDEX_RS';
INDEX_SCAN:                   'INDEX_SCAN';
INDEX_SKIP_SCAN:              'INDEX_SKIP_SCAN';
INDEX_SS_ASC:                 'INDEX_SS_ASC';
INDEX_SS_DESC:                'INDEX_SS_DESC';
INDEX_SS:                     'INDEX_SS';
INDEX_STATS:                  'INDEX_STATS';
INDEXTYPE:                    'INDEXTYPE';
INDEXTYPES:                   'INDEXTYPES';
INFORMATIONAL:                'INFORMATIONAL';
INHERIT:                      'INHERIT';
INITCAP:                      'INITCAP';
INITIAL:                      'INITIAL';
INITIALIZED:                  'INITIALIZED';
INITIALLY:                    'INITIALLY';
INITRANS:                     'INITRANS';
INLINE_XMLTYPE_NT:            'INLINE_XMLTYPE_NT';
INMEMORY:                     'INMEMORY';
IN_MEMORY_METADATA:           'IN_MEMORY_METADATA';
INMEMORY_PRUNING:             'INMEMORY_PRUNING';
INPLACE:                      'INPLACE';
INSERTCHILDXMLAFTER:          'INSERTCHILDXMLAFTER';
INSERTCHILDXMLBEFORE:         'INSERTCHILDXMLBEFORE';
INSERTCHILDXML:               'INSERTCHILDXML';
INSERTXMLAFTER:               'INSERTXMLAFTER';
INSERTXMLBEFORE:              'INSERTXMLBEFORE';
INSTANCE:                     'INSTANCE';
INSTANCES:                    'INSTANCES';
INSTANTLY:                    'INSTANTLY';
INSTR2:                       'INSTR2';
INSTR4:                       'INSTR4';
INSTRB:                       'INSTRB';
INSTRC:                       'INSTRC';
INSTR:                        'INSTR';
INTERLEAVED:                  'INTERLEAVED';
INTERMEDIATE:                 'INTERMEDIATE';
INTERNAL_CONVERT:             'INTERNAL_CONVERT';
INTERNAL_USE:                 'INTERNAL_USE';
INTERPRETED:                  'INTERPRETED';
INVISIBLE:                    'INVISIBLE';
IN_XQUERY:                    'IN_XQUERY';
ISOLATION_LEVEL:              'ISOLATION_LEVEL';
ITERATION_NUMBER:             'ITERATION_NUMBER';
JAVA:                         J A V A;
JOB:                          'JOB';
JOIN:                         J O I N;
JSON_ARRAYAGG:                'JSON_ARRAYAGG';
JSON_ARRAY:                   'JSON_ARRAY';
JSON_EQUAL:                   'JSON_EQUAL';
JSON_EXISTS2:                 'JSON_EXISTS2';
JSON_EXISTS:                  'JSON_EXISTS';
JSONGET:                      'JSONGET';
JSON:                         'JSON';
JSON_OBJECTAGG:               'JSON_OBJECTAGG';
JSON_OBJECT:                  'JSON_OBJECT';
JSONPARSE:                    'JSONPARSE';
JSON_QUERY:                   'JSON_QUERY';
JSON_SERIALIZE:               'JSON_SERIALIZE';
JSON_TABLE:                   'JSON_TABLE';
JSON_TEXTCONTAINS2:           'JSON_TEXTCONTAINS2';
JSON_TEXTCONTAINS:            'JSON_TEXTCONTAINS';
JSON_VALUE:                   'JSON_VALUE';
KEEP_DUPLICATES:              'KEEP_DUPLICATES';
KEEP:                         K E E P;
KERBEROS:                     'KERBEROS';
KEY:                          'KEY';
KEY_LENGTH:                   'KEY_LENGTH';
KEYSIZE:                      'KEYSIZE';
KEYS:                         'KEYS';
KEYSTORE:                     'KEYSTORE';
KILL:                         'KILL';
LANGUAGE:                     L A N G U A G E;
LAST:                         L A S T;
LAST_VALUE:                   L A S T '_' V A L U E;
LEADING:                      L E A D I N G;
LENGTH2:                      'LENGTH2';
LENGTH4:                      'LENGTH4';
LENGTHB:                      'LENGTHB';
LENGTHC:                      'LENGTHC';
LENGTH:                       'LENGTH';
LESS:                         'LESS';
LEFT:                         L E F T;
LEVEL:                        L E V E L;
LEVELS:                       'LEVELS';
LIBRARY:                      L I B R A R Y;
LIKE:                         L I K E;
LIKE2:                        L I K E '2';
LIKE4:                        L I K E '4';
LIKEC:                        L I K E C;
LIMIT:                        L I M I T;
LIST:                         'LIST';
LN:                           'LN';
LNNVL:                        'LNNVL';
LOAD:                         'LOAD';
LOB:                          'LOB';
LOBNVL:                       'LOBNVL';
LOBS:                         'LOBS';
LOCAL_INDEXES:                'LOCAL_INDEXES';
LOCAL:                        L O C A L;
LOCK:                         L O C K;
LOCKED:                       L O C K E D;
LOGFILE:                      'LOGFILE';
LOGFILES:                     'LOGFILES';
LOGGING:                      'LOGGING';
LOGICAL:                      'LOGICAL';
LOG:                          L O G;
LOGOFF:                       L O G O F F;
LOGON:                        L O G O N;
LONG:                         L O N G;
LOOP:                         L O O P;
LAST_DAY:                     'LAST_DAY';
LATERAL:                      'LATERAL';
LABEL:                        'LABEL';
LAX:                          'LAX';
LAYER:                        'LAYER';
LDAP_REGISTRATION_ENABLED:    'LDAP_REGISTRATION_ENABLED';
LDAP_REGISTRATION:            'LDAP_REGISTRATION';
LDAP_REG_SYNC_INTERVAL:       'LDAP_REG_SYNC_INTERVAL';
LIFECYCLE:                    'LIFECYCLE';
LIFE:                         'LIFE';
LIFETIME:                     'LIFETIME';
LIKE_EXPAND:                  'LIKE_EXPAND';
LINEAR:                       'LINEAR';
LINK:                         'LINK';
LOCALTIME:                    'LOCALTIME';
LOCALTIMESTAMP:               'LOCALTIMESTAMP';
LOCATION:                     'LOCATION';
LOCATOR:                      'LOCATOR';
LOCKING:                      'LOCKING';
LOGICAL_READS_PER_CALL:       'LOGICAL_READS_PER_CALL';
LOGICAL_READS_PER_SESSION:    'LOGICAL_READS_PER_SESSION';
LOGMINING:                    'LOGMINING';
LOG_READ_ONLY_VIOLATIONS:     'LOG_READ_ONLY_VIOLATIONS';
LOWER:                        'LOWER';
LOW:                          'LOW';
LPAD:                         'LPAD';
LTRIM:                        'LTRIM';
MAIN:                         M A I N;
MAP:                          M A P;
MATCHED:                      M A T C H E D;
MAXVALUE:                     M A X V A L U E;
MEASURES:                     M E A S U R E S;
MEMBER:                       M E M B E R;
MERGE:                        M E R G E;
MINUS:                        M I N U S;
MINUTE:                       M I N U T E;
MINVALUE:                     M I N V A L U E;
MLSLABEL:                     M L S L A B E L;
MOD:                          M O D;
MODE:                         M O D E;
MODEL:                        M O D E L;
MODIFY:                       M O D I F Y;
MONTH:                        M O N T H;
MULTISET:                     M U L T I S E T;
MAKE_REF:                     'MAKE_REF';
MANAGED:                      'MANAGED';
MANAGE:                       'MANAGE';
MANAGEMENT:                   'MANAGEMENT';
MANAGER:                      'MANAGER';
MANUAL:                       'MANUAL';
MAPPING:                      'MAPPING';
MASTER:                       'MASTER';
MATCHES:                      'MATCHES';
MATCH:                        'MATCH';
MATCH_NUMBER:                 'MATCH_NUMBER';
MATCH_RECOGNIZE:              'MATCH_RECOGNIZE';
MATERIALIZED:                 'MATERIALIZED';
MATERIALIZE:                  'MATERIALIZE';
MAXARCHLOGS:                  'MAXARCHLOGS';
MAXDATAFILES:                 'MAXDATAFILES';
MAXEXTENTS:                   'MAXEXTENTS';
MAXIMIZE:                     'MAXIMIZE';
MAXINSTANCES:                 'MAXINSTANCES';
MAXLOGFILES:                  'MAXLOGFILES';
MAXLOGHISTORY:                'MAXLOGHISTORY';
MAXLOGMEMBERS:                'MAXLOGMEMBERS';
MAX_SHARED_TEMP_SIZE:         'MAX_SHARED_TEMP_SIZE';
MAXSIZE:                      'MAXSIZE';
MAXTRANS:                     'MAXTRANS';
MEASURE:                      'MEASURE';
MEDIUM:                       'MEDIUM';
MEMCOMPRESS:                  'MEMCOMPRESS';
MEMORY:                       'MEMORY';
MERGEACTIONS:                 'MERGE$ACTIONS';
MERGE_AJ:                     'MERGE_AJ';
MERGE_CONST_ON:               'MERGE_CONST_ON';
MERGE_SJ:                     'MERGE_SJ';
METADATA:                     'METADATA';
METHOD:                       'METHOD';
MIGRATE:                      'MIGRATE';
MIGRATION:                    'MIGRATION';
MINEXTENTS:                   'MINEXTENTS';
MINIMIZE:                     'MINIMIZE';
MINIMUM:                      'MINIMUM';
MINING:                       'MINING';
MINUS_NULL:                   'MINUS_NULL';
MIRRORCOLD:                   'MIRRORCOLD';
MIRRORHOT:                    'MIRRORHOT';
MIRROR:                       'MIRROR';
MODEL_COMPILE_SUBQUERY:       'MODEL_COMPILE_SUBQUERY';
MODEL_DONTVERIFY_UNIQUENESS:  'MODEL_DONTVERIFY_UNIQUENESS';
MODEL_DYNAMIC_SUBQUERY:       'MODEL_DYNAMIC_SUBQUERY';
MODEL_MIN_ANALYSIS:           'MODEL_MIN_ANALYSIS';
MODEL_NB:                     'MODEL_NB';
MODEL_NO_ANALYSIS:            'MODEL_NO_ANALYSIS';
MODEL_PBY:                    'MODEL_PBY';
MODEL_PUSH_REF:               'MODEL_PUSH_REF';
MODEL_SV:                     'MODEL_SV';
MODIFICATION:                 'MODIFICATION';
MODIFY_COLUMN_TYPE:           'MODIFY_COLUMN_TYPE';
MODULE:                       'MODULE';
MONITORING:                   'MONITORING';
MONITOR:                      'MONITOR';
MONTHS_BETWEEN:               'MONTHS_BETWEEN';
MONTHS:                       'MONTHS';
MOUNT:                        'MOUNT';
MOUNTPATH:                    'MOUNTPATH';
MOVEMENT:                     'MOVEMENT';
MOVE:                         'MOVE';
MULTIDIMENSIONAL:             'MULTIDIMENSIONAL';
MV_MERGE:                     'MV_MERGE';
NAME:                         N A M E;
NAN:                          N A N;
NATURAL:                      N A T U R A L;
NATURALN:                     N A T U R A L N;
NAV:                          N A V;
NCHAR:                        N C H A R;
NCHAR_CS:                     N C H A R '_' C S;
NCLOB:                        N C L O B;
NESTED:                       N E S T E D;
NEW:                          N E W;
NEXT:                         N E X T;
NO:                           N O;
NOAUDIT:                      N O A U D I T;
NOCACHE:                      N O C A C H E;
NOCOPY:                       N O C O P Y;
NOCYCLE:                      N O C Y C L E;
NOENTITYESCAPING:             N O E N T I T Y E S C A P I N G;
NOMAXVALUE:                   N O M A X V A L U E;
NOMINVALUE:                   N O M I N V A L U E;
NONE:                         N O N E;
NOORDER:                      N O O R D E R;
NOSCHEMACHECK:                N O S C H E M A C H E C K;
NOT:                          N O T;
NOWAIT:                       N O W A I T;
NULL:                         N U L L;
NULL_:                        'NULL_';
NULLS:                        N U L L S;
NUMBER:                       N U M B E R;
NUMERIC:                      N U M E R I C;
NVARCHAR2:                    N V A R C H A R '2';
NAMED:                        'NAMED';
NAMESPACE:                    'NAMESPACE';
NANVL:                        'NANVL';
NATIONAL:                     'NATIONAL';
NATIVE_FULL_OUTER_JOIN:       'NATIVE_FULL_OUTER_JOIN';
NATIVE:                       'NATIVE';
NCHR:                         'NCHR';
NEEDED:                       'NEEDED';
NEG:                          'NEG';
NESTED_TABLE_FAST_INSERT:     'NESTED_TABLE_FAST_INSERT';
NESTED_TABLE_GET_REFS:        'NESTED_TABLE_GET_REFS';
NESTED_TABLE_ID:              'NESTED_TABLE_ID';
NESTED_TABLE_SET_REFS:        'NESTED_TABLE_SET_REFS';
NESTED_TABLE_SET_SETID:       'NESTED_TABLE_SET_SETID';
NETWORK:                      'NETWORK';
NEVER:                        'NEVER';
NEW_TIME:                     'NEW_TIME';
NEXT_DAY:                     'NEXT_DAY';
NL_AJ:                        'NL_AJ';
NLJ_BATCHING:                 'NLJ_BATCHING';
NLJ_INDEX_FILTER:             'NLJ_INDEX_FILTER';
NLJ_INDEX_SCAN:               'NLJ_INDEX_SCAN';
NLJ_PREFETCH:                 'NLJ_PREFETCH';
NLS_CALENDAR:                 'NLS_CALENDAR';
NLS_CHARACTERSET:             'NLS_CHARACTERSET';
NLS_CHARSET_DECL_LEN:         'NLS_CHARSET_DECL_LEN';
NLS_CHARSET_ID:               'NLS_CHARSET_ID';
NLS_CHARSET_NAME:             'NLS_CHARSET_NAME';
NLS_COMP:                     'NLS_COMP';
NLS_CURRENCY:                 'NLS_CURRENCY';
NLS_DATE_FORMAT:              'NLS_DATE_FORMAT';
NLS_DATE_LANGUAGE:            'NLS_DATE_LANGUAGE';
NLS_INITCAP:                  'NLS_INITCAP';
NLS_ISO_CURRENCY:             'NLS_ISO_CURRENCY';
NL_SJ:                        'NL_SJ';
NLS_LANG:                     'NLS_LANG';
NLS_LANGUAGE:                 'NLS_LANGUAGE';
NLS_LENGTH_SEMANTICS:         'NLS_LENGTH_SEMANTICS';
NLS_LOWER:                    'NLS_LOWER';
NLS_NCHAR_CONV_EXCP:          'NLS_NCHAR_CONV_EXCP';
NLS_NUMERIC_CHARACTERS:       'NLS_NUMERIC_CHARACTERS';
NLS_SORT:                     'NLS_SORT';
NLSSORT:                      'NLSSORT';
NLS_SPECIAL_CHARS:            'NLS_SPECIAL_CHARS';
NLS_TERRITORY:                'NLS_TERRITORY';
NLS_UPPER:                    'NLS_UPPER';
NO_ACCESS:                    'NO_ACCESS';
NO_ADAPTIVE_PLAN:             'NO_ADAPTIVE_PLAN';
NO_ANSI_REARCH:               'NO_ANSI_REARCH';
NOAPPEND:                     'NOAPPEND';
NOARCHIVELOG:                 'NOARCHIVELOG';
NO_AUTO_REOPTIMIZE:           'NO_AUTO_REOPTIMIZE';
NO_BASETABLE_MULTIMV_REWRITE: 'NO_BASETABLE_MULTIMV_REWRITE';
NO_BATCH_TABLE_ACCESS_BY_ROWID: 'NO_BATCH_TABLE_ACCESS_BY_ROWID';
NO_BIND_AWARE:                'NO_BIND_AWARE';
NO_BUFFER:                    'NO_BUFFER';
NO_CARTESIAN:                 'NO_CARTESIAN';
NO_CHECK_ACL_REWRITE:         'NO_CHECK_ACL_REWRITE';
NO_CLUSTER_BY_ROWID:          'NO_CLUSTER_BY_ROWID';
NO_CLUSTERING:                'NO_CLUSTERING';
NO_COALESCE_SQ:               'NO_COALESCE_SQ';
NO_COMMON_DATA:               'NO_COMMON_DATA';
NOCOMPRESS:                   'NOCOMPRESS';
NO_CONNECT_BY_CB_WHR_ONLY:    'NO_CONNECT_BY_CB_WHR_ONLY';
NO_CONNECT_BY_COMBINE_SW:     'NO_CONNECT_BY_COMBINE_SW';
NO_CONNECT_BY_COST_BASED:     'NO_CONNECT_BY_COST_BASED';
NO_CONNECT_BY_ELIM_DUPS:      'NO_CONNECT_BY_ELIM_DUPS';
NO_CONNECT_BY_FILTERING:      'NO_CONNECT_BY_FILTERING';
NO_COST_XML_QUERY_REWRITE:    'NO_COST_XML_QUERY_REWRITE';
NO_CPU_COSTING:               'NO_CPU_COSTING';
NOCPU_COSTING:                'NOCPU_COSTING';
NO_DATA_SECURITY_REWRITE:     'NO_DATA_SECURITY_REWRITE';
NO_DECORRELATE:               'NO_DECORRELATE';
NODELAY:                      'NODELAY';
NO_DOMAIN_INDEX_FILTER:       'NO_DOMAIN_INDEX_FILTER';
NO_DST_UPGRADE_INSERT_CONV:   'NO_DST_UPGRADE_INSERT_CONV';
NO_ELIM_GROUPBY:              'NO_ELIM_GROUPBY';
NO_ELIMINATE_JOIN:            'NO_ELIMINATE_JOIN';
NO_ELIMINATE_OBY:             'NO_ELIMINATE_OBY';
NO_ELIMINATE_OUTER_JOIN:      'NO_ELIMINATE_OUTER_JOIN';
NO_EXPAND_GSET_TO_UNION:      'NO_EXPAND_GSET_TO_UNION';
NO_EXPAND:                    'NO_EXPAND';
NO_EXPAND_TABLE:              'NO_EXPAND_TABLE';
NO_FACT:                      'NO_FACT';
NO_FACTORIZE_JOIN:            'NO_FACTORIZE_JOIN';
NO_FILTERING:                 'NO_FILTERING';
NOFORCE:                      'NOFORCE';
NO_FULL_OUTER_JOIN_TO_OUTER:  'NO_FULL_OUTER_JOIN_TO_OUTER';
NO_GATHER_OPTIMIZER_STATISTICS: 'NO_GATHER_OPTIMIZER_STATISTICS';
NO_GBY_PUSHDOWN:              'NO_GBY_PUSHDOWN';
NOGUARANTEE:                  'NOGUARANTEE';
NO_INDEX_FFS:                 'NO_INDEX_FFS';
NO_INDEX:                     'NO_INDEX';
NO_INDEX_SS:                  'NO_INDEX_SS';
NO_INMEMORY:                  'NO_INMEMORY';
NO_INMEMORY_PRUNING:          'NO_INMEMORY_PRUNING';
NOKEEP:                       'NOKEEP';
NO_LOAD:                      'NO_LOAD';
NOLOCAL:                      'NOLOCAL';
NOLOGGING:                    'NOLOGGING';
NOMAPPING:                    'NOMAPPING';
NO_MERGE:                     'NO_MERGE';
NOMINIMIZE:                   'NOMINIMIZE';
NO_MODEL_PUSH_REF:            'NO_MODEL_PUSH_REF';
NO_MONITORING:                'NO_MONITORING';
NOMONITORING:                 'NOMONITORING';
NO_MONITOR:                   'NO_MONITOR';
NO_MULTIMV_REWRITE:           'NO_MULTIMV_REWRITE';
NO_NATIVE_FULL_OUTER_JOIN:    'NO_NATIVE_FULL_OUTER_JOIN';
NONBLOCKING:                  'NONBLOCKING';
NONEDITIONABLE:               'NONEDITIONABLE';
NO_NLJ_BATCHING:              'NO_NLJ_BATCHING';
NO_NLJ_PREFETCH:              'NO_NLJ_PREFETCH';
NONSCHEMA:                    'NONSCHEMA';
NO_OBJECT_LINK:               'NO_OBJECT_LINK';
NO_ORDER_ROLLUPS:             'NO_ORDER_ROLLUPS';
NO_OUTER_JOIN_TO_ANTI:        'NO_OUTER_JOIN_TO_ANTI';
NO_OUTER_JOIN_TO_INNER:       'NO_OUTER_JOIN_TO_INNER';
NOOVERRIDE:                   'NOOVERRIDE';
NO_PARALLEL_INDEX:            'NO_PARALLEL_INDEX';
NOPARALLEL_INDEX:             'NOPARALLEL_INDEX';
NO_PARALLEL:                  'NO_PARALLEL';
NOPARALLEL:                   'NOPARALLEL';
NO_PARTIAL_COMMIT:            'NO_PARTIAL_COMMIT';
NO_PARTIAL_JOIN:              'NO_PARTIAL_JOIN';
NO_PARTIAL_ROLLUP_PUSHDOWN:   'NO_PARTIAL_ROLLUP_PUSHDOWN';
NOPARTITION:                  'NOPARTITION';
NO_PLACE_DISTINCT:            'NO_PLACE_DISTINCT';
NO_PLACE_GROUP_BY:            'NO_PLACE_GROUP_BY';
NO_PQ_CONCURRENT_UNION:       'NO_PQ_CONCURRENT_UNION';
NO_PQ_MAP:                    'NO_PQ_MAP';
NO_PQ_REPLICATE:              'NO_PQ_REPLICATE';
NO_PQ_SKEW:                   'NO_PQ_SKEW';
NO_PRUNE_GSETS:               'NO_PRUNE_GSETS';
NO_PULL_PRED:                 'NO_PULL_PRED';
NO_PUSH_PRED:                 'NO_PUSH_PRED';
NO_PUSH_SUBQ:                 'NO_PUSH_SUBQ';
NO_PX_FAULT_TOLERANCE:        'NO_PX_FAULT_TOLERANCE';
NO_PX_JOIN_FILTER:            'NO_PX_JOIN_FILTER';
NO_QKN_BUFF:                  'NO_QKN_BUFF';
NO_QUERY_TRANSFORMATION:      'NO_QUERY_TRANSFORMATION';
NO_REF_CASCADE:               'NO_REF_CASCADE';
NORELOCATE:                   'NORELOCATE';
NORELY:                       'NORELY';
NOREPAIR:                     'NOREPAIR';
NOREPLAY:                     'NOREPLAY';
NORESETLOGS:                  'NORESETLOGS';
NO_RESULT_CACHE:              'NO_RESULT_CACHE';
NOREVERSE:                    'NOREVERSE';
NO_REWRITE:                   'NO_REWRITE';
NOREWRITE:                    'NOREWRITE';
NORMAL:                       'NORMAL';
NO_ROOT_SW_FOR_LOCAL:         'NO_ROOT_SW_FOR_LOCAL';
NOROWDEPENDENCIES:            'NOROWDEPENDENCIES';
NOSEGMENT:                    'NOSEGMENT';
NO_SEMIJOIN:                  'NO_SEMIJOIN';
NO_SEMI_TO_INNER:             'NO_SEMI_TO_INNER';
NO_SET_TO_JOIN:               'NO_SET_TO_JOIN';
NOSORT:                       'NOSORT';
NO_SQL_TRANSLATION:           'NO_SQL_TRANSLATION';
NO_SQL_TUNE:                  'NO_SQL_TUNE';
NO_STAR_TRANSFORMATION:       'NO_STAR_TRANSFORMATION';
NO_STATEMENT_QUEUING:         'NO_STATEMENT_QUEUING';
NO_STATS_GSETS:               'NO_STATS_GSETS';
NOSTRICT:                     'NOSTRICT';
NO_SUBQUERY_PRUNING:          'NO_SUBQUERY_PRUNING';
NO_SUBSTRB_PAD:               'NO_SUBSTRB_PAD';
NO_SWAP_JOIN_INPUTS:          'NO_SWAP_JOIN_INPUTS';
NOSWITCH:                     'NOSWITCH';
NO_TABLE_LOOKUP_BY_NL:        'NO_TABLE_LOOKUP_BY_NL';
NO_TEMP_TABLE:                'NO_TEMP_TABLE';
NOTHING:                      'NOTHING';
NOTIFICATION:                 'NOTIFICATION';
NO_TRANSFORM_DISTINCT_AGG:    'NO_TRANSFORM_DISTINCT_AGG';
NO_UNNEST:                    'NO_UNNEST';
NO_USE_CUBE:                  'NO_USE_CUBE';
NO_USE_HASH_AGGREGATION:      'NO_USE_HASH_AGGREGATION';
NO_USE_HASH_GBY_FOR_PUSHDOWN: 'NO_USE_HASH_GBY_FOR_PUSHDOWN';
NO_USE_HASH:                  'NO_USE_HASH';
NO_USE_INVISIBLE_INDEXES:     'NO_USE_INVISIBLE_INDEXES';
NO_USE_MERGE:                 'NO_USE_MERGE';
NO_USE_NL:                    'NO_USE_NL';
NO_USE_VECTOR_AGGREGATION:    'NO_USE_VECTOR_AGGREGATION';
NOVALIDATE:                   'NOVALIDATE';
NO_VECTOR_TRANSFORM_DIMS:     'NO_VECTOR_TRANSFORM_DIMS';
NO_VECTOR_TRANSFORM_FACT:     'NO_VECTOR_TRANSFORM_FACT';
NO_VECTOR_TRANSFORM:          'NO_VECTOR_TRANSFORM';
NO_XDB_FASTPATH_INSERT:       'NO_XDB_FASTPATH_INSERT';
NO_XML_DML_REWRITE:           'NO_XML_DML_REWRITE';
NO_XMLINDEX_REWRITE_IN_SELECT: 'NO_XMLINDEX_REWRITE_IN_SELECT';
NO_XMLINDEX_REWRITE:          'NO_XMLINDEX_REWRITE';
NO_XML_QUERY_REWRITE:         'NO_XML_QUERY_REWRITE';
NO_ZONEMAP:                   'NO_ZONEMAP';
NTH_VALUE:                    'NTH_VALUE';
NULLIF:                       'NULLIF';
NUM_INDEX_KEYS:               'NUM_INDEX_KEYS';
NUMTODSINTERVAL:              'NUMTODSINTERVAL';
NUMTOYMINTERVAL:              'NUMTOYMINTERVAL';
NVL2:                         'NVL2';
OBJECT:                       O B J E C T;
OF:                           O F;
OFF:                          O F F;
OFFSET:                       'OFFSET';
OIDINDEX:                     'OIDINDEX';
OID:                          O I D;
OLD:                          O L D;
ON:                           O N;
ONLY:                         O N L Y;
OPEN:                         O P E N;
OPTION:                       O P T I O N;
OR:                           O R;
ORADATA:                      O R A D A T A;
ORDER:                        O R D E R;
ORDINALITY:                   O R D I N A L I T Y;
OSERROR:                      O S E R R O R;
OUT:                          O U T;
OUTER:                        O U T E R;
OVER:                         O V E R;
OVERRIDING:                   O V E R R I D I N G;
OBJECT2XML:                   'OBJECT2XML';
OBJ_ID:                       'OBJ_ID';
OBJNO:                        'OBJNO';
OBJNO_REUSE:                  'OBJNO_REUSE';
OCCURENCES:                   'OCCURENCES';
OFFLINE:                      'OFFLINE';
OLAP:                         'OLAP';
OLD_PUSH_PRED:                'OLD_PUSH_PRED';
OLS:                          'OLS';
OLTP:                         'OLTP';
OMIT:                         'OMIT';
ONE:                          'ONE';
ONLINE:                       'ONLINE';
ONLINELOG:                    'ONLINELOG';
OPAQUE:                       'OPAQUE';
OPAQUE_TRANSFORM:             'OPAQUE_TRANSFORM';
OPAQUE_XCANONICAL:            'OPAQUE_XCANONICAL';
OPCODE:                       'OPCODE';
OPERATIONS:                   'OPERATIONS';
OPERATOR:                     'OPERATOR';
OPT_ESTIMATE:                 'OPT_ESTIMATE';
OPTIMAL:                      'OPTIMAL';
OPTIMIZE:                     'OPTIMIZE';
OPTIMIZER_FEATURES_ENABLE:    'OPTIMIZER_FEATURES_ENABLE';
OPTIMIZER_GOAL:               'OPTIMIZER_GOAL';
OPT_PARAM:                    'OPT_PARAM';
ORA_BRANCH:                   'ORA_BRANCH';
ORA_CHECK_ACL:                'ORA_CHECK_ACL';
ORA_CHECK_PRIVILEGE:          'ORA_CHECK_PRIVILEGE';
ORA_CLUSTERING:               'ORA_CLUSTERING';
ORADEBUG:                     'ORADEBUG';
ORA_DST_AFFECTED:             'ORA_DST_AFFECTED';
ORA_DST_CONVERT:              'ORA_DST_CONVERT';
ORA_DST_ERROR:                'ORA_DST_ERROR';
ORA_GET_ACLIDS:               'ORA_GET_ACLIDS';
ORA_GET_PRIVILEGES:           'ORA_GET_PRIVILEGES';
ORA_HASH:                     'ORA_HASH';
ORA_INVOKING_USERID:          'ORA_INVOKING_USERID';
ORA_INVOKING_USER:            'ORA_INVOKING_USER';
ORA_INVOKING_XS_USER_GUID:    'ORA_INVOKING_XS_USER_GUID';
ORA_INVOKING_XS_USER:         'ORA_INVOKING_XS_USER';
ORA_RAWCOMPARE:               'ORA_RAWCOMPARE';
ORA_RAWCONCAT:                'ORA_RAWCONCAT';
ORA_ROWSCN:                   'ORA_ROWSCN';
ORA_ROWSCN_RAW:               'ORA_ROWSCN_RAW';
ORA_ROWVERSION:               'ORA_ROWVERSION';
ORA_TABVERSION:               'ORA_TABVERSION';
ORA_WRITE_TIME:               'ORA_WRITE_TIME';
ORDERED:                      'ORDERED';
ORDERED_PREDICATES:           'ORDERED_PREDICATES';
OR_EXPAND:                    'OR_EXPAND';
ORGANIZATION:                 'ORGANIZATION';
OR_PREDICATES:                'OR_PREDICATES';
OTHER:                        'OTHER';
OUTER_JOIN_TO_ANTI:           'OUTER_JOIN_TO_ANTI';
OUTER_JOIN_TO_INNER:          'OUTER_JOIN_TO_INNER';
OUTLINE_LEAF:                 'OUTLINE_LEAF';
OUTLINE:                      'OUTLINE';
OUT_OF_LINE:                  'OUT_OF_LINE';
OVERFLOW_NOMOVE:              'OVERFLOW_NOMOVE';
OVERFLOW:                     'OVERFLOW';
OVERLAPS:                     'OVERLAPS';
OWNER:                        'OWNER';
OWNERSHIP:                    'OWNERSHIP';
OWN:                          'OWN';
PACKAGE:                      P A C K A G E;
PARALLEL_ENABLE:              P A R A L L E L '_' E N A B L E;
PARAMETERS:                   P A R A M E T E R S;
PARENT:                       P A R E N T;
PARTITION:                    P A R T I T I O N;
PASSING:                      P A S S I N G;
PATH:                         P A T H;
PERCENT_ISOPEN:               '%' I S O P E N;
PERCENT_ROWTYPE:              '%' R O W T Y P E;
PERCENT_TYPE:                 '%' T Y P E;
PERCENT_FOUND:                '%' F O U N D;
PERCENT_NOTFOUND:             '%' N O T F O U N D;
PERCENT_KEYWORD:              'PERCENT';
PERCENT_RANKM:                'PERCENT_RANKM';
PERCENT_ROWCOUNT:             '%' R O W C O U N T;
PIPELINED:                    P I P E L I N E D;
PIPE:                         P I P E;
PIVOT:                        P I V O T;
PLAN:                         P L A N;
PLS_INTEGER:                  P L S '_' I N T E G E R;
POSITIVE:                     P O S I T I V E;
POSITIVEN:                    P O S I T I V E N;
PRAGMA:                       P R A G M A;
PRECEDING:                    P R E C E D I N G;
PRECISION:                    P R E C I S I O N;
PRESENT:                      P R E S E N T;
PRIOR:                        P R I O R;
PROCEDURE:                    P R O C E D U R E;
PACKAGES:                     'PACKAGES';
PARALLEL_INDEX:               'PARALLEL_INDEX';
PARALLEL:                     'PARALLEL';
PARAMETERFILE:                'PARAMETERFILE';
PARAM:                        'PARAM';
PARITY:                       'PARITY';
PARTIAL_JOIN:                 'PARTIAL_JOIN';
PARTIALLY:                    'PARTIALLY';
PARTIAL:                      'PARTIAL';
PARTIAL_ROLLUP_PUSHDOWN:      'PARTIAL_ROLLUP_PUSHDOWN';
PARTITION_HASH:               'PARTITION_HASH';
PARTITION_LIST:               'PARTITION_LIST';
PARTITION_RANGE:              'PARTITION_RANGE';
PARTITIONS:                   'PARTITIONS';
PARTNUMINST:                  'PART$NUM$INST';
PASSWORD_GRACE_TIME:          'PASSWORD_GRACE_TIME';
PASSWORD_LIFE_TIME:           'PASSWORD_LIFE_TIME';
PASSWORD_LOCK_TIME:           'PASSWORD_LOCK_TIME';
PASSWORD:                     'PASSWORD';
PASSWORD_REUSE_MAX:           'PASSWORD_REUSE_MAX';
PASSWORD_REUSE_TIME:          'PASSWORD_REUSE_TIME';
PASSWORD_VERIFY_FUNCTION:     'PASSWORD_VERIFY_FUNCTION';
PAST:                         'PAST';
PATCH:                        'PATCH';
PATH_PREFIX:                  'PATH_PREFIX';
PATHS:                        'PATHS';
PATTERN:                      'PATTERN';
PBL_HS_BEGIN:                 'PBL_HS_BEGIN';
PBL_HS_END:                   'PBL_HS_END';
PCTFREE:                      'PCTFREE';
PCTINCREASE:                  'PCTINCREASE';
PCTTHRESHOLD:                 'PCTTHRESHOLD';
PCTUSED:                      'PCTUSED';
PCTVERSION:                   'PCTVERSION';
PENDING:                      'PENDING';
PERFORMANCE:                  'PERFORMANCE';
PERIOD_KEYWORD:               'PERIOD';
PERMANENT:                    'PERMANENT';
PERMISSION:                   'PERMISSION';
PERMUTE:                      'PERMUTE';
PER:                          'PER';
PFILE:                        'PFILE';
PHYSICAL:                     'PHYSICAL';
PIKEY:                        'PIKEY';
PIV_GB:                       'PIV_GB';
PIV_SSF:                      'PIV_SSF';
PLACE_DISTINCT:               'PLACE_DISTINCT';
PLACE_GROUP_BY:               'PLACE_GROUP_BY';
PLSCOPE_SETTINGS:             'PLSCOPE_SETTINGS';
PLSQL_CCFLAGS:                'PLSQL_CCFLAGS';
PLSQL_CODE_TYPE:              'PLSQL_CODE_TYPE';
PLSQL_DEBUG:                  'PLSQL_DEBUG';
PLSQL_OPTIMIZE_LEVEL:         'PLSQL_OPTIMIZE_LEVEL';
PLSQL_WARNINGS:               'PLSQL_WARNINGS';
PLUGGABLE:                    'PLUGGABLE';
POINT:                        'POINT';
POLICY:                       'POLICY';
POOL_16K:                     'POOL_16K';
POOL_2K:                      'POOL_2K';
POOL_32K:                     'POOL_32K';
POOL_4K:                      'POOL_4K';
POOL_8K:                      'POOL_8K';
POST_TRANSACTION:             'POST_TRANSACTION';
POWERMULTISET_BY_CARDINALITY: 'POWERMULTISET_BY_CARDINALITY';
POWERMULTISET:                'POWERMULTISET';
POWER:                        'POWER';
PQ_CONCURRENT_UNION:          'PQ_CONCURRENT_UNION';
PQ_DISTRIBUTE:                'PQ_DISTRIBUTE';
PQ_DISTRIBUTE_WINDOW:         'PQ_DISTRIBUTE_WINDOW';
PQ_FILTER:                    'PQ_FILTER';
PQ_MAP:                       'PQ_MAP';
PQ_NOMAP:                     'PQ_NOMAP';
PQ_REPLICATE:                 'PQ_REPLICATE';
PQ_SKEW:                      'PQ_SKEW';
PREBUILT:                     'PREBUILT';
PRECEDES:                     'PRECEDES';
PRECOMPUTE_SUBQUERY:          'PRECOMPUTE_SUBQUERY';
PREDICATE_REORDERS:           'PREDICATE_REORDERS';
PRELOAD:                      'PRELOAD';
PREPARE:                      'PREPARE';
PRESENTNNV:                   'PRESENTNNV';
PRESENTV:                     'PRESENTV';
PRESERVE_OID:                 'PRESERVE_OID';
PRESERVE:                     'PRESERVE';
PRETTY:                       'PRETTY';
PREVIOUS:                     'PREVIOUS';
PREV:                         'PREV';
PRIMARY:                      'PRIMARY';
PRINTBLOBTOCLOB:              'PRINTBLOBTOCLOB';
PRIORITY:                     'PRIORITY';
PRIVATE:                      'PRIVATE';
PRIVATE_SGA:                  'PRIVATE_SGA';
PRIVILEGED:                   'PRIVILEGED';
PRIVILEGE:                    'PRIVILEGE';
PRIVILEGES:                   'PRIVILEGES';
PROCEDURAL:                   'PROCEDURAL';
PROCESS:                      'PROCESS';
PROFILE:                      'PROFILE';
PROGRAM:                      'PROGRAM';
PROJECT:                      'PROJECT';
PROPAGATE:                    'PROPAGATE';
PROTECTED:                    'PROTECTED';
PROTECTION:                   'PROTECTION';
PROXY:                        'PROXY';
PRUNING:                      'PRUNING';
PUBLIC:                       'PUBLIC';
PULL_PRED:                    'PULL_PRED';
PURGE:                        'PURGE';
PUSH_PRED:                    'PUSH_PRED';
PUSH_SUBQ:                    'PUSH_SUBQ';
PX_FAULT_TOLERANCE:           'PX_FAULT_TOLERANCE';
PX_GRANULE:                   'PX_GRANULE';
PX_JOIN_FILTER:               'PX_JOIN_FILTER';
QB_NAME:                      'QB_NAME';
QUERY_BLOCK:                  'QUERY_BLOCK';
QUERY:                        'QUERY';
QUEUE_CURR:                   'QUEUE_CURR';
QUEUE:                        'QUEUE';
QUEUE_ROWP:                   'QUEUE_ROWP';
QUIESCE:                      'QUIESCE';
QUORUM:                       'QUORUM';
QUOTA:                        'QUOTA';
RAISE:                        R A I S E;
RANGE:                        R A N G E;
RAW:                          R A W;
READ:                         R E A D;
REAL:                         R E A L;
RECORD:                       R E C O R D;
REF:                          R E F;
REFERENCE:                    R E F E R E N C E;
REFERENCING:                  R E F E R E N C I N G;
REJECT:                       R E J E C T;
RELIES_ON:                    R E L I E S '_' O N;
RENAME:                       R E N A M E;
REPLACE:                      R E P L A C E;
RESPECT:                      R E S P E C T;
RESTRICT_REFERENCES:          R E S T R I C T '_' R E F E R E N C E S;
RESULT:                       R E S U L T;
RESULT_CACHE:                 R E S U L T '_' C A C H E;
RETURN:                       R E T U R N;
RETURNING:                    R E T U R N I N G;
REUSE:                        R E U S E;
REVERSE:                      R E V E R S E;
REVOKE:                       R E V O K E;
RIGHT:                        R I G H T;
ROLLBACK:                     R O L L B A C K;
ROLLUP:                       R O L L U P;
ROW:                          R O W;
ROWID:                        R O W I D;
ROWS:                         R O W S;
RULES:                        R U L E S;
RANDOM_LOCAL:                 'RANDOM_LOCAL';
RANDOM:                       'RANDOM';
RANKM:                        'RANKM';
RAPIDLY:                      'RAPIDLY';
RAWTOHEX:                     'RAWTOHEX';
RAWTONHEX:                    'RAWTONHEX';
RBA:                          'RBA';
RBO_OUTLINE:                  'RBO_OUTLINE';
RDBA:                         'RDBA';
READS:                        'READS';
REALM:                        'REALM';
REBALANCE:                    'REBALANCE';
REBUILD:                      'REBUILD';
RECORDS_PER_BLOCK:            'RECORDS_PER_BLOCK';
RECOVERABLE:                  'RECOVERABLE';
RECOVER:                      'RECOVER';
RECOVERY:                     'RECOVERY';
RECYCLEBIN:                   'RECYCLEBIN';
RECYCLE:                      'RECYCLE';
REDACTION:                    'REDACTION';
REDEFINE:                     'REDEFINE';
REDO:                         'REDO';
REDUCED:                      'REDUCED';
REDUNDANCY:                   'REDUNDANCY';
REF_CASCADE_CURSOR:           'REF_CASCADE_CURSOR';
REFERENCED:                   'REFERENCED';
REFERENCES:                   'REFERENCES';
REFRESH:                      'REFRESH';
REFTOHEX:                     'REFTOHEX';
REGEXP_COUNT:                 'REGEXP_COUNT';
REGEXP_INSTR:                 'REGEXP_INSTR';
REGEXP_LIKE:                  'REGEXP_LIKE';
REGEXP_REPLACE:               'REGEXP_REPLACE';
REGEXP_SUBSTR:                'REGEXP_SUBSTR';
REGISTER:                     'REGISTER';
REGR_AVGX:                    'REGR_AVGX';
REGR_AVGY:                    'REGR_AVGY';
REGR_COUNT:                   'REGR_COUNT';
REGR_INTERCEPT:               'REGR_INTERCEPT';
REGR_R2:                      'REGR_R2';
REGR_SLOPE:                   'REGR_SLOPE';
REGR_SXX:                     'REGR_SXX';
REGR_SXY:                     'REGR_SXY';
REGR_SYY:                     'REGR_SYY';
REGULAR:                      'REGULAR';
REKEY:                        'REKEY';
RELATIONAL:                   'RELATIONAL';
RELOCATE:                     'RELOCATE';
RELY:                         'RELY';
REMAINDER:                    'REMAINDER';
REMOTE_MAPPED:                'REMOTE_MAPPED';
REMOVE:                       'REMOVE';
REPAIR:                       'REPAIR';
REPEAT:                       'REPEAT';
REPLICATION:                  'REPLICATION';
REQUIRED:                     'REQUIRED';
RESETLOGS:                    'RESETLOGS';
RESET:                        'RESET';
RESIZE:                       'RESIZE';
RESOLVE:                      'RESOLVE';
RESOLVER:                     'RESOLVER';
RESOURCE:                     'RESOURCE';
RESTART:                      'RESTART';
RESTORE_AS_INTERVALS:         'RESTORE_AS_INTERVALS';
RESTORE:                      'RESTORE';
RESTRICT_ALL_REF_CONS:        'RESTRICT_ALL_REF_CONS';
RESTRICTED:                   'RESTRICTED';
RESTRICT:                     'RESTRICT';
RESUMABLE:                    'RESUMABLE';
RESUME:                       'RESUME';
RETENTION:                    'RETENTION';
RETRY_ON_ROW_CHANGE:          'RETRY_ON_ROW_CHANGE';
REWRITE_OR_ERROR:             'REWRITE_OR_ERROR';
REWRITE:                      'REWRITE';
ROLE:                         'ROLE';
ROLESET:                      'ROLESET';
ROLES:                        'ROLES';
ROLLING:                      'ROLLING';
ROWDEPENDENCIES:              'ROWDEPENDENCIES';
ROWID_MAPPING_TABLE:          'ROWID_MAPPING_TABLE';
ROWIDTOCHAR:                  'ROWIDTOCHAR';
ROWIDTONCHAR:                 'ROWIDTONCHAR';
ROW_LENGTH:                   'ROW_LENGTH';
ROWNUM:                       'ROWNUM';
RPAD:                         'RPAD';
RTRIM:                        'RTRIM';
RULE:                         'RULE';
RUNNING:                      'RUNNING';
SAMPLE:                       S A M P L E;
SAVE:                         S A V E;
SAVEPOINT:                    S A V E P O I N T;
SCHEMA:                       S C H E M A;
SCHEMACHECK:                  S C H E M A C H E C K;
SCN:                          S C N;
SEARCH:                       S E A R C H;
SECOND:                       S E C O N D;
SEED:                         S E E D;
SEGMENT:                      S E G M E N T;
SELECT:                       S E L E C T;
SELF:                         S E L F;
SEQUENCE:                     S E Q U E N C E;
SEQUENTIAL:                   S E Q U E N T I A L;
SERIALIZABLE:                 S E R I A L I Z A B L E;
SERIALLY_REUSABLE:            S E R I A L L Y '_' R E U S A B L E;
SERVERERROR:                  S E R V E R E R R O R;
SESSIONTIMEZONE:              S E S S I O N T I M E Z O N E;
SET:                          S E T;
//SET:                          'SET';
SETS:                         S E T S;
SETTINGS:                     S E T T I N G S;
SHARE:                        S H A R E;
SHOW:                         S H O W;
SHUTDOWN:                     S H U T D O W N;
SIBLINGS:                     S I B L I N G S;
SIGNTYPE:                     S I G N T Y P E;
SIMPLE_INTEGER:               S I M P L E '_' I N T E G E R;
SINGLE:                       S I N G L E;
SIZE:                         S I Z E;
SKIP_:                        S K I P; // Alris: added _ (cannot declare a rule with reserved name SKIP)
SMALLINT:                     S M A L L I N T;
SNAPSHOT:                     S N A P S H O T;
SOME:                         S O M E;
SPECIFICATION:                S P E C I F I C A T I O N;
SQLDATA:                      S Q L D A T A;
SQLERROR:                     S Q L E R R O R;
SQL_PERCENT_ROWCOUNT:         S Q L '%' R O W C O U N T;
STANDALONE:                   S T A N D A L O N E;
START:                        S T A R T;
STARTUP:                      S T A R T U P;
STATEMENT:                    S T A T E M E N T;
STATEMENT_ID:                 S T A T E M E N T '_' I D;
STATIC:                       S T A T I C;
STATISTICS:                   S T A T I S T I C S;
STRING:                       S T R I N G;
SUBMULTISET:                  S U B M U L T I S E T;
SUBPARTITION:                 S U B P A R T I T I O N;
SUBSTITUTABLE:                S U B S T I T U T A B L E;
SUBTYPE:                      S U B T Y P E;
SUCCESS:                      S U C C E S S;
SUSPEND:                      S U S P E N D;
TABLE:                        T A B L E;
THE:                          T H E;
THEN:                         T H E N;
THREAD:                       'THREAD';
THROUGH:                      'THROUGH';
TIER:                         'TIER';
TIES:                         'TIES';
TIMEOUT:                      'TIMEOUT';
TIMES:                        'TIMES';
TIME:                         T I M E;
TIMESTAMP:                    T I M E S T A M P;
TIMESTAMP_LTZ_UNCONSTRAINED:  T I M E S T A M P '_' L T Z '_' U N C O N S T R A I N E D;
TIMESTAMP_TZ_UNCONSTRAINED:   T I M E S T A M P '_' T Z '_' U N C O N S T R A I N E D;
TIMESTAMP_UNCONSTRAINED:      T I M E S T A M P '_' U N C O N S T R A I N E D;
TIMEZONE_ABBR:                T I M E Z O N E '_' A B B R;
TIMEZONE_HOUR:                T I M E Z O N E '_' H O U R;
TIMEZONE_MINUTE:              T I M E Z O N E '_' M I N U T E;
TIMEZONE_REGION:              T I M E Z O N E '_' R E G I O N;
TO:                           T O;
TO_CHAR:                      T O '_' C H A R;
TO_NUMBER:                    T O '_' N U M B E R;
TRAILING:                     T R A I L I N G;
TRANSACTION:                  T R A N S A C T I O N;
TRANSLATE:                    T R A N S L A T E;
TREAT:                        T R E A T;
TRIGGER:                      T R I G G E R;
TRIM:                         T R I M;
TRUE:                         T R U E;
TRUNCATE:                     T R U N C A T E;
TYPE:                         T Y P E;
UNBOUNDED:                    U N B O U N D E D;
UNDER:                        U N D E R;
UNION:                        U N I O N;
UNIQUE:                       U N I Q U E;
UNLIMITED:                    U N L I M I T E D;
UNPIVOT:                      U N P I V O T;
UNTIL:                        U N T I L;
UPDATE:                       U P D A T E;
UPDATED:                      U P D A T E D;
UPSERT:                       U P S E R T;
UROWID:                       U R O W I D;
USE:                          U S E;
USING:                        U S I N G;
VALIDATE:                     V A L I D A T E;
VALUE:                        V A L U E;
VALUES:                       V A L U E S;
VARCHAR:                      V A R C H A R;
VARCHAR2:                     V A R C H A R '2';
VARIABLE:                     V A R I A B L E;
VARRAY:                       V A R R A Y;
VARYING:                      V A R Y I N G;
VERSION:                      V E R S I O N;
VERSIONS:                     V E R S I O N S;
WAIT:                         W A I T;
WARNING:                      W A R N I N G;
WELLFORMED:                   W E L L F O R M E D;
WHEN:                         W H E N;
WHENEVER:                     W H E N E V E R;
WHERE:                        W H E R E;
WHILE:                        W H I L E;
WITH:                         W I T H;
WITHIN:                       W I T H I N;
WORK:                         W O R K;
WRITE:                        W R I T E;
XML:                          X M L;
XMLAGG:                       X M L A G G;
XMLATTRIBUTES:                X M L A T T R I B U T E S;
XMLCAST:                      X M L C A S T;
XMLCOLATTVAL:                 X M L C O L A T T V A L;
XMLELEMENT:                   X M L E L E M E N T;
XMLEXISTS:                    X M L E X I S T S;
XMLFOREST:                    X M L F O R E S T;
XMLNAMESPACES:                X M L N A M E S P A C E S;
XMLPARSE:                     X M L P A R S E;
XMLPI:                        X M L P I;
XMLQUERY:                     X M L Q U E R Y;
XMLROOT:                      X M L R O O T;
XMLSERIALIZE:                 X M L S E R I A L I Z E;
XMLTABLE:                     X M L T A B L E;
YEAR:                         Y E A R;
YES:                          Y E S;
YMINTERVAL_UNCONSTRAINED:     Y M I N T E R V A L '_' U N C O N S T R A I N E D;
ZONE:                         Z O N E;

PREDICTION:                   P R E D I C T I O N;
PREDICTION_BOUNDS:            P R E D I C T I O N '_' B O U N D S;
PREDICTION_COST:              P R E D I C T I O N '_' C O S T;
PREDICTION_DETAILS:           P R E D I C T I O N '_' D E T A I L S;
PREDICTION_PROBABILITY:       P R E D I C T I O N '_' P R O B A B I L I T Y;
PREDICTION_SET:               P R E D I C T I O N '_' S E T;

CUME_DIST:                    C U M E '_' D I S T;
DENSE_RANK:                   D E N S E '_' R A N K;
LISTAGG:                      L I S T A G G;
PERCENT_RANK:                 P E R C E N T '_' R A N K;
PERCENTILE_CONT:              P E R C E N T I L E '_' C O N T;
PERCENTILE_DISC:              P E R C E N T I L E '_' D I S C;
RANK:                         R A N K;

AVG:                          A V G;
CORR:                         C O R R;
LAG:                          L A G;
LEAD:                         L E A D;
MAX:                          M A X;
MEDIAN:                       M E D I A N;
MIN:                          M I N;
NTILE:                        N T I L E;
RATIO_TO_REPORT:              R A T I O '_' T O '_' R  E P O R T;
ROUND:                        'ROUND';
ROW_NUMBER:                   R O W '_' N U M B E R;
SUBSTR:                       'SUBSTR';
SUM:                          S U M;
VARIANCE:                     V A R I A N C E;
LEAST:                        'LEAST';
GREATEST:                     'GREATEST';
TO_DATE:                      'TO_DATE';
REGR_:                        R E G R '_';
SALT:                         'SALT';
SAVE_AS_INTERVALS:            'SAVE_AS_INTERVALS';
SB4:                          'SB4';
SCALE_ROWS:                   'SCALE_ROWS';
SCALE:                        'SCALE';
SCAN_INSTANCES:               'SCAN_INSTANCES';
SCAN:                         'SCAN';
SCHEDULER:                    'SCHEDULER';
SCN_ASCENDING:                'SCN_ASCENDING';
SCOPE:                        'SCOPE';
SCRUB:                        'SCRUB';
SD_ALL:                       'SD_ALL';
SD_INHIBIT:                   'SD_INHIBIT';
SDO_GEOM_MBR:                 'SDO_GEOM_MBR';
SD_SHOW:                      'SD_SHOW';
SECRET:                       'SECRET';
SECUREFILE_DBA:               'SECUREFILE_DBA';
SECUREFILE:                   'SECUREFILE';
SECURITY:                     'SECURITY';
SEG_BLOCK:                    'SEG_BLOCK';
SEG_FILE:                     'SEG_FILE';
SELECTIVITY:                  'SELECTIVITY';
SEMIJOIN_DRIVER:              'SEMIJOIN_DRIVER';
SEMIJOIN:                     'SEMIJOIN';
SEMI_TO_INNER:                'SEMI_TO_INNER';
SEQUENCED:                    'SEQUENCED';
SEQ:                          'SEQ';
SERIAL:                       'SERIAL';
SERVICE_NAME_CONVERT:         'SERVICE_NAME_CONVERT';
SERVICES:                     'SERVICES';
SESSION_CACHED_CURSORS:       'SESSION_CACHED_CURSORS';
SESSION:                      'SESSION';
SESSIONS_PER_USER:            'SESSIONS_PER_USER';
SESSIONTZNAME:                'SESSIONTZNAME';
SET_TO_JOIN:                  'SET_TO_JOIN';
SEVERE:                       'SEVERE';
SHARED_POOL:                  'SHARED_POOL';
SHARED:                       'SHARED';
SHARING:                      'SHARING';
SHELFLIFE:                    'SHELFLIFE';
SHRINK:                       'SHRINK';
SID:                          'SID';
SIGNAL_COMPONENT:             'SIGNAL_COMPONENT';
SIGNAL_FUNCTION:              'SIGNAL_FUNCTION';
SIGN:                         'SIGN';
SIMPLE:                       'SIMPLE';
SINGLETASK:                   'SINGLETASK';
SINH:                         'SINH';
SIN:                          'SIN';
SKIP_EXT_OPTIMIZER:           'SKIP_EXT_OPTIMIZER';
SKIP_UNQ_UNUSABLE_IDX:        'SKIP_UNQ_UNUSABLE_IDX';
SKIP_UNUSABLE_INDEXES:        'SKIP_UNUSABLE_INDEXES';
SMALLFILE:                    'SMALLFILE';
SORT:                         'SORT';
SOUNDEX:                      'SOUNDEX';
SOURCE_FILE_DIRECTORY:        'SOURCE_FILE_DIRECTORY';
SOURCE_FILE_NAME_CONVERT:     'SOURCE_FILE_NAME_CONVERT';
SOURCE:                       'SOURCE';
SPACE_KEYWORD:                'SPACE';
SPFILE:                       'SPFILE';
SPLIT:                        'SPLIT';
SPREADSHEET:                  'SPREADSHEET';
SQLLDR:                       'SQLLDR';
SQL:                          'SQL';
SQL_TRACE:                    'SQL_TRACE';
SQL_TRANSLATION_PROFILE:      'SQL_TRANSLATION_PROFILE';
SQRT:                         'SQRT';
STALE:                        'STALE';
STANDARD_HASH:                'STANDARD_HASH';
STANDBY_MAX_DATA_DELAY:       'STANDBY_MAX_DATA_DELAY';
STANDBYS:                     'STANDBYS';
STANDBY:                      'STANDBY';
STAR:                         'STAR';
STAR_TRANSFORMATION:          'STAR_TRANSFORMATION';
STATEMENT_QUEUING:            'STATEMENT_QUEUING';
STATEMENTS:                   'STATEMENTS';
STATE:                        'STATE';
STATS_BINOMIAL_TEST:          'STATS_BINOMIAL_TEST';
STATS_CROSSTAB:               'STATS_CROSSTAB';
STATS_F_TEST:                 'STATS_F_TEST';
STATS_KS_TEST:                'STATS_KS_TEST';
STATS_MODE:                   'STATS_MODE';
STATS_MW_TEST:                'STATS_MW_TEST';
STATS_ONE_WAY_ANOVA:          'STATS_ONE_WAY_ANOVA';
STATS_T_TEST_INDEP:           'STATS_T_TEST_INDEP';
STATS_T_TEST_INDEPU:          'STATS_T_TEST_INDEPU';
STATS_T_TEST_ONE:             'STATS_T_TEST_ONE';
STATS_T_TEST_PAIRED:          'STATS_T_TEST_PAIRED';
STATS_WSR_TEST:               'STATS_WSR_TEST';
STDDEV:                       S T D D E V;
STDDEV_POP:                   'STDDEV_POP';
STDDEV_SAMP:                  'STDDEV_SAMP';
STOP:                         'STOP';
STORAGE:                      'STORAGE';
STORE:                        'STORE';
STREAMS:                      'STREAMS';
STREAM:                       'STREAM';
STRICT:                       'STRICT';
STRIPE_COLUMNS:               'STRIPE_COLUMNS';
STRIPE_WIDTH:                 'STRIPE_WIDTH';
STRIP:                        'STRIP';
STRUCTURE:                    'STRUCTURE';
SUBPARTITION_REL:             'SUBPARTITION_REL';
SUBPARTITIONS:                'SUBPARTITIONS';
SUBQUERIES:                   'SUBQUERIES';
SUBQUERY_PRUNING:             'SUBQUERY_PRUNING';
SUBSCRIBE:                    'SUBSCRIBE';
SUBSET:                       'SUBSET';
SUBSTR2:                      'SUBSTR2';
SUBSTR4:                      'SUBSTR4';
SUBSTRB:                      'SUBSTRB';
SUBSTRC:                      'SUBSTRC';
SUCCESSFUL:                   'SUCCESSFUL';
SUMMARY:                      'SUMMARY';
SUPPLEMENTAL:                 'SUPPLEMENTAL';
SWAP_JOIN_INPUTS:             'SWAP_JOIN_INPUTS';
SWITCHOVER:                   'SWITCHOVER';
SWITCH:                       'SWITCH';
SYNCHRONOUS:                  'SYNCHRONOUS';
SYNC:                         'SYNC';
SYNONYM:                      'SYNONYM';
SYSASM:                       'SYSASM';
SYS_AUDIT:                    'SYS_AUDIT';
SYSAUX:                       'SYSAUX';
SYSBACKUP:                    'SYSBACKUP';
SYS_CHECKACL:                 'SYS_CHECKACL';
SYS_CHECK_PRIVILEGE:          'SYS_CHECK_PRIVILEGE';
SYS_CONNECT_BY_PATH:          'SYS_CONNECT_BY_PATH';
SYS_CONTEXT:                  'SYS_CONTEXT';
SYSDATE:                      'SYSDATE';
SYSDBA:                       'SYSDBA';
SYS_DBURIGEN:                 'SYS_DBURIGEN';
SYSDG:                        'SYSDG';
SYS_DL_CURSOR:                'SYS_DL_CURSOR';
SYS_DM_RXFORM_CHR:            'SYS_DM_RXFORM_CHR';
SYS_DM_RXFORM_NUM:            'SYS_DM_RXFORM_NUM';
SYS_DOM_COMPARE:              'SYS_DOM_COMPARE';
SYS_DST_PRIM2SEC:             'SYS_DST_PRIM2SEC';
SYS_DST_SEC2PRIM:             'SYS_DST_SEC2PRIM';
SYS_ET_BFILE_TO_RAW:          'SYS_ET_BFILE_TO_RAW';
SYS_ET_BLOB_TO_IMAGE:         'SYS_ET_BLOB_TO_IMAGE';
SYS_ET_IMAGE_TO_BLOB:         'SYS_ET_IMAGE_TO_BLOB';
SYS_ET_RAW_TO_BFILE:          'SYS_ET_RAW_TO_BFILE';
SYS_EXTPDTXT:                 'SYS_EXTPDTXT';
SYS_EXTRACT_UTC:              'SYS_EXTRACT_UTC';
SYS_FBT_INSDEL:               'SYS_FBT_INSDEL';
SYS_FILTER_ACLS:              'SYS_FILTER_ACLS';
SYS_FNMATCHES:                'SYS_FNMATCHES';
SYS_FNREPLACE:                'SYS_FNREPLACE';
SYS_GET_ACLIDS:               'SYS_GET_ACLIDS';
SYS_GET_COL_ACLIDS:           'SYS_GET_COL_ACLIDS';
SYS_GET_PRIVILEGES:           'SYS_GET_PRIVILEGES';
SYS_GETTOKENID:               'SYS_GETTOKENID';
SYS_GETXTIVAL:                'SYS_GETXTIVAL';
SYS_GUID:                     'SYS_GUID';
SYSGUID:                      'SYSGUID';
SYSKM:                        'SYSKM';
SYS_MAKE_XMLNODEID:           'SYS_MAKE_XMLNODEID';
SYS_MAKEXML:                  'SYS_MAKEXML';
SYS_MKXMLATTR:                'SYS_MKXMLATTR';
SYS_MKXTI:                    'SYS_MKXTI';
SYSOBJ:                       'SYSOBJ';
SYS_OP_ADT2BIN:               'SYS_OP_ADT2BIN';
SYS_OP_ADTCONS:               'SYS_OP_ADTCONS';
SYS_OP_ALSCRVAL:              'SYS_OP_ALSCRVAL';
SYS_OP_ATG:                   'SYS_OP_ATG';
SYS_OP_BIN2ADT:               'SYS_OP_BIN2ADT';
SYS_OP_BITVEC:                'SYS_OP_BITVEC';
SYS_OP_BL2R:                  'SYS_OP_BL2R';
SYS_OP_BLOOM_FILTER_LIST:     'SYS_OP_BLOOM_FILTER_LIST';
SYS_OP_BLOOM_FILTER:          'SYS_OP_BLOOM_FILTER';
SYS_OP_C2C:                   'SYS_OP_C2C';
SYS_OP_CAST:                  'SYS_OP_CAST';
SYS_OP_CEG:                   'SYS_OP_CEG';
SYS_OP_CL2C:                  'SYS_OP_CL2C';
SYS_OP_COMBINED_HASH:         'SYS_OP_COMBINED_HASH';
SYS_OP_COMP:                  'SYS_OP_COMP';
SYS_OP_CONVERT:               'SYS_OP_CONVERT';
SYS_OP_COUNTCHG:              'SYS_OP_COUNTCHG';
SYS_OP_CSCONV:                'SYS_OP_CSCONV';
SYS_OP_CSCONVTEST:            'SYS_OP_CSCONVTEST';
SYS_OP_CSR:                   'SYS_OP_CSR';
SYS_OP_CSX_PATCH:             'SYS_OP_CSX_PATCH';
SYS_OP_CYCLED_SEQ:            'SYS_OP_CYCLED_SEQ';
SYS_OP_DECOMP:                'SYS_OP_DECOMP';
SYS_OP_DESCEND:               'SYS_OP_DESCEND';
SYS_OP_DISTINCT:              'SYS_OP_DISTINCT';
SYS_OP_DRA:                   'SYS_OP_DRA';
SYS_OP_DUMP:                  'SYS_OP_DUMP';
SYS_OP_DV_CHECK:              'SYS_OP_DV_CHECK';
SYS_OP_ENFORCE_NOT_NULL:      'SYS_OP_ENFORCE_NOT_NULL$';
SYSOPER:                      'SYSOPER';
SYS_OP_EXTRACT:               'SYS_OP_EXTRACT';
SYS_OP_GROUPING:              'SYS_OP_GROUPING';
SYS_OP_GUID:                  'SYS_OP_GUID';
SYS_OP_HASH:                  'SYS_OP_HASH';
SYS_OP_IIX:                   'SYS_OP_IIX';
SYS_OP_ITR:                   'SYS_OP_ITR';
SYS_OP_KEY_VECTOR_CREATE:     'SYS_OP_KEY_VECTOR_CREATE';
SYS_OP_KEY_VECTOR_FILTER_LIST: 'SYS_OP_KEY_VECTOR_FILTER_LIST';
SYS_OP_KEY_VECTOR_FILTER:     'SYS_OP_KEY_VECTOR_FILTER';
SYS_OP_KEY_VECTOR_SUCCEEDED:  'SYS_OP_KEY_VECTOR_SUCCEEDED';
SYS_OP_KEY_VECTOR_USE:        'SYS_OP_KEY_VECTOR_USE';
SYS_OP_LBID:                  'SYS_OP_LBID';
SYS_OP_LOBLOC2BLOB:           'SYS_OP_LOBLOC2BLOB';
SYS_OP_LOBLOC2CLOB:           'SYS_OP_LOBLOC2CLOB';
SYS_OP_LOBLOC2ID:             'SYS_OP_LOBLOC2ID';
SYS_OP_LOBLOC2NCLOB:          'SYS_OP_LOBLOC2NCLOB';
SYS_OP_LOBLOC2TYP:            'SYS_OP_LOBLOC2TYP';
SYS_OP_LSVI:                  'SYS_OP_LSVI';
SYS_OP_LVL:                   'SYS_OP_LVL';
SYS_OP_MAKEOID:               'SYS_OP_MAKEOID';
SYS_OP_MAP_NONNULL:           'SYS_OP_MAP_NONNULL';
SYS_OP_MSR:                   'SYS_OP_MSR';
SYS_OP_NICOMBINE:             'SYS_OP_NICOMBINE';
SYS_OP_NIEXTRACT:             'SYS_OP_NIEXTRACT';
SYS_OP_NII:                   'SYS_OP_NII';
SYS_OP_NIX:                   'SYS_OP_NIX';
SYS_OP_NOEXPAND:              'SYS_OP_NOEXPAND';
SYS_OP_NTCIMG:                'SYS_OP_NTCIMG$';
SYS_OP_NUMTORAW:              'SYS_OP_NUMTORAW';
SYS_OP_OIDVALUE:              'SYS_OP_OIDVALUE';
SYS_OP_OPNSIZE:               'SYS_OP_OPNSIZE';
SYS_OP_PAR_1:                 'SYS_OP_PAR_1';
SYS_OP_PARGID_1:              'SYS_OP_PARGID_1';
SYS_OP_PARGID:                'SYS_OP_PARGID';
SYS_OP_PAR:                   'SYS_OP_PAR';
SYS_OP_PART_ID:               'SYS_OP_PART_ID';
SYS_OP_PIVOT:                 'SYS_OP_PIVOT';
SYS_OP_R2O:                   'SYS_OP_R2O';
SYS_OP_RAWTONUM:              'SYS_OP_RAWTONUM';
SYS_OP_RDTM:                  'SYS_OP_RDTM';
SYS_OP_REF:                   'SYS_OP_REF';
SYS_OP_RMTD:                  'SYS_OP_RMTD';
SYS_OP_ROWIDTOOBJ:            'SYS_OP_ROWIDTOOBJ';
SYS_OP_RPB:                   'SYS_OP_RPB';
SYS_OPTLOBPRBSC:              'SYS_OPTLOBPRBSC';
SYS_OP_TOSETID:               'SYS_OP_TOSETID';
SYS_OP_TPR:                   'SYS_OP_TPR';
SYS_OP_TRTB:                  'SYS_OP_TRTB';
SYS_OPTXICMP:                 'SYS_OPTXICMP';
SYS_OPTXQCASTASNQ:            'SYS_OPTXQCASTASNQ';
SYS_OP_UNDESCEND:             'SYS_OP_UNDESCEND';
SYS_OP_VECAND:                'SYS_OP_VECAND';
SYS_OP_VECBIT:                'SYS_OP_VECBIT';
SYS_OP_VECOR:                 'SYS_OP_VECOR';
SYS_OP_VECXOR:                'SYS_OP_VECXOR';
SYS_OP_VERSION:               'SYS_OP_VERSION';
SYS_OP_VREF:                  'SYS_OP_VREF';
SYS_OP_VVD:                   'SYS_OP_VVD';
SYS_OP_XMLCONS_FOR_CSX:       'SYS_OP_XMLCONS_FOR_CSX';
SYS_OP_XPTHATG:               'SYS_OP_XPTHATG';
SYS_OP_XPTHIDX:               'SYS_OP_XPTHIDX';
SYS_OP_XPTHOP:                'SYS_OP_XPTHOP';
SYS_OP_XTXT2SQLT:             'SYS_OP_XTXT2SQLT';
SYS_OP_ZONE_ID:               'SYS_OP_ZONE_ID';
SYS_ORDERKEY_DEPTH:           'SYS_ORDERKEY_DEPTH';
SYS_ORDERKEY_MAXCHILD:        'SYS_ORDERKEY_MAXCHILD';
SYS_ORDERKEY_PARENT:          'SYS_ORDERKEY_PARENT';
SYS_PARALLEL_TXN:             'SYS_PARALLEL_TXN';
SYS_PATHID_IS_ATTR:           'SYS_PATHID_IS_ATTR';
SYS_PATHID_IS_NMSPC:          'SYS_PATHID_IS_NMSPC';
SYS_PATHID_LASTNAME:          'SYS_PATHID_LASTNAME';
SYS_PATHID_LASTNMSPC:         'SYS_PATHID_LASTNMSPC';
SYS_PATH_REVERSE:             'SYS_PATH_REVERSE';
SYS_PXQEXTRACT:               'SYS_PXQEXTRACT';
SYS_RAW_TO_XSID:              'SYS_RAW_TO_XSID';
SYS_RID_ORDER:                'SYS_RID_ORDER';
SYS_ROW_DELTA:                'SYS_ROW_DELTA';
SYS_SC_2_XMLT:                'SYS_SC_2_XMLT';
SYS_SYNRCIREDO:               'SYS_SYNRCIREDO';
SYSTEM_DEFINED:               'SYSTEM_DEFINED';
SYSTEM:                       'SYSTEM';
SYSTIMESTAMP:                 'SYSTIMESTAMP';
SYS_TYPEID:                   'SYS_TYPEID';
SYS_UMAKEXML:                 'SYS_UMAKEXML';
SYS_XMLANALYZE:               'SYS_XMLANALYZE';
SYS_XMLCONTAINS:              'SYS_XMLCONTAINS';
SYS_XMLCONV:                  'SYS_XMLCONV';
SYS_XMLEXNSURI:               'SYS_XMLEXNSURI';
SYS_XMLGEN:                   'SYS_XMLGEN';
SYS_XMLI_LOC_ISNODE:          'SYS_XMLI_LOC_ISNODE';
SYS_XMLI_LOC_ISTEXT:          'SYS_XMLI_LOC_ISTEXT';
SYS_XMLINSTR:                 'SYS_XMLINSTR';
SYS_XMLLOCATOR_GETSVAL:       'SYS_XMLLOCATOR_GETSVAL';
SYS_XMLNODEID_GETCID:         'SYS_XMLNODEID_GETCID';
SYS_XMLNODEID_GETLOCATOR:     'SYS_XMLNODEID_GETLOCATOR';
SYS_XMLNODEID_GETOKEY:        'SYS_XMLNODEID_GETOKEY';
SYS_XMLNODEID_GETPATHID:      'SYS_XMLNODEID_GETPATHID';
SYS_XMLNODEID_GETPTRID:       'SYS_XMLNODEID_GETPTRID';
SYS_XMLNODEID_GETRID:         'SYS_XMLNODEID_GETRID';
SYS_XMLNODEID_GETSVAL:        'SYS_XMLNODEID_GETSVAL';
SYS_XMLNODEID_GETTID:         'SYS_XMLNODEID_GETTID';
SYS_XMLNODEID:                'SYS_XMLNODEID';
SYS_XMLT_2_SC:                'SYS_XMLT_2_SC';
SYS_XMLTRANSLATE:             'SYS_XMLTRANSLATE';
SYS_XMLTYPE2SQL:              'SYS_XMLTYPE2SQL';
SYS_XQ_ASQLCNV:               'SYS_XQ_ASQLCNV';
SYS_XQ_ATOMCNVCHK:            'SYS_XQ_ATOMCNVCHK';
SYS_XQBASEURI:                'SYS_XQBASEURI';
SYS_XQCASTABLEERRH:           'SYS_XQCASTABLEERRH';
SYS_XQCODEP2STR:              'SYS_XQCODEP2STR';
SYS_XQCODEPEQ:                'SYS_XQCODEPEQ';
SYS_XQCON2SEQ:                'SYS_XQCON2SEQ';
SYS_XQCONCAT:                 'SYS_XQCONCAT';
SYS_XQDELETE:                 'SYS_XQDELETE';
SYS_XQDFLTCOLATION:           'SYS_XQDFLTCOLATION';
SYS_XQDOC:                    'SYS_XQDOC';
SYS_XQDOCURI:                 'SYS_XQDOCURI';
SYS_XQDURDIV:                 'SYS_XQDURDIV';
SYS_XQED4URI:                 'SYS_XQED4URI';
SYS_XQENDSWITH:               'SYS_XQENDSWITH';
SYS_XQERRH:                   'SYS_XQERRH';
SYS_XQERR:                    'SYS_XQERR';
SYS_XQESHTMLURI:              'SYS_XQESHTMLURI';
SYS_XQEXLOBVAL:               'SYS_XQEXLOBVAL';
SYS_XQEXSTWRP:                'SYS_XQEXSTWRP';
SYS_XQEXTRACT:                'SYS_XQEXTRACT';
SYS_XQEXTRREF:                'SYS_XQEXTRREF';
SYS_XQEXVAL:                  'SYS_XQEXVAL';
SYS_XQFB2STR:                 'SYS_XQFB2STR';
SYS_XQFNBOOL:                 'SYS_XQFNBOOL';
SYS_XQFNCMP:                  'SYS_XQFNCMP';
SYS_XQFNDATIM:                'SYS_XQFNDATIM';
SYS_XQFNLNAME:                'SYS_XQFNLNAME';
SYS_XQFNNM:                   'SYS_XQFNNM';
SYS_XQFNNSURI:                'SYS_XQFNNSURI';
SYS_XQFNPREDTRUTH:            'SYS_XQFNPREDTRUTH';
SYS_XQFNQNM:                  'SYS_XQFNQNM';
SYS_XQFNROOT:                 'SYS_XQFNROOT';
SYS_XQFORMATNUM:              'SYS_XQFORMATNUM';
SYS_XQFTCONTAIN:              'SYS_XQFTCONTAIN';
SYS_XQFUNCR:                  'SYS_XQFUNCR';
SYS_XQGETCONTENT:             'SYS_XQGETCONTENT';
SYS_XQINDXOF:                 'SYS_XQINDXOF';
SYS_XQINSERT:                 'SYS_XQINSERT';
SYS_XQINSPFX:                 'SYS_XQINSPFX';
SYS_XQIRI2URI:                'SYS_XQIRI2URI';
SYS_XQLANG:                   'SYS_XQLANG';
SYS_XQLLNMFRMQNM:             'SYS_XQLLNMFRMQNM';
SYS_XQMKNODEREF:              'SYS_XQMKNODEREF';
SYS_XQNILLED:                 'SYS_XQNILLED';
SYS_XQNODENAME:               'SYS_XQNODENAME';
SYS_XQNORMSPACE:              'SYS_XQNORMSPACE';
SYS_XQNORMUCODE:              'SYS_XQNORMUCODE';
SYS_XQ_NRNG:                  'SYS_XQ_NRNG';
SYS_XQNSP4PFX:                'SYS_XQNSP4PFX';
SYS_XQNSPFRMQNM:              'SYS_XQNSPFRMQNM';
SYS_XQPFXFRMQNM:              'SYS_XQPFXFRMQNM';
SYS_XQ_PKSQL2XML:             'SYS_XQ_PKSQL2XML';
SYS_XQPOLYABS:                'SYS_XQPOLYABS';
SYS_XQPOLYADD:                'SYS_XQPOLYADD';
SYS_XQPOLYCEL:                'SYS_XQPOLYCEL';
SYS_XQPOLYCSTBL:              'SYS_XQPOLYCSTBL';
SYS_XQPOLYCST:                'SYS_XQPOLYCST';
SYS_XQPOLYDIV:                'SYS_XQPOLYDIV';
SYS_XQPOLYFLR:                'SYS_XQPOLYFLR';
SYS_XQPOLYMOD:                'SYS_XQPOLYMOD';
SYS_XQPOLYMUL:                'SYS_XQPOLYMUL';
SYS_XQPOLYRND:                'SYS_XQPOLYRND';
SYS_XQPOLYSQRT:               'SYS_XQPOLYSQRT';
SYS_XQPOLYSUB:                'SYS_XQPOLYSUB';
SYS_XQPOLYUMUS:               'SYS_XQPOLYUMUS';
SYS_XQPOLYUPLS:               'SYS_XQPOLYUPLS';
SYS_XQPOLYVEQ:                'SYS_XQPOLYVEQ';
SYS_XQPOLYVGE:                'SYS_XQPOLYVGE';
SYS_XQPOLYVGT:                'SYS_XQPOLYVGT';
SYS_XQPOLYVLE:                'SYS_XQPOLYVLE';
SYS_XQPOLYVLT:                'SYS_XQPOLYVLT';
SYS_XQPOLYVNE:                'SYS_XQPOLYVNE';
SYS_XQREF2VAL:                'SYS_XQREF2VAL';
SYS_XQRENAME:                 'SYS_XQRENAME';
SYS_XQREPLACE:                'SYS_XQREPLACE';
SYS_XQRESVURI:                'SYS_XQRESVURI';
SYS_XQRNDHALF2EVN:            'SYS_XQRNDHALF2EVN';
SYS_XQRSLVQNM:                'SYS_XQRSLVQNM';
SYS_XQRYENVPGET:              'SYS_XQRYENVPGET';
SYS_XQRYVARGET:               'SYS_XQRYVARGET';
SYS_XQRYWRP:                  'SYS_XQRYWRP';
SYS_XQSEQ2CON4XC:             'SYS_XQSEQ2CON4XC';
SYS_XQSEQ2CON:                'SYS_XQSEQ2CON';
SYS_XQSEQDEEPEQ:              'SYS_XQSEQDEEPEQ';
SYS_XQSEQINSB:                'SYS_XQSEQINSB';
SYS_XQSEQRM:                  'SYS_XQSEQRM';
SYS_XQSEQRVS:                 'SYS_XQSEQRVS';
SYS_XQSEQSUB:                 'SYS_XQSEQSUB';
SYS_XQSEQTYPMATCH:            'SYS_XQSEQTYPMATCH';
SYS_XQSTARTSWITH:             'SYS_XQSTARTSWITH';
SYS_XQSTATBURI:               'SYS_XQSTATBURI';
SYS_XQSTR2CODEP:              'SYS_XQSTR2CODEP';
SYS_XQSTRJOIN:                'SYS_XQSTRJOIN';
SYS_XQSUBSTRAFT:              'SYS_XQSUBSTRAFT';
SYS_XQSUBSTRBEF:              'SYS_XQSUBSTRBEF';
SYS_XQTOKENIZE:               'SYS_XQTOKENIZE';
SYS_XQTREATAS:                'SYS_XQTREATAS';
SYS_XQ_UPKXML2SQL:            'SYS_XQ_UPKXML2SQL';
SYS_XQXFORM:                  'SYS_XQXFORM';
SYS_XSID_TO_RAW:              'SYS_XSID_TO_RAW';
SYS_ZMAP_FILTER:              'SYS_ZMAP_FILTER';
SYS_ZMAP_REFRESH:             'SYS_ZMAP_REFRESH';
TABLE_LOOKUP_BY_NL:           'TABLE_LOOKUP_BY_NL';
TABLESPACE_NO:                'TABLESPACE_NO';
TABLESPACE:                   'TABLESPACE';
TABLES:                       'TABLES';
TABLE_STATS:                  'TABLE_STATS';
TABNO:                        'TABNO';
TAG:                          'TAG';
TANH:                         'TANH';
TAN:                          'TAN';
TBLORIDXPARTNUM:              'TBL$OR$IDX$PART$NUM';
TEMPFILE:                     'TEMPFILE';
TEMPLATE:                     'TEMPLATE';
TEMPORARY:                    'TEMPORARY';
TEMP_TABLE:                   'TEMP_TABLE';
TEST:                         'TEST';
TEXT:                         'TEXT';
THAN:                         'THAN';
TIMEZONE:                     'TIMEZONE';
TIMEZONE_OFFSET:              'TIMEZONE_OFFSET';
TIME_ZONE:                    'TIME_ZONE';
TIV_GB:                       'TIV_GB';
TIV_SSF:                      'TIV_SSF';
TO_ACLID:                     'TO_ACLID';
TO_BINARY_DOUBLE:             'TO_BINARY_DOUBLE';
TO_BINARY_FLOAT:              'TO_BINARY_FLOAT';
TO_BLOB:                      'TO_BLOB';
TO_CLOB:                      'TO_CLOB';
TO_DSINTERVAL:                'TO_DSINTERVAL';
TO_LOB:                       'TO_LOB';
TO_MULTI_BYTE:                'TO_MULTI_BYTE';
TO_NCHAR:                     'TO_NCHAR';
TO_NCLOB:                     'TO_NCLOB';
TOPLEVEL:                     'TOPLEVEL';
TO_SINGLE_BYTE:               'TO_SINGLE_BYTE';
TO_TIMESTAMP:                 'TO_TIMESTAMP';
TO_TIMESTAMP_TZ:              'TO_TIMESTAMP_TZ';
TO_TIME:                      'TO_TIME';
TO_TIME_TZ:                   'TO_TIME_TZ';
TO_YMINTERVAL:                'TO_YMINTERVAL';
TRACE:                        'TRACE';
TRACING:                      'TRACING';
TRACKING:                     'TRACKING';
TRANSFORM_DISTINCT_AGG:       'TRANSFORM_DISTINCT_AGG';
TRANSITIONAL:                 'TRANSITIONAL';
TRANSITION:                   'TRANSITION';
TRANSLATION:                  'TRANSLATION';
TRIGGERS:                     'TRIGGERS';
TRUNC:                        'TRUNC';
TRUSTED:                      'TRUSTED';
TRUST:                        'TRUST';
TUNING:                       'TUNING';
TX:                           'TX';
TYPES:                        'TYPES';
TZ_OFFSET:                    'TZ_OFFSET';
UB2:                          'UB2';
UBA:                          'UBA';
UCS2:                         'UCS2';
UID:                          'UID';
UNARCHIVED:                   'UNARCHIVED';
UNBOUND:                      'UNBOUND';
UNCONDITIONAL:                'UNCONDITIONAL';
UNDO:                         'UNDO';
UNDROP:                       'UNDROP';
UNIFORM:                      'UNIFORM';
UNISTR:                       'UNISTR';
UNLOAD:                       'UNLOAD';
UNLOCK:                       'UNLOCK';
UNMATCHED:                    'UNMATCHED';
UNNEST_INNERJ_DISTINCT_VIEW:  'UNNEST_INNERJ_DISTINCT_VIEW';
UNNEST_NOSEMIJ_NODISTINCTVIEW: 'UNNEST_NOSEMIJ_NODISTINCTVIEW';
UNNEST_SEMIJ_VIEW:            'UNNEST_SEMIJ_VIEW';
UNNEST:                       'UNNEST';
UNPACKED:                     'UNPACKED';
UNPLUG:                       'UNPLUG';
UNPROTECTED:                  'UNPROTECTED';
UNQUIESCE:                    'UNQUIESCE';
UNRECOVERABLE:                'UNRECOVERABLE';
UNRESTRICTED:                 'UNRESTRICTED';
UNSUBSCRIBE:                  'UNSUBSCRIBE';
UNUSABLE:                     'UNUSABLE';
UNUSED:                       'UNUSED';
UPDATABLE:                    'UPDATABLE';
UPDATEXML:                    'UPDATEXML';
UPD_INDEXES:                  'UPD_INDEXES';
UPD_JOININDEX:                'UPD_JOININDEX';
UPGRADE:                      'UPGRADE';
UPPER:                        'UPPER';
USABLE:                       'USABLE';
USAGE:                        'USAGE';
USE_ANTI:                     'USE_ANTI';
USE_CONCAT:                   'USE_CONCAT';
USE_CUBE:                     'USE_CUBE';
USE_HASH_AGGREGATION:         'USE_HASH_AGGREGATION';
USE_HASH_GBY_FOR_PUSHDOWN:    'USE_HASH_GBY_FOR_PUSHDOWN';
USE_HASH:                     'USE_HASH';
USE_HIDDEN_PARTITIONS:        'USE_HIDDEN_PARTITIONS';
USE_INVISIBLE_INDEXES:        'USE_INVISIBLE_INDEXES';
USE_MERGE_CARTESIAN:          'USE_MERGE_CARTESIAN';
USE_MERGE:                    'USE_MERGE';
USE_NL:                       'USE_NL';
USE_NL_WITH_INDEX:            'USE_NL_WITH_INDEX';
USE_PRIVATE_OUTLINES:         'USE_PRIVATE_OUTLINES';
USER_DATA:                    'USER_DATA';
USER_DEFINED:                 'USER_DEFINED';
USERENV:                      'USERENV';
USERGROUP:                    'USERGROUP';
USER_RECYCLEBIN:              'USER_RECYCLEBIN';
USERS:                        'USERS';
USER_TABLESPACES:             'USER_TABLESPACES';
USER:                         'USER';
USE_SEMI:                     'USE_SEMI';
USE_STORED_OUTLINES:          'USE_STORED_OUTLINES';
USE_TTT_FOR_GSETS:            'USE_TTT_FOR_GSETS';
USE_VECTOR_AGGREGATION:       'USE_VECTOR_AGGREGATION';
USE_WEAK_NAME_RESL:           'USE_WEAK_NAME_RESL';
USING_NO_EXPAND:              'USING_NO_EXPAND';
UTF16BE:                      'UTF16BE';
UTF16LE:                      'UTF16LE';
UTF32:                        'UTF32';
UTF8:                         'UTF8';
V1:                           'V1';
V2:                           'V2';
VALIDATION:                   'VALIDATION';
VALID_TIME_END:               'VALID_TIME_END';
VAR_POP:                      'VAR_POP';
VARRAYS:                      'VARRAYS';
VAR_SAMP:                     'VAR_SAMP';
VECTOR_READ_TRACE:            'VECTOR_READ_TRACE';
VECTOR_READ:                  'VECTOR_READ';
VECTOR_TRANSFORM_DIMS:        'VECTOR_TRANSFORM_DIMS';
VECTOR_TRANSFORM_FACT:        'VECTOR_TRANSFORM_FACT';
VECTOR_TRANSFORM:             'VECTOR_TRANSFORM';
VERIFIER:                     'VERIFIER';
VERIFY:                       'VERIFY';
VERSIONING:                   'VERSIONING';
VERSIONS_ENDSCN:              'VERSIONS_ENDSCN';
VERSIONS_ENDTIME:             'VERSIONS_ENDTIME';
VERSIONS_OPERATION:           'VERSIONS_OPERATION';
VERSIONS_STARTSCN:            'VERSIONS_STARTSCN';
VERSIONS_STARTTIME:           'VERSIONS_STARTTIME';
VERSIONS_XID:                 'VERSIONS_XID';
VIEW:                         'VIEW';
VIOLATION:                    'VIOLATION';
VIRTUAL:                      'VIRTUAL';
VISIBILITY:                   'VISIBILITY';
VISIBLE:                      'VISIBLE';
VOLUME:                       'VOLUME';
VSIZE:                        'VSIZE';
WALLET:                       'WALLET';
WEEKS:                        'WEEKS';
WEEK:                         'WEEK';
WHITESPACE:                   'WHITESPACE';
WIDTH_BUCKET:                 'WIDTH_BUCKET';
WITHOUT:                      'WITHOUT';
WITH_PLSQL:                   'WITH_PLSQL';
WRAPPED:                      'WRAPPED';
WRAPPER:                      'WRAPPER';
XDB_FASTPATH_INSERT:          'XDB_FASTPATH_INSERT';
XDB:                          'XDB';
X_DYN_PRUNE:                  'X_DYN_PRUNE';
XID:                          'XID';
XML2OBJECT:                   'XML2OBJECT';
XMLCDATA:                     'XMLCDATA';
XMLCOMMENT:                   'XMLCOMMENT';
XMLCONCAT:                    'XMLCONCAT';
XMLDIFF:                      'XMLDIFF';
XML_DML_RWT_STMT:             'XML_DML_RWT_STMT';
XMLEXISTS2:                   'XMLEXISTS2';
XMLINDEX:                     'XMLINDEX';
XMLINDEX_REWRITE_IN_SELECT:   'XMLINDEX_REWRITE_IN_SELECT';
XMLINDEX_REWRITE:             'XMLINDEX_REWRITE';
XMLINDEX_SEL_IDX_TBL:         'XMLINDEX_SEL_IDX_TBL';
XMLISNODE:                    'XMLISNODE';
XMLISVALID:                   'XMLISVALID';
XMLPATCH:                     'XMLPATCH';
XMLQUERYVAL:                  'XMLQUERYVAL';
XMLSCHEMA:                    'XMLSCHEMA';
XMLTRANSFORMBLOB:             'XMLTRANSFORMBLOB';
XMLTRANSFORM:                 'XMLTRANSFORM';
XMLTYPE:                      'XMLTYPE';
XPATHTABLE:                   'XPATHTABLE';
XS_SYS_CONTEXT:               'XS_SYS_CONTEXT';
XS:                           'XS';
XTRANSPORT:                   'XTRANSPORT';
YEARS:                        'YEARS';
ZONEMAP:                      'ZONEMAP';
VAR_:                         V A R '_';
COVAR_:                       C O V A R '_';
DECODE:                       'DECODE';
PROMPT:                       P R O M P T;
NVL:                          'NVL';

REGULAR_ID
    : (SIMPLE_LETTER) (SIMPLE_LETTER | '$' | '_' | '#' | '0'..'9')*
    ;

ZV
    : '@!' -> channel(HIDDEN)
    ;


UNSIGNED_INTEGER: UNSIGNED_INTEGER_FRAGMENT;
APPROXIMATE_NUM_LIT: FLOAT_FRAGMENT (('e'|'E') ('+'|'-')? (FLOAT_FRAGMENT | UNSIGNED_INTEGER_FRAGMENT))? (D | F)?;


//{ Rule #--- <CHAR_STRING> is a base for Rule #065 <char_string_lit> , it incorporates <character_representation>
//  and a superfluous subtoken typecasting of the "QUOTE"
CHAR_STRING
    : '\'' (~('\'' | '\r' | '\n') | '\'' '\'' | NEWLINE)* '\''
    ;
//}

// Perl-style quoted string, see Oracle SQL reference, chapter String Literals
CHAR_STRING_PERL    : Q ( QS_ANGLE | QS_BRACE | QS_BRACK | QS_PAREN /*| QS_OTHER*/) -> type(CHAR_STRING);
fragment QUOTE      : '\'' ;
fragment QS_ANGLE   : QUOTE '<' .*? '>' QUOTE ;
fragment QS_BRACE   : QUOTE '{' .*? '}' QUOTE ;
fragment QS_BRACK   : QUOTE '[' .*? ']' QUOTE ;
fragment QS_PAREN   : QUOTE '(' .*? ')' QUOTE ;

fragment
FLOAT_FRAGMENT
    : UNSIGNED_INTEGER* '.'? UNSIGNED_INTEGER+
    ;

fragment QS_OTHER_CH: ~('<' | '{' | '[' | '(' | ' ' | '\t' | '\n' | '\r');

fragment A: [aA];
fragment B: [bB];
fragment C: [cC];
fragment D: [dD];
fragment E: [eE];
fragment F: [fF];
fragment G: [gG];
fragment H: [hH];
fragment I: [iI];
fragment J: [jJ];
fragment K: [kK];
fragment L: [lL];
fragment M: [mM];
fragment N: [nN];
fragment O: [oO];
fragment P: [pP];
fragment Q: [qQ];
fragment R: [rR];
fragment S: [sS];
fragment T: [tT];
fragment U: [uU];
fragment V: [vV];
fragment W: [wW];
fragment X: [xX];
fragment Y: [yY];
fragment Z: [zZ];
fragment
SIMPLE_LETTER
    : 'a'..'z'
    | 'A'..'Z'
    ;

//  Rule #176 <DIGIT> was incorporated by <UNSIGNED_INTEGER>
//{ Rule #615 <UNSIGNED_INTEGER> - subtoken typecast in <EXACT_NUM_LIT>
fragment
UNSIGNED_INTEGER_FRAGMENT
    : ('0'..'9')+
    ;
//}

fragment
SPACE: [ \t];