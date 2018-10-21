#!/bin/bash
read -p "Please, enter a number: " num

myArray=()
cont=0

if [ $num -eq 1 ]; then
	myArray+=1
elif [ $num -eq 2 ]; then
	myArray+=(1 1)
elif [ $num -ge 2 ]; then
	myArray+=(1 1)
	while ! [[ $(($num-2)) -eq $cont ]]; do
		num1=${myArray[-1]}
		num2=${myArray[-2]}

		let tmp=$num1+$num2
		myArray+=( $tmp )
		let cont=$cont+1
	done
else
	printf "Error, number has to be above 1"
fi

printf "\n${myArray[*]}\n"
