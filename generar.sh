#!/bin/bash
#descarga la cantidad de imagenes ingresada como argumento con el nombre imagen.jpg, tiene un sleep de 2seg entre cada descarga

mkdir -p "imagenes"
cd "imagenes"
rm -f "dict.csv"
wget https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv
ARCHIVO="dict.csv"
for (( i = 0; i <$1; i++ ))
do
	LINEA=$((`echo $(($RANDOM%30686))` + `echo $(($RANDOM))` + `echo $(($RANDOM))`))
	DATOS=$(sed -n "${LINEA}p" "$ARCHIVO")
	NOMBRE=$(echo "$DATOS" | awk -F ',' '{print $1}')
	echo $NOMBRE
	wget --default-page="$NOMBRE" https://thispersondoesnotexist.com
	sleep 2s
done

rm -f "dict.csv"
cd ..
touch suma_de_verificaciones.txt
md5sum imagenes >> suma_de_verificaciones.txt
tar -czvf imagenes.tar imagenes 

exit 0
