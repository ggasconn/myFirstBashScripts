#!/bin/bash
read -p "Insert the name of the file you wanna write on: " filename
cat > $filename #Put the characters inserted in the command line into the file
