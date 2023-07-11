#!/bin/bash
#Genera imágenes utilizando algún servicios web. Tener
#en cuenta que al descargar de una página conviene usar un sleep entre
#descarga y descarga para no saturar el servicio y evitar problemas. Se debe
#poder indicar por argumento cuantas imágenes generar y se deben asignar
#nombres de archivo al azar de una lista de nombres de personas. Luego
#se deben comprimir las imágenes, y generar un archivo con su suma de verificación.

mkdir -p "imagenes"									#creo la carperta imagenes [-p] para que de un error si la carpeta ya esta creada
cd "imagenes" 										#ingreso a la carpeta imagenes
wget https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv 	#dercargo el archvio de nombres
ARCHIVO="dict.csv"
for (( i = 0; i <$1; i++ )) 								#itero el numero de veces que ingreso el usuario
do
	LINEA=$((`echo $(($RANDOM%30686))` + `echo $(($RANDOM))` + `echo $(($RANDOM))`)) #genero un numero aleatorio entre 1 y la cantidad de lineas del archivo csv
	DATOS=$(sed -n "${LINEA}p" "$ARCHIVO") 						#lee lo que esta escrito es la linea aleatoria del archivo csv
	NOMBRE=$(echo "$DATOS" | awk -F ',' '{print $1}') 				#de esa linea se queda con lo que esta antes de la coma que es el nombre
	wget --default-page="$NOMBRE" https://thispersondoesnotexist.com 		#descarga una imagen de la pagina y le da como nombre de la imagen el nombre random
											#de la lista
	sleep 2s 									#sleep de 2 segundos para no saturar la pagina
done

rm -f "dict.csv" 									#elimino el archivo de nombres para que no aparezca con las imagenes
cd .. 											#vuelvo a la carpeta de donde estan los scripts
rm -f "suma_de_verificacion.txt" 							#elimino el archivo de la suma de verificaciones, si es que existe, para poder
											#actializarlo
find ./imagenes -type f -exec md5sum {} + >> suma_de_verificacion.txt 			#recorro todos los archivos regulares que hay dentro de la carpeta imagenes,
											#realizo el checksumde cada archivo de la carpero y lo agrego al final de archivo
 											#suma_de_verificacion.txt
tar -cvf imagenes.tar imagenes 								#comprimo la carpeta imagenes
exit 0
