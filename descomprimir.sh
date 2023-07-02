!/bin/bash

#Deberá verificar que exista el archivo que se descargó o se creó con los scripts anteriores y descomprimirlo (definir un nombre común para >

archivo="nombre_del_archivo.tar.gz"

#Verificar si el archivo existe
if [ -f "$archivo" ]; then
        echo "El archivo $archivo existe."

        #Descomprimir el archivo
        tar -xzf "$archivo" -C
directorio_destino

        echo "El archivo $archivo fue descomprimido."
else
        echo "El archivo $archivo no existe."
fi 

