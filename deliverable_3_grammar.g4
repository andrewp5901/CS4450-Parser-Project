grammar deliverable_3_grammar;

//deliverable 1:
file_input
	: (NEWLINE | statement)*
	EOF
	;

statement
	: simple_statement
	| if_chain
	| while_statement
	| for_statement
	;

simple_statement
	: assignment
	| augmented_assignment
	;

assignment
	: NAME ASSIGNMENT expr
	;

augmented_assignment
	: NAME(PLUSEQUALS|MINUSEQUALS|TIMESEQUALS|DIVIDEEQUALS)expr
	;

expr
	: expr (PLUS|MINUS) expr
	| expr (TIMES|DIVIDE|PERCENT) expr
	| MINUS expr
	| atom
	;

atom
	: INT
	| FLOAT
	| STRING
	| TRUE
	| FALSE
	| NAME
	| list
	| LEFTPARENTHESIS expr RIGHTPARENTHESIS
	;

list
	: LEFTBRACKET(expr(COMMA expr)*)?RIGHTBRACKET
	;


//deliverable 2:

comparison_op
	: EQUAL
	| NOTEQUAL
	| GREATEROREQUAL
	| GREATER
	| LESSOREQUAL
	| LESS
	;

comparison: expr (comparison_op expr)?;

if_chain
	: IF condition COLON NEWLINE block
	(ELIF condition COLON NEWLINE block)*
	(ELSE COLON NEWLINE block)?
	;

block: statement (NEWLINE statement)* (NEWLINE)?;

condition: or_test;

or_test: and_test (OR and_test)*;

and_test: not_test (AND not_test)*;

not_test
	: NOT not_test
	| comparison
	| LEFTPARENTHESIS (condition ) RIGHTPARENTHESIS
	;

//deliverable 3

while_statement
	: WHILE condition COLON NEWLINE block
	;

for_statement
	: FOR NAME IN for_iterable COLON NEWLINE block
	;

for_iterable
	: NAME
	| RANGE LEFTPARENTHESIS (expr COMMA expr) RIGHTPARENTHESIS
	| RANGE LEFTPARENTHESIS (expr COMMA expr COMMA expr)RIGHTPARENTHESIS
	;




TRUE: 'True';
FALSE: 'False';

IF: 'if';
ELIF: 'elif';
ELSE: 'else';

AND: 'and';
OR: 'or';
NOT: 'not';


WHILE: 'while';
FOR: 'for';
IN: 'in';
RANGE: 'range';

FLOAT: DIGITS'.'DIGITS;
INT: DIGITS;

NAME: [_A-Za-z] [_A-Za-z0-9]*;

STRING
	: '"' (~["\r\n])* '"'
	| '\'' (~['\r\n])* '\''
	;

ASSIGNMENT: '=';
PLUSEQUALS: '+=';
MINUSEQUALS: '-=';
TIMESEQUALS: '*=';
DIVIDEEQUALS: '/=';
PLUS: '+';
MINUS: '-';
TIMES: '*';
DIVIDE: '/';
PERCENT: '%';

EQUAL: '==';
NOTEQUAL: '!=';
GREATEROREQUAL: '>=';
GREATER: '>';
LESSOREQUAL: '<=';
LESS: '<';
COLON: ':';
LEFTPARENTHESIS: '(';
RIGHTPARENTHESIS: ')';
LEFTBRACKET: '[';
RIGHTBRACKET: ']';
COMMA: ',';
fragment DIGITS: [0-9]+;

WHITESPACE: (' ' | '\t' | '\r')+ -> skip;
NEWLINE: '\r'? '\n';

COMMENT
	: '#' ~[\r\n]* ->skip
	;

fragment TRIPLE_QUOTES: '\'\'\'';
ML_COMMENT
	:TRIPLE_QUOTES(.|'\n'|'\r')*? TRIPLE_QUOTES ->skip
	;
