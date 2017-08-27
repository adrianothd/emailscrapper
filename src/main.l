/* ADRIANO TENORIO        RA.: 154468 */

/* Email scrapper
 *
 * Este programa recebe uma frase, identifica os
 * emails no formato válido, e faz a impressão
 * dos mesmos na saída.
 */


%{
#include <stdio.h>
%}

AA    [A-Za-z0-9]
BB    [A-Za-z0-9_.-]
EMAIL_VALIDO    {AA}+{BB}*{AA}+@{AA}+([.]{AA}+)*
EMAIL_INVALIDO    [_.-]*{EMAIL_VALIDO}[_-]*
%%

{EMAIL_VALIDO} {printf("%s\n", yytext);} // imprimir emails validos
[[:space:]] ; // ignorar espaços
. ; // ignorar ponto
{EMAIL_INVALIDO} { // ignorar emails invalidos
}

%%

int main() {
  yylex();
  return 0;
}

