#!/bin/bash
if [[ $1 == "-s" ]]; then
  if [ -d "/home/$USER/Papelera" ]; then
    ls /home/$USER/Papelera
    exit 0
  else
    printf "\nThere no directory called 'Papelera' on your home.\n"
    printf "Try sending some files to 'Papelera' with the script\n"
    exit 1
  fi
fi

if [[ $1 == "-r" ]]; then
  if [ -d "/home/$USER/Papelera" ]; then
    read -p "!!!! Do you wanna delete all the content from 'Papelera' (y/n)? !!!!: " userOption
    if [[ $userOption == 'y' ]]; then
      printf "Removing files...\n"
      rm -rf /home/$USER/Papelera

      if [ $? -eq 0 ]; then
        printf "Files removed succesfully\n"
        exit 0
      else
        printf "There was a error deleting the files\n"
        exit 1
      fi
    fi
  else
    printf "\nThere no directory called 'Papelera' on your home.\n"
    printf "Try sending some files to 'Papelera' with the script\n"
    exit 1
  fi
fi

while ! [[ $option == "n" ]]; do
  read -p "Type in either the directory or folder you wanna move: " file

  if ! [[ -d "/home/$USER/Papelera" ]]; then
    mkdir /home/$USER/Papelera
  fi

  printf "Moving files to garbage...\n"
  mv $file /home/$USER/Papelera 2>/dev/null \

  if [ $? -eq 0 ]; then
    printf "File moved succesfully\n\n"
  else
    printf "There was a error moving the files\n"
    printf "If you are not in the directory of the file, enter the entire path.\n\n"
  fi

  read -p "Do you wanna move another file (y/n)? " option
done
