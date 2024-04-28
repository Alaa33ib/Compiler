%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int line = 1;
int column = 1;
%}

%option noyywrap


%%
"program" {
    printf("PROGRAM\n");
    column += 7;
}

"beginprogram" {
    printf("BEGIN_PROGRAM\n");
    column += 12;
}

"endprogram" {
    printf("END_PROGRAM\n");
    column += 10;
}

"integer" {
    printf("INTEGER\n");
    column += 7;
}

"array" {
    printf("ARRAY\n");
    column += 5;
}

"of" {
    printf("OF\n");
    column += 2;
}

"if" {
    printf("IF\n");
    column += 2;
}

"then" {
    printf("THEN\n");
    column += 4;
}

"endif" {
    printf("ENDIF\n");
    column += 5;
}

"else" {
    printf("ELSE\n");
    column += 4;
}

"while" {
    printf("WHILE\n");
    column += 5;
}

"loop" {
    printf("LOOP\n");
    column += 4;
}

"endloop" {
    printf("ENDLOOP\n");
    column += 7;
}

"read" {
    printf("READ\n");
    column += 4;
}

"write" {
    printf("WRITE\n");
    column += 5;
}

"and" {
    printf("AND\n");
    column += 3;
}

"or" {
    printf("OR\n");
    column += 2;
}

"not" {
    printf("NOT\n");
    column += 3;
}

"true" {
    printf("TRUE\n");
    column += 4;
}

"false" {
    printf("FALSE\n");
    column += 5;
}

"-" {
    printf("SUB\n");
    column += 1;
}

"+" {
    printf("ADD\n");
    column += 1;
}

"*" {
    printf("MULT\n");
    column += 1;
}

"/" {
    printf("DIV\n");
    column += 1;
}

"=" {
    printf("EQ\n");
    column += 1;
}

"<>" {
    printf("NEQ\n");
    column += 2;
}

"<" {
    printf("LT\n");
    column += 1;
}

">" {
    printf("GT\n");
    column += 1;
}

"<=" {
    printf("LTE\n");
    column += 2;
}

">=" {
    printf("GTE\n");
    column += 2;
}


[a-zA-Z][a-zA-Z0-9_]{0,6}[a-zA-Z0-9]{0,1} {

    if (yytext[yyleng - 1] == '_') {
        printf("Error at line %d, column %d: identifier '%s' cannot end with an underscore.\n", line, column, yytext);
        exit(EXIT_FAILURE);
    }
    
    if (yytext[0] == '_' || isdigit(yytext[0])) {
        printf("Error at line %d, column %d: identifier '%s' must begin with a letter.\n", line, column, yytext);
        exit(EXIT_FAILURE);
    }
    
    printf("IDENT %s\n", yytext);
    column += yyleng;
}

[0-9]+ {
    printf("NUMBER %s\n", yytext);
    column += yyleng;
}


";" {
    printf("SEMICOLON\n");
    column += 1;
}

":" {
    printf("COLON\n");
    column += 1;
}

"," {
    printf("COMMA\n");
    column += 1;
}

"(" {
    printf("L_PAREN\n");
    column += 1;
}

")" {
    printf("R_PAREN\n");
    column += 1;
}

":=" {
    printf("ASSIGN\n");
    column += 2;
}

"--".* {
    /* Comment, ignore */
}

[\t ]+ {
    column += yyleng;
}

\n {
    line++;
    column = 1;
}

. {
    printf("Error: at line %d, column %d: unrecognized symbol '%s'\n", line, column, yytext);
    exit(EXIT_FAILURE);
}

%%


int main() {
    char codeFile[100];
    printf("Enter the code file");
    scanf("%s",codeFile);
    
    FILE *fileIn = fopen(codeFile, "r");
    if (!fileIn) {
        printf("Error: file not opened successfully.\n");
        return 1;
    }
    yyin = fileIn;
    yylex();
    fclose(fileIn);
    return 0;
}
