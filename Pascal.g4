// WIP Pascal grammer

grammar Pascal;

prog
	: programblock varblock funcprocblock mainblock
	;

varblock
	: (VAR (vardecl)*)?
	;

vardecl
	: ID COLON TYPE SEMICOLON
	;

mainblock
	: BEGIN STATEMENT MAINEND
	;

block
	: BEGIN STATEMENT END SEMICOLON
	;

programblock
	: PROGRAM ID SEMICOLON
	;

functionheader
	: FUNC ID LEFTPAREN explparams RIGHTPAREN COLON TYPE SEMICOLON
	;

// NEED TO ADD VARIABLE DECLARATION TO PROCEDURES AND THE REFERENCE VARIABLE
procedureheader
	: PROC ID LEFTPAREN explparams RIGHTPAREN SEMICOLON
	;

explparams
	: ((((ID)(COMMA ID)*) COLON TYPE SEMICOLON)*(((ID)(COMMA ID)*) COLON TYPE))?
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

STATEMENT
	: 'stmt'
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

LEFTPAREN
	: '('
	;

RIGHTPAREN
	: ')'
	;

// Need to add commments
WS : [ \t\r\n]+ -> skip; // skip spaces, tabs, newlines
COMMENT : ('{' (.)*? '}') -> skip;