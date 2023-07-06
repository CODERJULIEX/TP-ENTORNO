#!/bin/bash

sal=0

while true ; do
echo "1: Generar imagenes"
echo "2: Descargar"
echo "3: Descomprimir"
echo "4: Procesar"
echo "5: Comprimir"
echo "6: Salir"

	read -p "Seleccione una opcion:  " sal

	case $sal in
		1) echo " Has seleccionado generar imagenes ";;
		2) echo "Has seleccionado descargar";;
		3) echo "Has seleccionado descomprimir ";;
		4) echo "Has seleccionado procesar";;
		5) echo "Has seleccionado comprimir";;
		6) echo "Has seleccionado salir. Haste luego"
		break;;
		*) echo $sal "no es una opcion"

	esac
done
