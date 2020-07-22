grammar PlSqlComment;

swallow_to_semi
    : ~( ';' )+
    ;

compilation_unit
    : unit_statement* EOF
    ;

unit_statement
    : comment
    ;


comment
    : SINGLE_LINE_COMMENT
    | MULTI_LINE_COMMENT
    ;

//{ Rule #097 <COMMENT>
SINGLE_LINE_COMMENT
    : '--' ( ~('\r' | '\n') )* (NEWLINE|EOF) -> channel(2)
    ;

//:'--' ( ~('\r' | '\n') )* (NEWLINE|EOF) -> channel(HIDDEN)
MULTI_LINE_COMMENT
    : '/*' .*? '*/' -> channel(2)
    ;

fragment
NEWLINE: '\r'? '\n';
