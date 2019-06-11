// WIP Pascal grammer

grammar Pascal;

prog
	: programblock varblock mainblock
	;

varblock
	: VAR (vardecl)*
	;

vardecl
	: ID COLON TYPE SEMICOLON
	;

mainblock
	: BEGIN STATEMENT MAINEND
	;

programblock
	: PROGRAM ID SEMICOLON
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

STATEMENT
	: 'run'
	;

SEMICOLON
	: ';'
	;

COLON
	: ':'
	;

VAR
	: 'var' | 'VAR'
	;

PROGRAM
	: 'program' | 'PROGRAM'
	;

TYPE
	: 'integer' | 'INTEGER' | 'real' | 'REAL' | 'char' | 'CHAR' | 'boolean' | 'BOOLEAN' | 'string' | 'STRING'
	;

ID
	: (UNDERSCORE|LC|UC|NUM)(LC|UC|NUM)*
	;

LC
	: ('a'..'z')
	;

UC
	: ('A'..'Z')
	;

NUM
	: ('0'..'9')
	;

UNDERSCORE
	: '_'
	;

// Need to add commments
WS : [ \t\r\n]+ -> skip; // skip spaces, tabs, newlines