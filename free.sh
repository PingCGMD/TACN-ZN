#!/bin/bash

# total number of molecules (see system.top file)
n=193318

b=10000
e=6990000
d=10000

for ((t = $b; t <= $e; t = $t+10000))
do
   let "tb=$t-$d"
   let "te=$t+$d"
   echo 5 0 | gmx energy -f dynamic_all.edr -fee -nmol $n -b $tb -e $te > energy.out
   fe=`grep Potential energy.out | awk '{print $6}'`
   echo $t $fe >> freenrj.dat
   rm energy.out energy.xvg
done

