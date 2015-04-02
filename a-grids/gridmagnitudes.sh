#!/bin/bash

#minmax 150km.dat

#file=magnitudes
#region=-90/-30/-30/10
#scale=2.4/5.0/0.05

#file=magnitudesBR
#region=-75/-30/-30/10
#scale=1.4/4.4/0.05

#file=magnitudes-ver
#region=-75/-30/-30/10
#scale=1.3/4.4/0.05

file=magnitudes3
region=-75/-30/-35/10
scale=1.3/4.4/0.05

file=magnitudes4
region=-75/-30/-35/10
scale=1.3/4.4/0.05

file=magnitudes6
region=-75/-30/-35/10
scale=1.3/4.4/0.05

awk '{print $4,$3,$5}' $file.out > $file.xyz

xyz2grd ~/maps/a-grids/$file.xyz -G/home/marcelo/maps/a-grids/$file.grd -R$region -I1 -V


makecpt -I -T$scale > ~/maps/a-grids/$file.cpt
#grd2cpt /home/marcelo/maps/a-grids/$file.grd > ~/maps/a-grids/$file.cpt
 
grdimage ~/maps/a-grids/$file.grd -JM19 -E300 -C/home/marcelo/maps/a-grids/$file.cpt > $file-quick.ps
psscale -C/home/marcelo/maps/a-grids/$file.cpt -D5.5i/2.00i/2.00i/0.3i -Ba0.2f0.1:"Magnitudes Values":  -O -E -K >> $file-quick.ps
#grdcontour ~/maps/a-grids/$file.grd -JM19 -C/home/marcelo/maps/a-grids/$file.cpt > $file-quick.ps
gv $file-quick.ps&
