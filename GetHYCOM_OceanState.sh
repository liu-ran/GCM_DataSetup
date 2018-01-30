#!/bin/bash


declare -a exps=("expt_90.6" "expt_90.8" "expt_90.9")

x1=2400
x2=3160
y1=1580
y2=2300


declare -a vars=("2d" "salt" "temp" "uvel" "vvel")

for experiment in "${exps[@]}"
do

  echo $experiment

  for var in "${vars[@]}"
  do

    if [ ! -d "$var/" ]; then
      mkdir $var
    fi
  
    echo "wget ftp://ftp.hycom.org/datasets/GLBa0.08/${experiment}/data/${var}/*.nc"
    wget ftp://ftp.hycom.org/datasets/GLBa0.08/${experiment}/data/${var}/*.nc
  
    # Trim down the file to extract the region
    for file in $(ls *.nc)
    do
  
      echo "ncks -d X,$x1,$x2 -d Y,$y1,$y2 $file ${var}/regional_${file}"
      ncks -d X,$x1,$x2 -d Y,$y1,y2 $file "${var}/regional_${file}"
      rm $file
  
    done

  done

done

