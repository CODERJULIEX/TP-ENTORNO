#!/bin/bash

#generar un archivo con la lista de nombres de todas las imágenes 

cd /ruta/directorio_imagenes #falta ruta

lista_nombres={}

for i in *

do

lista_nombres.append(i)

done

# generar un archivo con la lista de nombres válidos.
