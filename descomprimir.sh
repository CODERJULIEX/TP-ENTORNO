#!/bin/bash

#Se debe poder indicar por argumento dos archivos (uno
#con las imágenes comprimidas y otro con una suma de verificación). Si
#ocurrió algún error se debe informar al usuario de lo contrario se procede
#a descomprimir

if [ $# -ne 2 ]; then
  	echo "Error: Se requieren dos argumentos. Uso: $0 <imagenes.tar> <suma_de_verificacion.txt>"
  	exit 2
fi

if [ ! -f "$2" ]; then
  	echo "Error: El archivo de suma de verificación '$suma_de_verificaciones.txt' no existe."
  	exit 3
fi

ARCHIVO="$1"
SUMA_DE_VERIFICACION="./suma_de_verificacion.txt"
if [ -f "$ARCHIVO" ]
then
        echo "El archivo $ARCHIVO existe."
        tar -xvf "$ARCHIVO" 
        echo "El archivo $ARCHIVO fue descomprimido."
        find ./imagenes -type f -exec md5sum {} + | awk '{print $1}' | sort | md5sum > verificacion.txt
        VERIFICACION="./verificacion.txt"
        if cmp -s "$VERIFICACION" "$SUMA_DE_VERIFICACION" 
        then
                echo "suma de verificacion correcta"
        else
		echo "Error: Las sumas de verificaciones no coinciden"
		exit 4
	fi
else
        echo "El archivo $ARCHIVO no existe."
        exit 1
fi 

exit 0

