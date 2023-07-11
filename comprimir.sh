#!/bin/bash

IMAGENES="./imagenes"
if [ ! -e "$IMAGENES" ]
then
	echo "Error: no existe la carpeta imagenes"
	exit 1
fi
rm -f lista_nombres.txt
cd ./imagenes
touch ../lista_nombres.txt 

for i in *
do
	echo "$i" >> ../lista_nombres.txt
done

rm -f ../lista_nombres_validos.txt
touch ../lista_nombres_validos.txt
rm -f ../lista_nombres_terminan_en_a.txt
touch ../lista_nombres_terminan_en_a.txt

#Al establecer IFS vacio hace que trate toda la linea como una cadena sin dividirla y asignandole la variable nombre
while IFS= read -r nombre < "../lista_nombres.txt"
do
	ultimo_caracter="${nombre: -1}"
	if [[ $nombre =~ ^[A-Z][a-z]+ ]]
	then
		echo "$nombre" >> ../lista_nombres_validos.txt
	fi

	if [[ "$ultimo_caracter" == "a" ]]
	then
		echo "$nombre" >> ../lista_nombres_terminan_en_a.txt
	fi
done


cd ..
mkdir -p archivos
mv ./lista_nombres.txt ./archivos
mv ./lista_nombres_validos.txt ./archivos
mv ./lista_nombres_terminan_en_a.txt ./archivos
cp -r ./imagenes ./archivos
tar -cvf archivos.tar archivos

#crea un volumen montado y vincula el host con el contenedor, luego copia el archivo de una carpeta a otra
docker run -it -v "$(pwd)/archivos_datos:/archivos" ubuntu cp ./archivos/archivos.tar /archivos_datos/

echo " Archivo comprimido copiado en la carpeta archivos_datos del host "
exit 0
