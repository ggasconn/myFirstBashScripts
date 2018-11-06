#!/bin/bash

if ! [[ $USER == 'copiador' ]]; then
  printf "\nIncorrect user.\n"
  printf "'\tThe script only can be executed by 'copiador'"
  exit 1
fi

# Explicación
#Esta parte hace el backup estáticamente, es decir, la dirección que aparece era la que tenia
#el servidor remoto en el momento del examen. La copia es automatica puesto que usa certificados.
#Solo figura una dirección ya que solo disponía de una máquina virtual, en el caso de querer
#hacerlo con más máquina solo habría que cambiar la dirección en el comando abajo presente.
rsync -av --exclude 'prueba/' copiador@192.168.0.190:/home/versiones/bash_script /home/backup_BC

if [ $? -eq 0 ]; then
  printf "\n### Backup completed succesfully ###\n\n"
  exit 0
else
  print "\nThere was a error during th backup\n"
  exit 1
fi

# Explicación
#Esta opcion es más dinamica, pide la dirección del servidor/es del cual se van a hacer la copia.
#Puede que no funcionen los certificados y la copia solicite contraseña.
# while ! [[ $option == "n" ]]; do
#   read -p "Type in the address of the server you wanna copy from: " address
#   rsync -av --exclude 'prueba/' copiador@$address:/home/versiones/bash_script /home/backup_BC
#
#   if [ $? -eq 0 ]; then
#     printf "\n### Backup completed succesfully ###\n\n"
#   else
#     printf "\nThere was a error during th backup\n\n"
#   fi
#
#   read -p "Do you wanna do another backup (y/n)? " option
# done
