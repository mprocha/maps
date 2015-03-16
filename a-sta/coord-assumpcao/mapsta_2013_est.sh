#!/bin/bash
#  plots BRASIS map with station stages
#

ofig=map_est_BRASIS2013_current.ps


dsta=/Users/marcelo/bin
gmtset PLOT_DEGREE_FORMAT -ddd    MEASURE_UNIT cm
dmap=/Users/marcelo/gmt.maps

psbasemap -JM15 -R-72/-34/-33.5/5 -Ba5ESNW -X3 -Y10 -V -P -K > $ofig
# opcao -A30000 inclui Ilha do Marajoh mas exclui o rio Amazonas
pscoast -JM -R -S200/200/255 -Dl -W4 -N1/6  -A30000 -V -O -K >> $ofig
psxy -JM -R $dmap/BR_land_border -m -W16/green  -V -O -K >> $ofig
psxy -JM -R $dmap/brasil_ibge -m -W1  -V -O -K >> $ofig

# plots permanent GS stations
psxy ./dat.sta_GSN -R -JM  -Ss0.6 -G100 -W8 -: -V -O -K >> $ofig
echo "-25 -36" | psxy -R -JM  -Ss0.6 -G100 -W8 -: -V -O -K >> $ofig


col=blue
awk '{print $2, $3}' $dsta/stations_BL_coords.dat | psxy -R -JM  -St0.50 -G$col -W8 -: -V -O -K >> $ofig
col=green
awk '{print $2,$3}' $dsta/stations_BR_coords.dat | psxy -R -JM  -Si0.50 -G$col -W8 -: -V -O -K >> $ofig
#echo "-27 -36" | psxy -R -JM  -Si0.5 -G$col -W8 -: -V -O -K >> $ofig
col=orange
awk '{print $2,$3}' $dsta/stations_ON_coords.dat | psxy -R -JM  -Sc0.35 -G$col -W8 -: -V -O -K >> $ofig
#echo "-29 -36" | psxy -R -JM  -Sc0.35 -G$col -W8 -: -V -O -K >> $ofig
#UFRN
col=yellow
awk '{print $2,$3}' $dsta/stations_NB_coords.dat | psxy -R -JM  -Sd0.40 -G$col -W8 -: -V -O -K >> $ofig
#echo "-29 -36" | psxy -R -JM  -Sd0.40 -G$col -W8 -: -V -O -K >> $ofig

# planned BL stations
col=white
awk '{print $2,$3}' ./stations_planned_BL.dat | \
   psxy -R -JM  -St0.60 -G$col -W12 -: -V -O -K >> $ofig
 echo "-28 -36" | psxy -R -JM  -St0.60 -G$col -W12 -: -V -O -K >> $ofig


# legenda dos simbolos
col=white
echo "-70 -37" | psxy -R -JM  -Si0.5 -Ggreen -W8 -N -V -O -K >> $ofig
echo "-60 -37" | psxy -R -JM  -St0.5 -Gblue -W8 -N -V -O -K >> $ofig
echo "-50 -37" | psxy -R -JM  -Sd0.4 -Gyellow -W8 -N -V -O -K >> $ofig
echo "-40 -37" | psxy -R -JM  -Sc0.4 -Gorange -W8 -N -V -O -K >> $ofig

#  legenda instituicoes
pstext <<END  -R -JM  -N -: -V -O -K >> $ofig
-37 -68  16 0.0 1 5  UnB
-37 -58  16 0.0 1 5  USP
-37 -48  16 0.0 1 5  UFRN
-37 -38  16 0.0 1 5  ON
END
# legenda das cores
pstext <<END -R -JM  -O -K  >> $ofig
-37.  -25  18 0.0  0 7  global net
-37.  -28  18 0.0  0 7  planned
END


# closes ps and plots
echo "0 0" | psxy -R -JM -Sp -O >> $ofig
open $ofig
