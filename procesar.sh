#!/bin/bash

# Se deberán recortar las imágenes a una resolución de 512*512 con alguna utilid>

# Directorio de las imágenes
directorio_imagenes="/ruta/a/tus/imagenes" #falta la ruta

# Recorrer los archivos del directorio
for archivo in "$directorio_imagenes"/*; do
  # Obtener el nombre base del archivo sin la ruta ni la extensión
  nombre_base=$(basename "$archivo" | cut -d. -f1)

  # Verificar si el nombre del archivo cumple con el patrón de una persona váli>
  if [[ $nombre_base =~ ^[A-Z][a-z]+ ]]; then
    # Ruta y nombre del archivo de salida
    archivo_salida="${directorio_imagenes}/${nombre_base}_recortada.jpg"

    # Recortar la imagen a una resolución de 512x512 usando ImageMagick
    convert "$archivo" -gravity center -resize 512x512+0+0 \
-extent 512x512 "$archivo_salida"

    echo "Imagen procesada: $archivo"
    echo "Imagen recortada guardada en: $archivo_salida"
  else
    echo "Archivo ignorado: $archivo"
  fi

done
