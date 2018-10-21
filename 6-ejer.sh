#!/bin/bash

if ! [[ -f "shellman.txt" ]]; then
	man bash > shellman.txt
fi

printf "These are the first 100 lines containing the word \'list\':\n\n"
grep "List" shellman.txt | head -n 100
