#!/bin/sh

directorio=$(pwd)

ruta=$(zenity --file-selection --title="Seleccione el fichero")
var1=$(echo $?)

if [ $var1 = 1 ]; then
"$directorio/LinceMetadata.sh" 
else zenity --question --title="Está a punto de borrar todos los metadatos del fichero. ¿Está seguro?"
var2=$(echo $?)

	if [ $var2 = 1 ]; then
	"$directorio/LinceMetadata.sh"
	else exiftool -all= $ruta
	exiftool $ruta > "$directorio/lincemetadata.txt"
	zenity --title="Metadatos" --text-info --filename="$directorio/lincemetadata.txt"
	var3=$(echo $?)

		if [ $var3 = 0 ]; then
		"$directorio/LinceMetadata.sh"
		else "$directorio/LinceMetadata.sh"
		fi
	fi

fi
