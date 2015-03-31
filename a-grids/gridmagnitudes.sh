#!/bin/bash

#minmax 150km.dat

awk '{print $4,$3,$5}' magnitudes.out > magnitudes.xyz

xyz2grd ~/maps/a-grids/magnitudes.xyz -G/home/marcelo/maps/a-grids/magnitudes.grd -R-90/-30/-30/10 -I1 -V

#grdcut ~/maps/a-grids/167.grd -G/home/marcelo/maps/a-grids/167cut.grd -R-57/-36/-25/-8.66667

makecpt -I -T2.4/5.0/0.05 > ~/maps/a-grids/magnitudes.cpt
#grd2cpt /home/marcelo/maps/a-grids/magnitudes.grd > ~/maps/a-grids/magnitudes.cpt
 
grdimage ~/maps/a-grids/magnitudes.grd -JM19 -E300 -C/home/marcelo/maps/a-grids/magnitudes.cpt > quick.ps
#grdcontour ~/maps/a-grids/magnitudes.grd -JM19 -C/home/marcelo/maps/a-grids/magnitudes.cpt > quick.ps
gv quick.ps&
