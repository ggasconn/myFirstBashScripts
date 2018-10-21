#!/bin/bash
if [ $# -ne 1 ]; then
  printf "Error: The number of parameters was not expected\n"
  printf "\tUsage: $0 directoryName\n\n"
  exit 1
fi

for i in `find $1 -iname "*.zip"`; do
  path=${i::-4}
  unzip $i -d $path
done
