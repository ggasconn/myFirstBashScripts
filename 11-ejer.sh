#!/bin/bash

select selectSong in `find ~ -iname "*.mp3" -print`; do
  mpg321 $selectSong
done
