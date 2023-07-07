#!/bin/bash
#descarga la cantidad de imagenes ingresada como argumento con el nombre imagen.jpg, tiene un sleep de 2seg entre cada descarga
NAME='imagen.jpg'
for (( i = 0; i <$1; i++ ))
do
	wget --default-page=$NAME https://thispersondoesnotexist.com
	sleep 2s
done

exit 0
