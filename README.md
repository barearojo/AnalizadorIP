# AnalizadorIP
Analizador léxico realizado en flex para poder ver IP con sus respectivos puertos
El código presentado es una implementación en Flex, un generador de analizadores léxicos, diseñado para analizar cadenas que representan direcciones IP y números de puerto. El propósito principal del programa es validar y proporcionar información detallada sobre la naturaleza de las direcciones IP y los puertos ingresados. El programa también incluye una función para determinar si una dirección IP dada es privada o no, utilizando los rangos estándar de direcciones IP privadas.

A través de expresiones regulares y reglas de traducción, el código identifica patrones específicos en la entrada y realiza acciones correspondientes, como imprimir la dirección IP, verificar su privacidad, o evaluar la validez del número de puerto.

## Uso

1. **Compilación del Analizador:**
    ```bash
    flex analizadorIP.flex        # Compila el archivo flex
    gcc lex.yy.c -o analizadorIP  # Compila el programa generado por flex
    ```

2. **Ejecución del Analizador con un Archivo de Entrada:**
    ```bash
    ./analizadorIP < trafico.txt   # Ejecuta el analizador léxico con el archivo de entrada trafico.txt
    ```

Estas instrucciones permiten generar el ejecutable `analizadorIP` a partir del código flex compilado y luego ejecutar el programa utilizando el archivo 'trafico.txt'



