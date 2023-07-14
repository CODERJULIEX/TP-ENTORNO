Para inicializar en contenedor y poder acceder al menú debe ingresar por consola los siguientes 2 comandos

sudo docker build -t tp_entorno .
sudo docker run -it -v "ruta absoluta"/TP-ENTORNO:/media tp_entorno

IMPORTANTE: asegúrese de reemplazar donde dice "ruta absoluta" por la ruta para llegar a la carpeta que clonó "TP-ENTORNO"
