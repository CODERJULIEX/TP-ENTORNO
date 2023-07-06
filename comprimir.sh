
#!/bin/bash

#generar un archivo con la lista de nombres de todas las imágenes 

cd /ruta/directorio_imagenes #falta ruta

touch lista_nombres.txt #como hago para que este archivo no me aparezca en la lista?

for i in *

do

echo i > lista_nombres.txt

done

# generar un archivo con la lista de nombres validos
# generar un archivo con el total de personas cuyo nombre finaliza con la letra a. 

touch lista_nombres_validos.txt

touch lista_nombres_terminan_en_a.txt

for nombre in lista_nombres.txt
	
do

	primer_caracter=${nombre:0:1}

	resto_caracteres=${nombre:1}
	
	ultimo_caracter=${nombre: -1}
	if [[ $primer_caracter == [[upper]] && $resto_caracteres == [[lower]] 

		echo nombre > lista_nombres_validos.txt

	fi

	if [[ $ultimo_caracter == a ]]
	
	echo nombre > lista_nombres_terminan_en_a.txt

	fi
done

#generar un archivo comprimido que incluya los archivos generados en los items anteriores y todas las imágenes. El archivo comprimido debe poder accederse desde fuera del contenedor.
