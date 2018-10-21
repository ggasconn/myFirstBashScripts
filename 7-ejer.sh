#!/bin/bash
read -p "Give me a name to generate 100 files: " name

if ! [[ -d "filesDir" ]]; then
	mkdir filesDir
fi

for ((i=0; i<=99; i++)); do
	touch filesDir/$name-$i
done
