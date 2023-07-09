#!/bin/bash
#descarga la cantidad de imagenes ingresada como argumento con el nombre imagen.jpg, tiene un sleep de 2seg entre cada descarga

if [ $# -eq 0 ]
then
	echo "ERROR no se ingreso ningun argumento"
	exit 1
else
	if [ $1 -le 0 ]
	then
		echo "ERROR ingrese una cantidad de imagenes valida"
		exit 2
	fi
fi
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
	wget --default-page="$NOMBRE" https://thispersondoesnotexist.com
	sleep 2s
done

rm -f "dict.csv"
cd ..
rm -f "suma_de_verificaciones.txt"
find ./imagenes -type f -exec md5sum {} + | awk '{print $1}' | sort | md5sum > suma_de_verificacion.txt
tar -czvf imagenes.tar imagenes 

exit 0
