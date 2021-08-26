%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
extern int yylex();
extern char *yystype;
void yyerror(char *);
char left[500];
char right[500];
int num1;
int num2;
int elsenum = 1;
int thennum = 1;
int loopnum = 1;
%}

%union {
  int number;
  char *str;
};

%token EQ
%token BEQ
%token WHILE
%token DO
%token ENDWHILE
%token IF
%token ENDIF
%token THEN
%token ELSE
%token LEQ
%token GEQ
%token GT
%token LT
%token NEQ
%token PLUS
%token MINUS
%token SEMI
%token NUM
%token VAR
%token JUNK
%start codeblock
%%

codeblock:    /*empty*/
              |
              expr codeblock
              ;

expr:         assignment
              |
              loop
              |
              ifstatement
              ;

assignment:   ls EQ value SEMI
              {printf("MOV %s%s", left, ", R1\n");}

ls:           VAR
              {strcpy(left, yylval.str);}

boolif:       bvalueL LT bvalueR
              {printf("BGE R3, elseb%d\n", elsenum);}
              |
              bvalueL LEQ bvalueR
              {printf("BGT R3, elseb%d\n", elsenum);}
              |
              bvalueL NEQ bvalueR
              {printf("BEQ R3, elseb%d\n", elsenum);}
              |
              bvalueL GT bvalueR
              {printf("BLE R3, elseb%d\n", elsenum);}
              |
              bvalueL GEQ bvalueR
              {printf("BLT R3, elseb%d\n", elsenum);}
              |
              bvalueL BEQ bvalueR
              {printf("BNE R3, elseb%d\n", elsenum);}

bvalueL:      NUM
              {num1 = yylval.number; printf("MOV R8, %d\n", num1);}
              |
              VAR
              {strcpy(left, yylval.str); printf("MOV R8, %s\n", left);}
              |
              bvalueL PLUS bvalueL1
              |
              bvalueL MINUS bvalueL2
              ;

bvalueL1:     NUM
              {num1 = yylval.number; printf("MOV R2, %d\n", num1); printf("ADD R8, R2\n");}
              |
              VAR
              {strcpy(left, yylval.str); printf("MOV R2, %s\n", right); printf("ADD R8, R2 \n");}

bvalueL2:     NUM
              {num2 = yylval.number; printf("MOV R2, %d\n", num1); printf("SUB R8, R2\n");}
              |
              VAR
              {strcpy(right, yylval.str); printf("MOV R2, %s\n", right); printf("SUB R8, R2 \n");}

bvalueR:      NUM
              {num2 = yylval.number; printf("MOV R3, %d\n", num2);}
              |
              VAR
              {strcpy(right, yylval.str); printf("MOV R3, %s\n", right);}
              |
              bvalueR PLUS bvalueR1
              |
              bvalueR MINUS bvalueR2
              ;

bvalueR1:     NUM
              {num2 = yylval.number; printf("MOV R4, %d\n", num2); printf("ADD R3, R4\n");}
              |
              VAR
              {strcpy(right, yylval.str); printf("MOV R4, %s\n", right); printf("ADD R3, R4\n");}

bvalueR2:     NUM
              {num2 = yylval.number; printf("MOV R4, %d\n", num2); printf("SUB R3, R4\n");}
              |
              VAR
              {strcpy(right, yylval.str); printf("MOV R4, %s\n", right); printf("SUB R3, R4\n");}

loop:         WHILE boolloop DO codeblock ENDWHILE SEMI
              {printf("JMP, reloop%d\n", loopnum); printf("loopb%d ", loopnum); loopnum++;}

boolloop:     bvalueL LT bvalueR
              {printf("reloop%d BGE R3, loopb%d\n", loopnum, loopnum);}
              |
              bvalueL LEQ bvalueR
              {printf("reloop%d BGT R3, loopb%d\n", loopnum, loopnum);}
              |
              bvalueL NEQ bvalueR
              {printf("reloop%d BEQ R3, loopb%d\n", loopnum, loopnum);}
              |
              bvalueL GT bvalueR
              {printf("reloop%d BLE R3, loopb%d\n", loopnum, loopnum);}
              |
              bvalueL GEQ bvalueR
              {printf("reloop%d BLT R3, loopb%d\n", loopnum, loopnum);}
              |
              bvalueL BEQ bvalueR
              {printf("reloop%d BNE R3, loopb%d\n", loopnum, loopnum);}

ifstatement:  IF boolif THEN codeblockt1 ELSE codeblocke ENDIF SEMI
              |
              IF boolif THEN codeblockt ENDIF SEMI
              ;

codeblockt:   expr codeblock
              {printf("elseb%d ", elsenum); elsenum++;}
              |
              /*empty*/
              ;

codeblockt1:  expr codeblock
              {printf("JMP thenb%d\n", thennum); printf("elseb%d ", elsenum); elsenum++;}
              |
              /*empty*/
              ;

codeblocke:   expr codeblock
              {printf("thenb%d ", thennum); thennum++;}
              |
              /*empty*/
              ;

value:        NUM
              {num1 = yylval.number; printf("MOV R1, %d\n", num1);}
              |
              VAR
              {strcpy(right, yylval.str); printf("MOV R1, %s\n", right);}
              |
              value PLUS value1
              |
              value MINUS value2
              ;

value1:       NUM
              {num1 = yylval.number; printf("MOV R2, %d\n", num1); printf("ADD R1, R2\n");}
              |
              VAR
              {strcpy(right, yylval.str); printf("MOV R2, %s\n", right); printf("ADD R1, R2 \n");}

value2:       NUM
              {num1 = yylval.number; printf("MOV R2, %d\n", num1); printf("SUB R1, R2\n");}
              |
              VAR
              {strcpy(right, yylval.str); printf("MOV R2, %s\n", right); printf("SUB R1, R2\n");}

%%
int main()
{
  yyparse();
}

void yyerror(char *msg){
  extern int line;
  fprintf(stderr,"Syntax error at line %d %s",line, "\n");
}
