#!/bin/bash

#minmax 150km.dat

awk '{print $1,$2,$3}' $HOME/maps/a-grids/150km.dat > 167.txt

xyz2grd $HOME/maps/a-grids/167.txt -G$HOME/maps/a-grids/167.grd -R-63/-30/-31/-3 -I0.333 -V

grdcut $HOME/maps/a-grids/167.grd -G$HOME/maps/a-grids/167cut.grd -R-57/-36/-25/-8.66667

makecpt -I -T-.55/.55/0.01 > $HOME/maps/a-grids/167tmp.cpt

grdimage $HOME/maps/a-grids/167cut.grd -JM19 -E300 -C$HOME/maps/a-grids/167tmp.cpt > quick.ps
gv quick.ps&
