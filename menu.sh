#!/bin/bash

while true
do
	echo "1: Generar imagenes"
	echo "2: Descargar"
	echo "3: Descomprimir"
	echo "4: Procesar"
	echo "5: Comprimir"
	echo "6: Salir"
	echo "Seleccione una opcion: "
	read sal
	case $sal in
		1)
			echo "Has seleccionado generar imagenes "
			echo "Ingrese la cantidad de imagenes que desea generar"
			read IMAGENES
			bash generar.sh $IMAGENES
			;;
		2)
			echo "Has seleccionado descargar"
			bash descargar.sh
			;;
		3)
			echo "Has seleccionado descomprimir "
			bash descomprimir.sh imagenes.tar suma_de_verificacion.txt
			;;
		4)
			echo "Has seleccionado procesar"
			bash procesar.sh
			;;
		5)
			echo "Has seleccionado comprimir"
			bash comprimir.sh
			;;
		6)
			echo "Has seleccionado salir. Haste luego"
			break
			;;
		*)
			echo "$sal no es una opcion valida"

	esac
done
