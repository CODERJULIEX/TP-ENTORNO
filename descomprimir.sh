#!/bin/bash

#Se debe poder indicar por argumento dos archivos (uno
#con las imágenes comprimidas y otro con una suma de verificación). Si
#ocurrió algún error se debe informar al usuario de lo contrario se procede
#a descomprimir.


ARCHIVO="$1"

if [ -f "$ARCHIVO" ]
then
        echo "El archivo $archivo existe."
        tar -xvf "$ARCHIVO" 
        echo "El archivo $archivo fue descomprimido."
else
        echo "El archivo $archivo no existe."
fi 

