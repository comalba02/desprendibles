#!/bin/bash

mostrar_ayuda() {
    echo "Uso: $0 [directorio]"
    echo " Descripción: Este script busca la palabra 'Empleado' en los archivos PDF del directorio especificado"
    echo " y renombra los archivos encontrados con la cedula suprimiendo los espacios en blanco"
    echo " Los archivos deben seguir el patrón 'pg_*.pdf'."
}

# Verificar si se pasó el argumento "--help"
if [[ "$1" == "--help" ]]; then
    mostrar_ayuda
    exit 0
fi

# Verificar si se proporciona un directorio como argumento
if [[ -z "$1" ]]; then
    directorio_actual="."
else
    directorio_actual="$1"
fi

# Bucle para iterar sobre los nombres de archivo
for archivo in "$directorio_actual"/pg_*.pdf; do
    if [[ -e "$archivo" ]]; then
        # Ejecutar el comando para cada archivo y obtener el resultado
        resultado=$(pdftotext "$archivo" - | grep -m 1 "Empleado" | cut -c 11-21 | tr -d ' ')
        # Renombrar el archivo con el resultado obtenido
        nuevo_nombre="${resultado}.pdf"
        mv "$archivo" "$directorio_actual/$nuevo_nombre"
    else
        echo "No se encontraron archivos PDF en el directorio especificado."
        exit 1
    fi
done
