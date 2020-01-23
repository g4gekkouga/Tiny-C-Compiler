/* 
Name : Pericherla Amshumaan Varma
Roll No : 17CS30025
Assignment No : 4
File : Parser Code, .yfile
*/
%{
int yylex();
void yyerror(const char*);
%}

%token-table
%nonassoc "then"
%nonassoc "else"
%token IDENTIFIER CONSTANT STRING_LITERAL ENUMERATION-CONSTANT
%start translation-unit
%define parse.error verbose

%%

primary-expression : IDENTIFIER {printf("primary-expression    ------>    IDENTIFIER \n");}
                   	|CONSTANT   {printf("primary-expression    ------>    CONSTANT \n");}
			        |STRING_LITERAL {printf("primary-expression    ------>    STRING_LITERAL \n");}
			        |'('expression')' {printf("primary-expression    ------>    (expression) \n");}
			        ;

postfix-expression : primary-expression  {printf("postfix-expression    ------>    primary-expression\n");}
                   	| postfix-expression '[' expression ']'  {printf("postfix-expression    ------>    primary-expression \n");}
			        | postfix-expression '(' argument-expression-list ')' {printf("postfix-expression    ------>    postfix-expression(argument-expression-list) \n");}
			        | postfix-expression '(' ')' {printf("postfix-expression    ------>    postfix-expression() \n");}
			        | postfix-expression '.' IDENTIFIER  {printf("postfix-expression    ------>    postfix-expression.IDENTIFIER \n");}
			        | postfix-expression "->" IDENTIFIER {printf("postfix-expression    ------>    postfix-expression -> IDENTIFIER \n");}
			        | postfix-expression "++" {printf("postfix-expression    ------>    postfix-expression++ \n");}
//			        | '(' type-name ')' '{' initializer-list '}' {printf("postfix-expression    ------>    (type-name){initializer-list} \n");}
//			        | '(' type-name ')' '{' initializer-list ',' '}' {printf("postfix-expression    ------>    (type-name){initializer-list,} \n");}
			        ;

argument-expression-list : assignment-expression  {printf("argument-expression-list    ------>    assignment-expression\n");}
                         | argument-expression-list ',' assignment-expression  {printf("argument-expression-list    ------>    argument-expression-list,assignment-expression \n");}
                         ;

unary-expression : 	postfix-expression   {printf("unary-expression    ------>    postfix-expression\n");}
                 	| "++" unary-expression {printf("unary-expression    ------>    ++unary-expression\n");}
		        	| "--"  unary-expression {printf("unary-expression    ------>    --unary-expression\n");}
		        	| unary-operator cast-expression {printf("unary-expression    ------>    unary-operator cast-expression\n");}
		        	| "sizeof" unary-expression {printf("unary-expression    ------>    sizeof unary-expression\n");}
//		        	| "sizeof" '(' type-name ')' {printf("unary-expression    ------>    sizeof(type-name)\n");}
		        	;

unary-operator : '&' {printf("unary-operator    ------>    &\n");}
               	| '*' {printf("unary-operator    ------>    *\n");}
		        | '+' {printf("unary-operator    ------>    +\n");}
		        | '-' {printf("unary-operator    ------>    -\n");}
		        ;

cast-expression : unary-expression {printf("cast-expression    ------>    unary-expression\n");}
//				 | '(' type-name ')' cast-expression {printf("cast-expression    ------>    (type-name)cast-expression\n");}	
				;

multiplicative-expression : cast-expression {printf("multiplicative-expression    ------>    cast-expression\n");}
							| multiplicative-expression '*' cast-expression {printf("multiplicative-expression    ------>    multiplicative-expression * cast-expression \n");}
							| multiplicative-expression '/' cast-expression {printf("multiplicative-expression    ------>    multiplicative-expression / cast-expression\n");}
							| multiplicative-expression '%' cast-expression {printf("multiplicative-expression    ------>    multiplicative-expression %% cast-expression\n");}
							;

additive-expression : multiplicative-expression {printf("additive-expression    ------>    multiplicative-expression\n");}
                    | additive-expression '+' multiplicative-expression {printf("additive-expression    ------>    additive-expression + multiplicative-expression\n");}
        			| additive-expression '-' multiplicative-expression {printf("additive-expression    ------>    additive-expression - multiplicative-expression\n");}
        			;

shift-expression : additive-expression {printf("shift-expression    ------>    additive-expression\n");}
                 | shift-expression "<<" additive-expression {printf("shift-expression    ------>    shift-expression << additive-expression\n");}
        		 | shift-expression ">>" additive-expression {printf("shift-expression    ------>    shift-expression >> additive-expression\n");}
        		 ;

relational-expression : shift-expression {printf("relational-expression    ------>    shift-expression\n");}
                      | relational-expression '<' shift-expression  {printf("relational-expression    ------>    relational-expression < shift-expression\n");}
			          | relational-expression '>' shift-expression  {printf("relational-expression    ------>    relational-expression > shift-expression\n");}
			          | relational-expression "<=" shift-expression  {printf("relational-expression    ------>    relational-expression <= shift-expression\n");}
			          | relational-expression ">=" shift-expression {printf("relational-expression    ------>    relational-expression >= shift-expression\n");}
			          ;

equality-expression : relational-expression {printf("equality-expression    ------>    relational-expression\n");}
                    | equality-expression "==" relational-expression  {printf("equality-expression    ------>    equality-expression == relational-expression\n");}
        			| equality-expression "!=" relational-expression  {printf("equality-expression    ------>    equality-expression != relational-expression\n");}
        			;

AND-expression : equality-expression {printf("AND-expression    ------>    equality-expression\n");}
               | AND-expression '&' equality-expression {printf("AND-expression    ------>    AND-expression & equality-expression\n");}
               ;

exclusive-OR-expression : AND-expression  {printf("exclusive-OR-expression    ------>    AND-expression\n");}
                        | exclusive-OR-expression '^' AND-expression  {printf("exclusive-OR-expression    ------>    exclusive-OR-expression ^ AND-expression\n");}
                        ;

inclusive-OR-expression : exclusive-OR-expression {printf("inclusive-OR-expression    ------>    exclusive-OR-expression\n");}
                        | inclusive-OR-expression '|' exclusive-OR-expression {printf("inclusive-OR-expression    ------>    inclusive-OR-expression | exclusive-OR-expression \n");}
                        ;

logical-AND-expression : inclusive-OR-expression  {printf("logical-AND-expression    ------>    inclusive-OR-expression\n");}
                       | logical-AND-expression "&&" inclusive-OR-expression {printf("logical-AND-expression    ------>    logical-AND-expression && inclusive-OR-expression\n");}
                       ;

logical-OR-expression : logical-AND-expression {printf("logical-OR-expression    ------>    logical-AND-expression\n");}
                      | logical-OR-expression "||" logical-AND-expression {printf("logical-OR-expression    ------>    logical-OR-expression || logical-AND-expression\n");}
                      ;

conditional-expression : logical-OR-expression {printf("conditional-expression    ------>    logical-OR-expression\n");}
                       | logical-OR-expression '?' expression ':' conditional-expression {printf("conditional-expression    ------>    logical-OR-expression ? expression : conditional-expression\n");}

assignment-expression : conditional-expression {printf("assignment-expression    ------>    conditional-expression\n");}
                      | unary-expression assignment-operator assignment-expression {printf("assignment-expression    ------>    unary-expression assignment-operator assignment-expression \n");}
                      ;

assignment-operator : '=' {printf("assignment-operator    ------>    =\n");}
					 | "*=" {printf("assignment-operator    ------>    *=\n");} 
					 | "/=" {printf("assignment-operator    ------>    /=\n");} 
					 | "%=" {printf("assignment-operator    ------>    %%=\n");} 
					 | "+=" {printf("assignment-operator    ------>    +=\n");} 
					 | "-=" {printf("assignment-operator    ------>    -=\n");} 
					 | "<<=" {printf("assignment-operator    ------>    <<=\n");} 
					 | ">>=" {printf("assignment-operator    ------>    >>=\n");} 
					 | "&=" {printf("assignment-operator    ------>    &=\n");}
					 | "^=" {printf("assignment-operator    ------>    ^=\n");}
					 | "|=" {printf("assignment-operator    ------>    |=\n");}
					 ;

expression : assignment-expression {printf("expression    ------>    assignment-expression\n");}
           | expression ',' assignment-expression {printf("expression    ------>    expression , assignment-expression\n");}
           ;

CONSTANT-expression : conditional-expression {printf("CONSTANT-expression    ------>    conditional-expression\n");} ;

declaration : declaration-specifiers init-declarator-list ';' {printf("declaration    ------>    declaration-specifiers init-declarator-list ;\n");}
              | declaration-specifiers ';' {printf("declaration    ------>    declaration-specifiers ;\n");}
              ;

declaration-specifiers : type-specifier declaration-specifiers {printf("declaration-specifiers    ------>    type-specifier declaration-specifiers\n");}
                       | type-specifier {printf("declaration-specifiers    ------>    type-specifier\n");}
                       ;

init-declarator-list : init-declarator  {printf("init-declarator-list    ------>    init-declarator\n");}
                     | init-declarator-list ',' init-declarator {printf("init-declarator-list    ------>    init-declarator-list , init-declarator\n");}
                     ;

init-declarator : declarator {printf("init-declarator    ------>    declarator\n");}
                | declarator '=' initializer {printf("init-declarator    ------>    declarator = initializer\n");}
                ;

/*
storage-class-specifier : "extern" {printf("type-specifier    ------>    extern\n");}
				| "static" {printf("type-specifier    ------>    static\n");}
				| "short" {printf("type-specifier    ------>    short\n");}
				| "auto"  {printf("type-specifier    ------>    auto\n");}
				| "register"  {printf("type-specifier    ------>    register\n");}
				;
*/

type-specifier : "void" {printf("type-specifier    ------>    void\n");}
				| "char" {printf("type-specifier    ------>    char\n");}
				| "short" {printf("type-specifier    ------>    short\n");}
				| "int"  {printf("type-specifier    ------>    int\n");}
				| "long"  {printf("type-specifier    ------>    long\n");}
				| "float"  {printf("type-specifier    ------>    float\n");}
				| "double"  {printf("type-specifier    ------>    double\n");}
				| "Matrix"  {printf("type-specifier    ------>    Matrix\n");}
				| "signed"  {printf("type-specifier    ------>    signed\n");}
				| "unsigned" {printf("type-specifier    ------>    unsigned\n");}
				| "Bool" {printf("type-specifier    ------>    Bool\n");}
				 ;

/*
specifier-qualifier-list : type-specifier specifier-qualifier-list {printf("specifier-qualifier-list    ------>    type-specifier specifier-qualifier-list \n");}
						  | type-qualifier specifier-qualifier-list {printf("specifier-qualifier-list    ------>    type-qualifier specifier-qualifier-list \n");}
						  ;
*/

/*
enu-specifier     : "enum" IDENTIFIER '{' enumerator-list '}' {printf("enu-specifier       ------>    enum IDENTIFIER { enumerator-list } \n");}
				| "enum" IDENTIFIER '{' enumerator-list ',' '}' {printf("enu-specifier       ------>    enum IDENTIFIER { enumerator-list , } \n");}
				| "enum" IDENTIFIER {printf("enu-specifier       ------>    enum IDENTIFIER \n");}
				 ;
*/

/*
enumerator-list : enumerator {printf("enumerator-list    ------>    enumerator \n");}
				| enumerator-list ',' enumerator {printf("enumerator-list    ------>    enumerator-list , enumerator \n");}
				;
*/

/*
enumerator : ENUMERATION-CONSTANT {printf("enumerator    ------>    ENUMERATION-CONSTANT \n");}
		   | ENUMERATION-CONSTANT '=' CONSTANT-expression {printf("enumerator    ------>    ENUMERATION-CONSTANT = CONSTANT-expression \n");}
		   ;
*/

/*
type-qualifier : "const" {printf("type-qualifier    ------>    const \n");}
			   | "restrict" {printf("type-qualifier    ------>    restrict \n");}
			   | "volatile" {printf("type-qualifier    ------>    volatile \n");}
			   ;
*/

/*
function-specifier : "inline" {printf("function-specifier    ------>    inline \n");}
				   ;
*/


declarator : direct-declarator {printf("declarator    ------>    direct-declarator\n");}
		   | pointer direct-declarator {printf("declarator    ------>    pointer direct-declarator \n");}
		   ;

direct-declarator : IDENTIFIER {printf("direct-declarator    ------>    IDENTIFIER\n");}
				  | '(' declarator ')' {printf("direct-declarator    ------>    (declarator)\n");}
				  | direct-declarator '[' assignment-expression ']' {printf("direct-declarator    ------>    direct-declarator [assignment-expression]\n");}
				  | direct-declarator '[' ']'   {printf("direct-declarator    ------>    direct-declarator []\n");}
				  | direct-declarator '(' parameter-type-list ')' {printf("direct-declarator    ------>    direct-declarator (parameter-type-list)\n");}
				  | direct-declarator '(' IDENTIFIER-list ')' {printf("direct-declarator    ------>    direct-declarator (IDENTIFIER-list)\n");}
				  | direct-declarator '(' ')' {printf("direct-declarator    ------>    direct-declarator ()\n");}
				  ;
pointer : '*'  {printf("pointer    ------>    *\n");}
		 | '*' pointer {printf("pointer    ------>    * pointer\n");}
		 ;

/*
type-qualifier-list : type-qualifier {print("type-qualifier-list    ------>    type-qualifier \n");}
                    | type-qualifier-list type-qualifier {print("type-qualifier-list    ------>    type-qualifier-list type-qualifier \n");}
                    ;
*/

parameter-type-list : parameter-list {printf("parameter-type-list    ------>    parameter-list\n");};

parameter-list : parameter-declaration {printf("parameter-list    ------>    parameter-declaration\n");}
			   | parameter-list ',' parameter-declaration {printf("parameter-list    ------>    parameter-list ',' parameter-declaration\n");}
			   ;

parameter-declaration : declaration-specifiers declarator {printf("parameter-declaration-specifiers declarator\n");}
					  | declaration-specifiers {printf("parameter-declaration-specifiers\n");}
					  ;

IDENTIFIER-list : IDENTIFIER  {printf("IDENTIFIER-list    ------>    IDENTIFIER \n");}
				| IDENTIFIER-list ',' IDENTIFIER  {printf("IDENTIFIER-list    ------>    IDENTIFIER-list , IDENTIFIER \n");}
				;

/*
type-name : specifier-qualifier-list {printf("type-name    ------>    specifier-qualifier-list \n");}
          ;
*/

initializer : assignment-expression {printf("initializer    ------>    assignment-expression\n");}
			| '{' initializer-list  '}' {printf("initializer    ------>    {initializer-list }\n");}
			| '{' initializer-list ',' '}' {printf("initializer    ------>    {initializer-list , }\n");}
			;


initializer-list  : initializer  {printf("initializer-list     ------>    initializer\n");}
				| designation initializer {printf("initializer-list     ------>    designation initializer\n");}
				| initializer-list  ',' initializer {printf("initializer-list     ------>     initializer-list  , initializer\n");}
				;

designation : designator-list '='   {printf("designation    ------>    designator-list =\n");} ;

designator-list : designator  {printf("designator-list    ------>    designator\n");}
				| designator-list designator {printf("designator-list    ------>    designator-list designator\n");}
				;

designator : '[' CONSTANT-expression ']' {printf("designator    ------>    [CONSTANT-expression]\n");}
		   | '.' IDENTIFIER {printf("designator    ------>    . IDENTIFIER\n");}
		   ;

statement : labeled-statement  {printf("statement    ------>    labeled-statement\n");}
		  | compound-statement {printf("statement    ------>    compound-statement\n");}
		  | expression-statement {printf("statement    ------>    expression-statement\n");}
		  | selection-statement	{printf("statement    ------>    selection-statement\n");}
		  | iteration-statement	{printf("statement    ------>    iteration-statement\n");}
		  | jump-statement	{printf("statement    ------>    jump-statement\n");}
		  ;

labeled-statement : IDENTIFIER ':' statement {printf("labeled-statement    ------>    IDENTIFIER : statement\n");}
				  | "case" CONSTANT-expression ':' statement {printf("labeled-statement    ------>    case CONSTANT-expression : statement\n");}
				  | "default" ':' statement {printf("labeled-statement    ------>    default statement\n");}
				  ;

compound-statement : '{' '}'  {printf("compound-statement : {}\n");}
				   | '{' block-item-list '}'	{printf("compound-statement : {block-item-list}\n");}
				   ;

block-item-list : block-item {printf("block-item-list    ------>    block-item\n");}
				| block-item-list block-item {printf("block-item-list    ------>    block-item-list block-item\n");}
				;

block-item : declaration {printf("block-item    ------>    declaration\n");}
		   | statement {printf("block-item    ------>    statement\n");}
		   ;

expression-statement : ';' {printf("expression-statement    ------>    ;\n");}
					 | expression ';' {printf("expression-statement    ------>    expression ;\n");}
					 ;

selection-statement : "if" '(' expression ')' statement    %prec "then"  {printf("selection-statement    ------>    if (expression) statement\n");}
					| "if" '(' expression ')' statement "else" statement {printf("selection-statement    ------>    if (expression) statement else statement\n");}
					| "switch" '(' expression ')' statement {printf("selection-statement    ------>    switch (expression) statement\n");}
					;


iteration-statement : "while" '(' expression ')' statement  {printf("iteration-statement    ------>    while (expression) statement \n");}
					| "do" statement "while" '(' expression ')' ';' {printf("iteration-statement    ------>    do statement while (expression);\n");}
					| "for" '(' expression  ';' expression  ';' expression  ')' statement {printf("iteration-statement    ------>    for (expression  ; expression  ; expression ) statement\n");}
					| "for" '(' declaration expression ';' expression  ')' statement {printf("iteration-statement    ------>    for(declaration expression ; expression ) statement\n");}
					;

jump-statement : "goto" IDENTIFIER ';' {printf("jump-statement    ------>    goto IDENTIFIER ;\n");}
			   | "continue" ';' {printf("jump-statement    ------>    continue;\n");}
			   | "break" ';' {printf("jump-statement    ------>    break;\n");}
			   | "return" expression  ';' {printf("jump-statement    ------>    return expression  ;\n");}
			   ;

translation-unit : external-declarationit {printf("translation-unit    ------>    external-declarationit\n");}
				 | translation-unit external-declarationit {printf("translation-unit    ------>    translation-unit external-declarationit\n");}
				 ;

external-declarationit : function-definition  {printf("external-declarationit    ------>    function-definition\n");}
					 | declaration {printf("external-declarationit    ------>    definition\n");}
					 ;

function-definition : declaration-specifiers declarator declaration-list compound-statement {printf("function-definition    ------>    declaration-specifiers declarator declaration-list compound-statement\n");}
 					| declaration-specifiers declarator compound-statement {printf("function-definition    ------   declaration-specifiers declarator compound-statement\n");}
 					;

declaration-list : declaration {printf("declaration-list    ------>    declaration\n");}
				 | declaration-list declaration {printf("declaration-list    ------>    declaration-list declaration\n");}
				 ;

%%

void yyerror(const char* s){
    printf("\nThere is an Error : %s\n",s);
    exit(-1);
}