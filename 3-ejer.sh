#!/bin/bash

finalNum=0
read -p "Insert a positive number: " num

if [ $num -lt 0 ]; then
	printf "\nError:\n"
	printf "\tNegative number\n"
	exit 1
fi

for ((i=0; i<=$num; i=i+2)); do
	let finalNum=$finalNum+$i
done

printf "\nThe addition is: $finalNum\n"
