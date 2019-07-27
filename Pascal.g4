// WIP Pascal grammer

grammar Pascal;

prog
	: programblock varblock funcprocblock mainblock
	;

varblock
	: (VAR (vardecl)*)?
	;

vardecl
	: ident COLON type SEMICOLON
	;

mainblock
	: BEGIN (statement)* MAINEND
	;

block
	: BEGIN statement END SEMICOLON
	;

programblock
	: ('program' | 'PROGRAM') ident SEMICOLON
	;

functionheader
	: FUNC ident LEFTPAREN explparams RIGHTPAREN COLON type SEMICOLON
	;

procedureheader
	: PROC ident LEFTPAREN explparams RIGHTPAREN SEMICOLON
	;

explparams
	: ((((ident)(COMMA ident)*) COLON type SEMICOLON)*(((ident)(COMMA ident)*) COLON type))?
	;

function
	: functionheader block
	;

procedure
	: procedureheader varblock block
	;

funcprocblock
	: (function|procedure)*
	;

FUNC
	: 'FUNCTION'
	;

PROC
	: 'PROCEDURE'
	;

BEGIN
	: 'begin' | 'BEGIN'
	;
END
	: 'end' | 'END'
	;

MAINEND
	: 'end.' | 'END.'
	;

expr
	: addexpr | divexpr | minexpr | multexpr | ident | operand
	;

operand
	: literal | ident
	;

addexpr
 	: operand ADD expr
	;

divexpr
	: operand DIVIDE expr
	;

minexpr
	: operand MINUS expr
	;

multexpr
	: operand MULTIPLY expr
	;

ADD
	: '+'
	;

MINUS
	: '-'
	;

DIVIDE
	: '/'
	;

MULTIPLY
	: '*'
	;

statement
	: cmpdstmt | assgnment | proccal
	;

cmpdstmt
	: BEGIN (statement)* END
	;

assgnment
	: ident assop expr SEMICOLON
	;

proccal
	: ident SEMICOLON
	;

assop
	: MINEQ | PLUSEQ | DIVEQ | MULTEQ | ASSIGN
	;

MINEQ
	: '-='
	;

PLUSEQ
	: '+='
	;

DIVEQ
	: '/='
	;

MULTEQ
	: '*='
	;

ASSIGN
	: ':='
	;

SEMICOLON
	: ';'
	;

COLON
	: ':'
	;

COMMA
	: ','
	;

VAR
	: 'var' | 'VAR'
	;

type
	:  INT | REAL | CHAR | BOOL | STR
	;

INT
	: 'integer' | 'INTEGER'
	;

REAL
	: 'real' | 'REAL'
	;

CHAR
	: 'char' | 'CHAR'
	;

BOOL
	: 'boolean' | 'BOOLEAN'
	;

STR
	: 'string' | 'STRING'
	;

ident
	: ID
	;

ID
	: [a-zA-Z_][a-zA-Z0-9_]*
	;

LC
	: ('a'..'z')
	;

UC
	: ('A'..'Z')
	;

literal
	: INTVAL | REALVAL | CHARVAL | boolval | strval
	;

INTVAL
	: ('-')?[1-9][0-9]*
	;

REALVAL
	: [0-9]+ '.' [0-9]+
	;

CHARVAL
	: '\'' [a-zA-Z0-9] '\''
	;

boolval
	: TRUEVAL | FALSEVAL
	;

strval
	: '\'' (.)*? '\''
	;

TRUEVAL
	: 'true' | 'TRUE'
	;

FALSEVAL
	: 'false' | 'FALSE'
	;

UNDERSCORE
	: '_'
	;

LEFTPAREN
	: '('
	;

RIGHTPAREN
	: ')'
	;

APSTR
	: '\''
	;

WS : [ \t\r\n]+ -> skip; // skip spaces, tabs, newlines

OLDCOMM
	: ('(*' (.)*? '*)') -> skip
	;

TURBOCOMM
	: ('{' (.)*? '}') -> skip
	;

DELPHICOMM
	: ('//' (.)*? '\n') -> skip
	;
