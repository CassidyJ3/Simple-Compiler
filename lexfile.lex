%{
#include <string.h>
#include <stdio.h>
#include "y.tab.h"
int line = 1;
%}
%%

"while"     {return WHILE  ;}
"do"        {return DO  ;}
"endwhile"  {return ENDWHILE  ;}
"if"        {return IF  ;}
"endif"     {return ENDIF  ;}
"then"      {return THEN  ;}
"else"      {return ELSE  ;}
"<"         {return LT  ;}
"<="        {return LEQ  ;}
">"         {return GT  ;}
">="        {return GEQ  ;}
"=="        {return BEQ  ;}
"<>"        {return NEQ  ;}
"="         {return EQ  ;}
"+"         {return PLUS  ;}
"-"         {return MINUS  ;}
";"         {return SEMI  ;}
[0-9]+      {yylval.number = atoi(yytext); return NUM  ;}
[a-z]+      {yylval.str = strdup(yytext); return VAR  ;}
" "         {;}
\t          {;}
\n          {line++;}
.           {return 1;}

%%
int lexmain()
{
  while(yylex());
}
