/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    EQ = 258,
    BEQ = 259,
    WHILE = 260,
    DO = 261,
    ENDWHILE = 262,
    IF = 263,
    ENDIF = 264,
    THEN = 265,
    ELSE = 266,
    LEQ = 267,
    GEQ = 268,
    GT = 269,
    LT = 270,
    NEQ = 271,
    PLUS = 272,
    MINUS = 273,
    SEMI = 274,
    NUM = 275,
    VAR = 276,
    JUNK = 277
  };
#endif
/* Tokens.  */
#define EQ 258
#define BEQ 259
#define WHILE 260
#define DO 261
#define ENDWHILE 262
#define IF 263
#define ENDIF 264
#define THEN 265
#define ELSE 266
#define LEQ 267
#define GEQ 268
#define GT 269
#define LT 270
#define NEQ 271
#define PLUS 272
#define MINUS 273
#define SEMI 274
#define NUM 275
#define VAR 276
#define JUNK 277

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 17 "calc.yacc" /* yacc.c:1909  */

  int number;
  char *str;

#line 103 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
