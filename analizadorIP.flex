%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
%}

DIGIT   [0-9]
OCTET_1 [1-9]
OCTET_2 {OCTET_1}{DIGIT}
OCTET_3 1{DIGIT}{DIGIT}
OCTET_4 2([0-4]{DIGIT}|5[0-5])
RANGE_10_100 1[0-9]|[2-9][0-9]|100

IP_OCTET   ({DIGIT}|{OCTET_2}|{OCTET_3}|{OCTET_4}|{RANGE_10_100})
PORT    [1-9][0-9]*
NEGATIVE_PORT -[0-9]+
%%

{IP_OCTET}("."{IP_OCTET}("."{IP_OCTET}("."{IP_OCTET}))) {
    printf("Dirección IP: %s\n", yytext);
    // Verificar si la dirección IP es privada
    if (esDireccionIPPrivada(yytext)) {
        printf("Es una dirección IP privada.\n");
    } else {
        printf("No es una dirección IP privada.\n");
    }
}

{IP_OCTET}("."{IP_OCTET}("."{IP_OCTET})) {
    printf("No se trata de una dirección IP: %s\n", yytext);
}

{PORT}  {    
    int puerto = atoi(yytext);
    if (puerto >= 1 && puerto <= 65535) {
        printf("Número de puerto: %d\n", puerto);
    } else {
        printf("Número de puerto inválido: %s\n", yytext);
    }
}

{NEGATIVE_PORT} {
    printf("Número de puerto inválido (negativo): %s\n", yytext);
}
.|\n    { /* Ignorar otros caracteres */ }

%%

int esDireccionIPPrivada(const char *ip) {
    // Función para verificar si la dirección IP es privada
    // Asumimos que la dirección IP es válida en este punto
    unsigned int ip1, ip2, ip3, ip4;
    sscanf(ip, "%u.%u.%u.%u", &ip1, &ip2, &ip3, &ip4);

    // Rangos de direcciones IP privadas
    if ((ip1 == 10) ||
        (ip1 == 172 && ip2 >= 16 && ip2 <= 31) ||
        (ip1 == 192 && ip2 == 168)) {
        return 1; // Es privada
    }

    return 0; // No es privada
}

int main() {
    yylex();
    return 0;
}

