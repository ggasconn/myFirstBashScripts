#!/bin/bash

date=`date +%F`
targetDir="/home/ggc/importantDirectory"
packedDir="backup-$date.tar.gz"

tar -czvf $packedDir $targetDir

if [ $? == 0 ]; then
  scp $packedDir ggc@petazeta:.
fi
