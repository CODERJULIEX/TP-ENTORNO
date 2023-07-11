#!/bin/bash

IMAGENES="./imagenes"
if [ ! -e "$IMAGENES" ]							#verifica que exista la carpeta imagenes
then
	echo "Error: no existe la carpeta imagenes"
	exit 1
fi
cd ./imagenes
touch ../lista_nombres.txt 						#crea la nueva lista_nombres

for ARCHIVO in *							#itera sobre los nombre de los archivos
do
	echo "$ARCHIVO" >> ../lista_nombres.txt				#guarda los nombres en lista_nombres.txt
done

touch ../lista_nombres_validos.txt					#crea la nueva lista_nombres_validos
touch ../lista_nombres_terminan_en_a.txt				#crea la nueva lista_nombres_terminan_en_a
LISTA_NOMBRES="../lista_nombres.txt"

while IFS= read -r NOMBRE						#permanece en el bucle mientras NOMBRE toma como valor los nombres de la lista_nombres.txt
do

	ULTIMO_CARACTER="${NOMBRE: -1}"					#se guarda en una variable el ultimo caractes del nombre
	if [[ $NOMBRE =~ ^[A-Z][a-z]+ ]]				#verifica que el nombre cumpla con el patron para que sea un nombre valido
	then
		echo "$NOMBRE" >> ../lista_nombres_validos.txt		#se guarda el nombre valido en el archivo

	fi

	if [[ "$ULTIMO_CARACTER" == "a" ]]				#verifica que el nombre tenga como ultimo caracter a
	then
		echo "$NOMBRE" >> ../lista_nombres_terminan_en_a.txt  	#se guarda en nombre que termina con a
	fi

done < "$LISTA_NOMBRES"    						#recibe el archivo con la lista de nombres para leer

cd ..									#se sale de la carpeta imagenes
mkdir -p archivos							#se crea el directorio archivos
mv ./lista_nombres.txt ./archivos
mv ./lista_nombres_validos.txt ./archivos
mv ./lista_nombres_terminan_en_a.txt ./archivos				#se mueven todos las listas de nombres dentro de la carpeta archivos
cp -r ./imagenes ./archivos						#se copia la carpeta imagenes dentro de archivos
tar -cvf archivos.tar archivos						#se comprime la carpeta archivos

exit 0
