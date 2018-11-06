#!/bin/bash
# #Realizar un shell-script llamado “repidos.sh” que acepte tres parámetros:
# A. el primero será un carácter cualquiera (a, b, c, …),
# B. el segundo un número entre 1 y 60 y …
# C. el tercero un número entre 1 y 10.
# Dibujará por pantalla tantas líneas como indique el parámetro 3, cada línea
# estará formada por tantos caracteres como indique el parámetro 1 y el
# número indicado por el parámetro 2.

if [ $# -ne 3 ]; then
  printf "\nError due to missing parameters. Exiting...\n"
  printf "\tUsage example: ./repetidos.sh k 20 5\n"
  exit 0
fi

for ((i=1; i<=$3; i++)); do
  for ((x=1; x<=$2; x++)); do
    printf $1
  done
  printf "\n"
done
