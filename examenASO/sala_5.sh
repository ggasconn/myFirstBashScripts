#!/bin/bash
#El script indica que se debe de hacer con 5 máquinas, pero debido a que solo
#tengo una máquina disponible el script estará orientado a una sola máquina
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

printf '\nChecking whether the machine is on or off...\n'
ping 192.168.0.190 -c 1 >/dev/null

if ! [[ $? -eq 0 ]]; then
  printf '\nTurning on the machine, wait...\n'
  wakeonlan 08:00:27:9e:09:8d
  sleep  15000
fi

scp createUsers.sh ggc@192.168.0.190:.

if  [ $? -eq 0 ]; then
  printf '\nScript sent succesfully\n'
  printf 'Connecting via cssh to execute it...\n'
  cssh -l ggc@192.168.0.190
else
  printf '\nThere was a error sending the file\n'
  exit 1
fi
