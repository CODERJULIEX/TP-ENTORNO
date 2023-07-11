
# Utiliza la imagen base de Ubuntu
FROM ubuntu

# Instala las dependencias necesarias
RUN apt-get update && apt-get install -y curl imagemagick

# Copia los scripts al contenedor
COPY generar.sh descomprimir.sh procesar.sh comprimir.sh menu.sh /

# Establece permisos ejecutables para los scripts
RUN chmod +x /generar.sh /descomprimir.sh /procesar.sh /comprimir.sh /menu.sh

# Al iniciar el contenedor se ejecutara el menu
ENTRYPOINT ["/menu.sh"]

