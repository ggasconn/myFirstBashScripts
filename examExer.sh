#!/bin/bash

if [ $# -ne 3 ]; then
  printf "\nError: incorrect number of parameters\n"
  printf "\tUsage: $0 desiredUsername desiredPassword desiredGroup\n"
  exit 1
fi

if grep -q $3 /etc/group; then
  printf "\nGroup $3 already exists, skipping...\n"
else
   groupadd $3
fi

if ! [[ -d /root/logs/ ]]; then
  mkdir /root/logs/
fi

if ! [[ -f /root/logs/usersLog.txt ]]; then
  touch /root/logs/usersLog.txt
fi

for ((i=0; i<=9; i++)); do
  useradd -m -k /etc/skel -G $3 $1-$i
  echo "$1-$i:$2" | chpasswd
  if [ $? == 0 ]; then
    echo "- Created user: $1-$i at `date` -" >> /root/logs/usersLog.txt
  fi
done

if [ -d $3 ]; then
  printf "\n\tError creating the specified directoy. Already exists\n"
else
  mkdir /home/$3
  chgrp $3 /home/$3
  chmod 070 /home/$3
fi
