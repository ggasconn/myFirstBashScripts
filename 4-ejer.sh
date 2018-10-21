#!/bin/bash
read -p "Insert the name or number of the month: " month

ncal=$(ncal -m $month)
cal=$(cal -m $month|tr -d '\ ')
let days=${#cal}-2
echo $ncal > tmp

startDay=$(grep -o -E '[a-z][a-z]\ 1' tmp)

case $startDay in
	'lu 1')
		printf "\nEl día 1 cae en lunes\n" ;;
	'ma 1')
		printf "\nEl día 1 cae en martes\n" ;;
	'mi 1')
		printf "\nEl día 1 cae en miércoles\n" ;;
	'ju 1')
		printf "\nEl día 1 cae en jueves\n" ;;
	'vi 1')
		printf "\nEl día 1 cae en viernes\n" ;;
	'sá 1')
		printf "\nEl día 1 cae en sábado\n" ;;
	'do 1')
		printf "\nEl día 1 cae en domingo\n" ;;
esac

printf "El mes elegido tiene ${cal:$days:10} días\n"

rm -r tmp
