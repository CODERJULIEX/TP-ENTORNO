#!/bin/bash

while true
do
	echo "1: Generar"
	echo "2: Descomprimir"
	echo "3: Procesar"
	echo "4: Comprimir"
	echo "5: Salir"
	echo "Seleccione una opcion: "
	read sal
	case $sal in
		1)
			echo "Has seleccionado generar"
			echo "Ingrese la cantidad de imagenes que desea generar"
			read IMAGENES
			VALIDACION="^[1-9]+$"
			until [[ $IMAGENES =~ $VALIDACION ]]
			do
				echo "Error: Ingrese una cantidad de imagenes valida"
				read IMAGENES
			done
			bash generar.sh $IMAGENES
			;;
		2)
			echo "Has seleccionado descomprimir "
			bash descomprimir.sh imagenes.tar suma_de_verificacion.txt
			;;
		3)
			echo "Has seleccionado procesar"
			bash procesar.sh
			;;
		4)
			echo "Has seleccionado comprimir"
			bash comprimir.sh
			;;
		5)
			echo "Has seleccionado salir. Haste luego"
			break
			;;
		*)
			echo "$sal no es una opcion valida"

	esac
done
