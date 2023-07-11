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
LISTA_NOMBRES=../lista_nombres.txt

while IFS= read -r nombre
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
done < "$LISTA_NOMBRES"

cd ..
mkdir -p archivos
mv ./lista_nombres.txt ./archivos
mv ./lista_nombres_validos.txt ./archivos
mv ./lista_nombres_terminan_en_a.txt ./archivos
cp -r ./imagenes ./archivos
tar -cvf archivos.tar archivos

exit 0