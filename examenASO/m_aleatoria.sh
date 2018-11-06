#!/bin/bash
# Realizar un shell-script llamado “m_aleatoria.sh” que saque por pantalla una
# matriz de números generados aleatoriamente. Al script se le pasará dos
# números: el número de filas y el número de columnas.

if [ $# -ne 2 ]; then
  printf "\nError due to missing parameters. Exiting...\n"
  printf "\tUsage: ./m_aleatoria.sh rowNumber columNumber\n"
  exit 0
fi

for ((i=1; i<=$1; i++)); do
  for ((x=1; x<=$2; x++)); do
    randomNumber=$(echo $(( ( RANDOM % 10 ) + 1 )))
    printf "$randomNumber   "
  done
  printf "\n"
done
