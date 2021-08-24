# Simple-Compiler
The compiler program utilizes LEX and YACC to validate code for a simplistic coding language and outputs MIPS assembly code that accomplishes the purposes of the code block. If a code block is invalid, the program provides equivalent code leading up to the first error, which it identifies the line of.
LEX converts input into tokens for use by the YACC portion of the program.
YACC processes the tokens to see if they form a syntactically correct block of code and utilizes small blocks of C code to print equivalent MIPS assembly code.
