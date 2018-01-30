#!/bin/bash


declare -a exps=("expt_90.6" "expt_90.8" "expt_90.9")

x1=2400
x2=3160
y1=1580
y2=2300

for experiment in "${exps[@]}"
do

  echo $experiment
  wget ftp://ftp.hycom.org/datasets/GLBa0.08/${experiment}/data/2d/*.nc

  ncks -d lon,0 -d lon,399 -d lat,0 -d lat,399 in.nc out.nc
  
done
