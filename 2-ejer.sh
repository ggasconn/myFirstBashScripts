#!/bin/bash
read -n 3  -p "Insert three numbers: " numString

if [ $(echo $numString|wc -c) -ne 4 ]; then
	printf "\nError: \n"
	printf "\tInsert three parameters\n"
	exit 1
else
	printf "\nReversed string: ${numString:2:1}${numString:1:1}${numString:0:1}\n"
fi

