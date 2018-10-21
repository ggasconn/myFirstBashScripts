#!/bin/bash

clientBalance=()

for ((i=2; i<=`cat clientTemplate.txt | wc -l`; i++)); do
  balance=`cat clientTemplate.txt | head -n $i | tail -n 1 | cut -d" " -f 2`
  clientBalance+=($balance)

  printf "Value $balance added to array\n"
done

printf "%s " "${clientBalance[@]}" | sort -n
