#!/bin/bash

file='current.tag.txt'
touch $file
date=`date +%2y.%m.%d`   
dateInFile=`cat ./$file|head -c 8` 
currentCounter=`cat ./$file| rev | head -c 4 | rev`

if [ -s $file ] | [ $dateInFile != $date ];
  then
    echo "$date.000" > $file
  else
    currentCounter=$( expr $currentCounter + 1 )
    formattedCurrentCounter=$(printf "%.3d " $currentCounter)
    echo "$date.$formattedCurrentCounter" > $file
fi    

cat $file


