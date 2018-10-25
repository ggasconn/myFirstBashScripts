#!/bin/bash

if [ $# -ne 3 ]; then
  printf "\nError: incorrect number of parameters\n"
  printf "\tUsage: $0 desiredUsername desiredPassword desiredGroup\n"
  exit 1
fi

groupadd $3
if ! [[ -f /root/logs/usersLog.txt ]]; then
  touch /root/logs/usersLog.txt
fi
if ! [[ -d /root/logs/ ]]; then
  mkdir /root/logs/
fi

for ((i=0; i<=9; i++)); do
  useradd $1-$i -p $2 -G $3
  echo "- Created user: $1-$i at `date` - " >> /root/logs/usersLog.txt
done

if [ -d $2 ]; then
  printf "\n\tError creating the specified directoy. Already exists\n"
else
  mkdir /home/$3
  chgrp $3 /home/$3
  chmod 070 /home/$3
fi
