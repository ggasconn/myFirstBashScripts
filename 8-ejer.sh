#!/bin/bash
myArray=("computer" "keyboard" "linux" "python" "bash" "vim")
secretWord=${myArray[$(echo $(( ( RANDOM % 10 ) + 1 )))]}

while ! [[ $userInput = $secretWord ]]; do
	read -p "Try to guess a secret word about computing: " userInput
done

printf "\nEureka! You got it! The word was $secretWord\n"
