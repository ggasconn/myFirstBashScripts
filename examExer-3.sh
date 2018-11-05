#!/bin/bash
function checkSudo() {
  if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
  fi
}
echo '### Tasks ###'
echo '1.- Show 10 top proccess using more CPU'
echo '2.- Show 10 top proccess using more memory'
echo '3.- Kill a proccess by its name'
echo '4.- Create a backup from a given directory with files modified more than 7 days ago'
echo '5.- Show the content of a given directory'
echo '6.- Given a directory and some files check wheter they exists or not'
echo '7.- Given a directory decompress all the zip inside them'

read -p 'Choose an option (1-7): ' option

case $option in
  1)
    ps -aux --sort=-pmem | head -n 11 ;;

  2)
    ps -aux --sort=-pcpu | head -n 11 ;;

  3)
    checkSudo
    htop | head -n 11
    read -p 'Which proccess do you wanna kill: ' proccess
    kill -9 $proccess ;;

  4)
    checkSudo
    if [ -d $directory ]; then
      if ! [[ -d /backup ]]; then
        mkdir /backup
      fi
      find $directory -type f -mtime 7 -daystart -exec cp {} /backup/backup-`date +%F` 2> /dev/null \;
    else
      echo 'Directory not found. Exiting...'
      exit 1
    fi
    ;;

  5)
    read -p 'Type in a directory to show the content:' directory
    ls $directory ;;

  6)
    read -p'In which directory do you wanna search?: ' directory
    read -p'Which file do you wanna search for?: ' files
    IFS=' ' read -r -a splitedFiles <<< "$files"

    for element in "${splitedFiles[@]}"; do
      if [ -f $directory/$element ]; then
        echo "The file $element exists"
      fi
    done ;;

  7)
    read -p'In which directory do you wanna search?: ' directory
    for i in `find $directory -name "*.zip"`; do
      path=${i::-4}
      unzip $i -d $path
    done ;;

  *)
    echo 'Option not defined. Exiting...'
    exit 1 ;;
esac
