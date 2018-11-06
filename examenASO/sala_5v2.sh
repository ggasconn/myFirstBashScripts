#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

read -n "With how many machines do you wanna work?: " number

machines=()

for ((i=1; i<=$number; i++)); do
  read -p "IP address: " ip
  ping $ip -c 1 > /dev/null

  if ! [[ $? -eq 0 ]]; then
    printf "\nComputer off\n"
    read -p "Introduce the mac to turn on the machine: " mac
    printf '\nTurning on the machine, wait...\n'
    wakeonlan $mac
    sleep  15000
  fi

  machines+=($ip)
done

for machine in "${machines[@]}"; do
  scp createUsers.sh ggc@$machine:.

  if  [ $? -eq 0 ]; then
    printf '\nScript sent succesfully\n'
  else
    printf '\nThere was a error sending the file\n'
  fi
done

cssh -l ggc@"${my_array[@]}"
