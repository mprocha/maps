#!/bin/bash

#minmax 150km.dat

awk '{print $1,$2,$3}' ~/maps/a-grids/150km.dat > 167.txt

xyz2grd ~/maps/a-grids/167.txt -G/home/marcelo/maps/a-grids/167.grd -R-63/-30/-31/-3 -I0.333 -V

grdcut ~/maps/a-grids/167.grd -G/home/marcelo/maps/a-grids/167cut.grd -R-57/-36/-25/-8.66667

makecpt -I -T-.55/.55/0.01 > ~/maps/a-grids/167tmp.cpt

grdimage ~/maps/a-grids/167cut.grd -JM19 -E300 -C/home/marcelo/maps/a-grids/167tmp.cpt > quick.ps
gv quick.ps&
