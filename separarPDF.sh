#!/bin/bash

archivo=$1

# Función para mostrar el mensaje de ayuda
mostrar_ayuda() {
    echo "Uso: $0 <archivo>"
    echo "  Este script separa el PDF por paginas"
    echo "  Recibe 1 parametro, el archivo PDF"
    echo "  El archivo de entrada ejemplo: entrada.pdf"
    echo "  Se requiere tener instalado PDFtk"
}

# Comprueba si se proporciona el argumento --help
if [[ "$1" == "--help" ]]; then
    mostrar_ayuda
    exit 0
fi

pdftk $archivo burst
