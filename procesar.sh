#!/bin/bash

#Se deberán recortar las imágenes a una resolución de 512*512 con alguna utilidad como imagemagick. 
#Solamente deben procesarse aquellas imágenes que tengan nombres de personas válidos.
#Entiéndase por nombres de personas válidos a cualquier combinación de palabras que empiecen con un letra mayúscula y sigan por minúsculas.

IMAGENES="./imagenes"
if [ ! -e "$IMAGENES" ] 								#corrobora que exista la carpeta imagenes 
then
        echo "Error: no existe la carpeta imagenes"
        exit 1
fi

for ARCHIVO in "$IMAGENES"/*								#recorre los archivos del directorio
do
	 NOMBRE=$(basename "$ARCHIVO" | cut -d. -f1)					#obtiene el nombre base del archivo sin la ruta ni la extensión
  	if [[ $NOMBRE =~ ^[A-Z][a-z]+ ]]						#verifica que el nombre del archivo cumple con el patrón de una persona válida
	then
    		mkdir -p imagenes_recortadas						#crea el directorio para guardar las imagenes
    		ARCHIVO_RECORTADO="./imagenes_recortadas/${NOMBRE}_recortada.jpg"	#guarda en la variable la ruta y el nombre del la imagen recortada
    		convert "$ARCHIVO" -gravity center -resize 512x512+0+0 -extent 512x512 "$ARCHIVO_RECORTADO" #recorta la imagen a una resolución de 512x512
    		echo "Imagen procesada: $ARCHIVO"
    	else
    		echo "Archivo ignorado: $ARCHIVO"
  	fi
done

exit 0
