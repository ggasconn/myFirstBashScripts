#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo "Please run the script as root"
  exit 1
fi

if grep -q 'equipoA' /etc/group; then
  printf "\nGroup equipoA already exists, skipping...\n"
else
  groupadd 'equipoA'
fi

if ! [[ -d '/home/comun' ]]; then
  mkdir /home/comun
  chgrp -R equipoA /home/comun
  chmod -R g=r /home/comun
fi

if ! [[ -d '/home/trabajo' ]]; then
  mkdir /home/trabajo
  chgrp -R equipoA /home/trabajo
  chmod -R g=rw /home/trabajo
fi

for ((i=0; i<=4; i++)); do
  read -p "User name: " name
  read -p "User surname: " surname

  name=$(echo $name|cut -c 1)
  surname=$(echo $surname|cut -c 1)
  username=$name$surname

  useradd $username

  if [ $? == 0 ]; then
    printf "Created user: $name$surname\n"
  fi
done
