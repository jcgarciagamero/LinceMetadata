#!/bin/bash

#Lince Metadata 1.0
#Author: José C. García Gamero.
#Date: 2017-01-14

directorio=$(pwd)

ruta=$(zenity --file-selection --title="Seleccione el fichero")
var1=$(echo $?)

if [ $var1 = 1 ]; then
"$directorio/LinceMetadata.sh" 
else etiqueta=$(zenity --entry --entry-text="Nombre de etiqueta" --text="Copyright, Software...")
var2=$(echo $?)

	if [ $var2 = 1 ]; then
	"$directorio/LinceMetadata.sh"
	else info=$(zenity --entry --entry-text="Dato de la etiqueta" --text="@elblogdelroot, Adobe Acrobat...")
	var3=$(echo $?)
	
		if [ $var3 = 1 ]; then
		"$directorio/LinceMetadata.sh"
		else exiftool -exif:$etiqueta="$info" "$ruta"

		exiftool "$ruta" > "$directorio/lincemetadata.txt"
		zenity --title="Metadatos" --text-info --filename="$directorio/lincemetadata.txt"
		var3=$(echo $?)

			if [ $var3 = 0 ]; then
			"$directorio/LinceMetadata.sh"
			else "$directorio/LinceMetadata.sh"
			fi
		fi

	fi

fi



