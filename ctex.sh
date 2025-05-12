#!/bin/bash
set -e

# Verificación de herramientas necesarias
for tool in pdflatex makeindex biber makeglossaries; do
    if ! command -v "$tool" &> /dev/null; then
        echo "Error: '$tool' no está instalado o no está en el PATH."
        exit 1
    fi
done

KEEP_TEMP=false
mkdir -p build

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -keep) KEEP_TEMP=true ;;
        *) echo "Opción desconocida: $1" ;;
    esac
    shift
done

if [ ! -f main.tex ]; then
    echo "Error: main.tex no encontrado."
    exit 1
fi

# Primera compilación de pdflatex
pdflatex --shell-escape -output-directory=build main.tex

# Generación del índice con makeindex
makeindex  build build/main.idx

# Generación de glosarios
biber build/main
makeglossaries build/main

# Segunda compilación de pdflatex
pdflatex --shell-escape -output-directory=build main.tex

# Tercera compilación de pdflatex
pdflatex --shell-escape -output-directory=build main.tex

# Eliminar archivos temporales si no se mantiene
if [ "$KEEP_TEMP" = false ]; then
    find build/ -type f ! -name '*.pdf' -exec rm -f {} \;
    find build/ -type d -empty -exec rmdir {} \;
fi

# Verificación de errores comunes en el log
if grep -q "Undefined" build/main.log || grep -q "LaTeX Error" build/main.log; then
    echo "Errores detectados en el log de compilación:"
    grep -E "Undefined|LaTeX Error" build/main.log
    exit 1
fi



echo "Compilación completada sin errores críticos."
