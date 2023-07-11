#!/bin/bash

#Se debe poder indicar por argumento dos archivos (uno
#con las imágenes comprimidas y otro con una suma de verificación). Si
#ocurrió algún error se debe informar al usuario de lo contrario se procede
#a descomprimir

if [ $# -ne 2 ]; then							#se verifica que se pasen 2 argumentos 
  	echo "Error: Se requieren dos argumentos. Uso: $0 <imagenes.tar> <suma_de_verificacion.txt>"
  	exit 2
fi

if [ ! -f "$2" ]; then							#se verifica que exista el archivo suma de verificacion
  	echo "Error: El archivo de suma de verificación no existe."
  	exit 3
fi

IMAGENES="$1"								#se alamcena en la variable la ruta a la carpera de imagenes
SUMA_DE_VERIFICACION="./suma_de_verificacion.txt"			#se almacena en la variable la ruta al archivo suma de verificacion
if [ -e "$IMAGENES" ]							#se verifica que exista la carpeta imagenes
then
        tar -xvf "$IMAGENES" 						#se descomprime la carpeta
        echo "El archivo $IMAGENES fue descomprimido."
	rm -f "verificacion.txt"					#se elimina, si es que esxiste, el archivo de verificacion
        find ./imagenes -type f -exec md5sum {} + >> verificacion.txt	#se realiza la suma de verificacion de los archivos dentro de la carpeta imagenes y se guardan en 
									#verificacion.txt
        VERIFICACION="./verificacion.txt"
        if cmp -s "$VERIFICACION" "$SUMA_DE_VERIFICACION" 		#se corrobora que las sumas de verificaciones sean iguales
        then
                echo "Suma de verificacion correcta"
        else
		echo "Error: Las sumas de verificaciones no coinciden"
		exit 4
	fi
else
        echo "La carpeta $IMAGENES no existe."
        exit 1
fi 

exit 0

