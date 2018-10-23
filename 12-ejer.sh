#!/bin/bash

randomNum=$((1 + RANDOM % 1000))

for ((i=0; i<=9; i++)); do
  read -p "Type in your guess: " userInput

  if [ $randomNum -eq $userInput ]; then
    printf "Eureka! The number was: $randomNum\n"
    exit 0
  else
    if [ $userInput -gt $randomNum ]; then
      printf "Too high!\n"
    else
      printf "Too low!\n"
    fi
  fi
done

printf "Fail! The number was: $randomNum\n"
