#!/bin/bash

#Se debe poder indicar por argumento dos archivos (uno con las imágenes comprimidas y otro con una suma de verificación). 
#Si ocurrió algún error se debe informar al usuario de lo contrario se procede a descomprimir.

#Verificar que se proporcionen dos argumentos
if [ $# -ne 2 ]; then
  echo "Error: Se requieren dos argumentos. Uso: $0 <imagenes.tar> <suma_de_verificaciones.txt>"
  exit 1
fi

#Obtener nombres de archivos de los argumentos
imagenes.tar=$1
suma_de_verificaciones.txt=$2

#Verificar la existencia de los archivos
if [ ! -f "$imagenes.tar" ]; then
  echo "Error: El archivo de imágenes comprimidas '$imagenes.tar' no existe."
  exit 1
fi

if [ ! -f "$suma_de_verificaciones.txt" ]; then
  echo "Error: El archivo de suma de verificación '$suma_de_verificaciones.txt' no existe."
  exit 1
fi

#Descomprimir las imágenes
tar -xf "$imagenes.tar" -C .

echo "Descompresión completada."
 

