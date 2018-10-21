#!/bin/bash
date=`date +%F`

select selectedUser in `cat /etc/passwd | cut -d: -f1` exit; do
  case $selectedUser in
    'exit')
      exit 0
      ;;
    *)
      printf "Selected user: $selectedUser\n"

      if [ -d /home/$selectedUser ]; then
        printf "Doing backup...\n"

        tar -czvf $selectedUser-$date.tgz /home/$selectedUser

        printf "\n**Backup created succesfully**\n"
        exit 0
      else
        printf "Directory not found for user $selectedUser\n"
      fi
      ;;
  esac
done
