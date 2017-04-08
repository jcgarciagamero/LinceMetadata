#!/bin/bash

#Lince Metadata 1.0
#Author: José C. García Gamero.
#Date: 2017-01-14
#E-Mail: josecarlos@ims4c.com

directorio=$(pwd)
sudo chmod +x "$directorio/ExtractMetadata.sh"
sudo chmod +x "$directorio/ModifyMeta.sh"
sudo chmod +x "$directorio/delMeta.sh"

file=$(zenity --width=360 --height=320 --list --title "Lince Metadata 1.0" --column Descripción "Extraer Metadatos" "Modificar Metadatos" "Borrar Metadatos")
var1=$(echo $?)


if [ $var1 = 1 ]; then
	exit

elif [ "$file" = "Extraer Metadatos" ]; then
	"$directorio/ExtractMetadata.sh"

elif [ "$file" = "Modificar Metadatos" ]; then
	"$directorio/ModifyMeta.sh"

elif [ "$file" = "Borrar Metadatos" ]; then
	"$directorio/delMeta.sh"

fi
exit 



