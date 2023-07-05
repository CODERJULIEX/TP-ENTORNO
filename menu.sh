#!/bin/bash 

sal=0 

while [ $sal -ne 6 ] ; do 
echo "1: Generar imagenes" 
echo "2: Descargar" 
echo "3: Descomprimir" 
echo "4: Procesar" 
echo "5: Comprimir" 
echo "6: Salir" 

read -p "Seleccione una opcion" sal 

case $sal in 
       1) echo "1"  
       ;; 
       2) echo "2" 
       ;; 
       3) echo "3" 
       ;; 
       4) echo "4" 
       ;; 
