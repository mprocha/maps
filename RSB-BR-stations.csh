#!/bin/csh
gmtset MEASURE_UNIT cm  ; gmtset ANOT_FONT_SIZE 11   ; gmtset LABEL_FONT_SIZE 11   ; gmtset TICK_LENGTH 0.1 
gmtset FRAME_PEN  3     ; gmtset BASEMAP_TYPE PLAIN  ; gmtset WANT_EURO_FONT TRUE  ; gmtset PLOT_DEGREE_FORMAT -D 
gmtset DOTS_PR_INCH 300 ; gmtset HEADER_FONT_SIZE 30 ; gmtset OBLIQUE_ANNOTATION 0

# ($1) Choose 'y' or 'n' to plot a particular network; ($2) for color of the sta symbols; ($3) for sta symbol; (4) for sta symbol size:
set gnss       = n ; set colorgnss       = blue   ; set stasymbgnss       = d ; set symbsizegnss       = 0.20 #GPS RBMC 
set projplan   = n ; set colorprojplan   = purple ; set stasymbprojplan   = t ; set symbsizeprojplan   = 0.45 #Est. Planejadas (Projetos)
set sisunb     = n ; set colorsisunb     = gray   ; set stasymbsisunb     = t ; set symbsizesisunb     = 0.30 #Est. Obsis
set brsat      = y ; set colorbrsat      = green  ; set stasymbbrsat      = t ; set symbsizebrsat      = 0.40 #RSB-BR Satelite
set broff      = y ; set colorbroff      = orange ; set stasymbbroff      = t ; set symbsizebroff      = 0.40 #RSB-BR Off-line
set brsoinf    = n ; set colorbrsoinf    = brown  ; set stasymbbrsoinf    = t ; set symbsizebrsoinf    = 0.40 #RSB-BR So-infra
set brplan     = n ; set colorbrplan     = white  ; set stasymbbrplan     = t ; set symbsizebrplan     = 0.40 #RSB-BR Planejadas 
set brtbr      = n ; set colorbrtbr      = brown  ; set stasymbbrtbr      = t ; set symbsizebrtbr      = 0.30 #Proj. Transbrasiliano 
set osgeorge   = n ; set colorosgeorge   = pink   ; set stasymbosgeorge   = t ; set symbsizeosgeorge   = 0.30 #Proj. Transbrasiliano George
set osinct     = n ; set colorosinct     = pink   ; set stasymbosinct     = t ; set symbsizeosinct     = 0.30 #Proj. INCT OS
set brlablitos = n ; set colorbrlablitos = yellow ; set stasymbbrlablitos = t ; set symbsizebrlablitos = 0.30 #Lablitos 
set blusp      = y ; set colorblusp      = blue   ; set stasymbblusp      = t ; set symbsizeblusp      = 0.40 #RSB-BL USP 
set nbufrn     = y ; set colornbufrn     = red    ; set stasymbnbufrn     = t ; set symbsizenbufrn     = 0.40 #RSB-NB UFRN 
set onon       = y ; set coloronon       = yellow ; set stasymbonon       = t ; set symbsizeonon       = 0.40 #RSB-ON 
set bluspold   = n ; set colorbluspold   = black  ; set stasymbbluspold   = t ; set symbsizebluspold   = 0.30 #BL-IAG-USP 
set nbmilen    = n ; set colornbmilen    = black  ; set stasymbnbmilen    = t ; set symbsizenbmilen    = 0.30 #Projeto Milenio
set planusp    = n ; set colorplanusp    = white  ; set stasymbplanusp    = t ; set symbsizeplanusp    = 0.30 #Est. Planejadas (USP)
set perun      = n ; set colorperun      = black  ; set stasymbperun      = t ; set symbsizeperun      = 0.30 #Est. IGP Peru Norte
set peru       = n ; set colorperu       = blue   ; set stasymbperu       = t ; set symbsizeperu       = 0.30 #Est. IGP Peru    
set ufba       = n ; set colorufba       = blue   ; set stasymbufba       = t ; set symbsizeufba       = 0.30 #Est. UFBA Vilar  
set globnet    = n ; set colorglobnet    = black  ; set stasymbglobnet    = s ; set symbsizeglobnet    = 0.30 #Est. Rede Mundial

set BaciasIntracratonicasPrincipaisBR	= y ;  set Legend	    = y    
set BaciasIntracratonicasSecundariasBR	= n ;  set SAmBrazilContour = n     
set BaciasMargemEquatorialBR		= n ;  set EstadosBR	    = y    
set BaciasMargemLesteBR			= n ;  set Events	    = n    
set RiftsAbortadosBR			= n ;  set elipse	    = n    
set CratonsBR				= y ;  set zoombox	    = n    
set LineamentosBR			= n ;  set text		    = y    
set SouthAmericaPlate			= n ;  set inlet	    = n    

set Etopo1	     = y ; set Etopo1GlobalColors    = n ; set Etopo1Scale    = y #Need Etopo1 = y
set BouguerAnomaly   = n ; set BouguerGlobalColors   = y ; set BouguerScale   = n #Need BouguerAnomaly = y
set FreeairAnomaly   = n ; set FreeairGlobalColors   = y ; set FreeairScale   = n #Need FreeAirAnomaly = y
set IsostaticAnomaly = n ; set IsostaticGlobalColors = y ; set IsostaticScale = n #Need IsostaticAnomaly = y
set EMAG2Anomaly     = n ; set EMAG2Scale            = y #Need EMAG2Anomaly =y

\rm figure.ps 
set gmtdir = ~/maps
set filename = RSB-BR-stations

## Coordinates Limits definition:
set Wlon = -74.0  # -84 to include Peru sta and -74 for only Brazilian sta
set Elon = -30.0
set Slat = -36.0
set Nlat =  07.0
## Brazil limits: 
# set Wlon=-74.0; set Elon=-30.0; set Slat=-36.0; set Nlat=07.0
## South America limits: 
# set Wlon=-85.0; set Elon=-30.0; set Slat=-60.0; set Nlat=15.0

## Cordinates Limits definition (Zoom):
set Wzlon = -64.0
set Ezlon = -50.0
set Szlat = -19.0
set Nzlat = -06.0
# Mato Grosso Zoom Box: Wzlon = -64.0; Ezlon = -50.0; Szlat = -19.0; Nzlat = -06.0

# Legend definition (First values of Longitude and Latitude, Others will be calculated):
#set symblon = -47.0
set symblon = `echo $Elon | awk '{print $1 - 13}'`
set symblat = $Slat 
set textlon = `echo $symblon | awk '{print $1 + 1}'`
set textlat = $symblat

## Plot Base map (psbasemap) and fill land and water (pscoast):
psbasemap -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -Ba2WSen -P -K > figure.ps
pscoast -R$Wlon/$Elon/$Slat/$Nlat -W1 -JM17.0 -A1000/1 -Di -G255/255/170 -S116/195/250 -O -K -N1 >> figure.ps


## Plot Topography (Etopo1 2min):
if ( "$Etopo1" == y    ) then
echo "Plotting Topography (Etopo1)"
makecpt ~/maps/a-grids/WGM2012_ETOPO1_SouthAmerica_ponc_2min.grd -Ctopo -T-1500/5000/10 > ~/maps/a-grids/PALET_WGM_ETOPO1_SouthAmerica_ponc_2min.cpt
pscoast -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -Gc -O -K >> figure.ps
if ( "$Etopo1GlobalColors" == y    ) then
grdimage ~/maps/a-grids/WGM2012_ETOPO1_SouthAmerica_ponc_2min.grd -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -C./a-grids/PALET_WGM_ETOPO1_Global.cpt -K -O >> figure.ps
else
grdimage ~/maps/a-grids/WGM2012_ETOPO1_SouthAmerica_ponc_2min.grd -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -C./a-grids/PALET_WGM_ETOPO1_SouthAmerica_ponc_2min.cpt -K -O >> figure.ps
endif
pscoast -Q -O -K >> figure.ps
   if ( "$Etopo1Scale" == y    ) then
      psscale -C./a-grids/PALET_WGM_ETOPO1_SouthAmerica_ponc_2min.cpt -D5.80i/3.10i/2.00i/0.25i -B500 -O -K >> figure.ps # Verificar como fazer alteracoes nos limites max e min da legenda e alterar as unidades para cm (retirar i)
   endif


## Plot Bouguer Anomaly:
else if ( "$BouguerAnomaly" == y    ) then
echo "Plotting Bouguer Anomaly"
makecpt ~/maps/a-grids/WGM2012_Bouguer_SouthAmerica_ponc_2min.grd -Crainbow -T-100/200/10 > ~/maps/a-grids/PALET_WGM_Bouguer_SouthAmerica_ponc_2min.cpt # Melhorar intervalo da escala
pscoast -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -Gc -O -K >> figure.ps
if ( "$BouguerGlobalColors" == y    ) then
grdimage ~/maps/a-grids/WGM2012_Bouguer_SouthAmerica_ponc_2min.grd -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -C./a-grids/PALET_WGM_Bouguer_Global.cpt -K -O >> figure.ps
else
grdimage ~/maps/a-grids/WGM2012_Bouguer_SouthAmerica_ponc_2min.grd -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -C./a-grids/PALET_WGM_Bouguer_SouthAmerica_ponc_2min.cpt -K -O >> figure.ps
endif
pscoast -Q -O -K >> figure.ps
   if ( "$BouguerScale" == y    ) then
      psscale -C./a-grids/PALET_WGM_Bouguer_Global.cpt -D5.1i/1.35i/2.88i/0.4i -O -E -K >> figure.ps
   endif


## Plot Free Air Anomaly:
else if ( "$FreeairAnomaly" == y    ) then
echo "Plotting Free Air Anomaly"
makecpt ~/maps/a-grids/WGM2012_Freeair_SouthAmerica_ponc_2min.grd -Crainbow -T-80/100/10 > ~/maps/a-grids/PALET_WGM_Freeair_SouthAmerica_ponc_2min.cpt # Melhorar intervalo da escala
pscoast -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -Gc -O -K >> figure.ps
if ( "$FreeairGlobalColors" == y    ) then
grdimage ~/maps/a-grids/WGM2012_Freeair_SouthAmerica_ponc_2min.grd -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -C./a-grids/PALET_WGM_Freeair_Global.cpt -K -O >> figure.ps
else
grdimage ~/maps/a-grids/WGM2012_Freeair_SouthAmerica_ponc_2min.grd -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -C./a-grids/PALET_WGM_Freeair_SouthAmerica_ponc_2min.cpt -K -O >> figure.ps
endif
pscoast -Q -O -K >> figure.ps
   if ( "$FreeairScale" == y    ) then
      psscale -C./a-grids/PALET_WGM_Freeair_Global.cpt -D5.1i/1.35i/2.88i/0.4i -O -E -K >> figure.ps
   endif


## Plot Isostatic Anomaly:
else if ( "$IsostaticAnomaly" == y    ) then
echo "Plotting Isostatic Anomaly"
makecpt ~/maps/a-grids/WGM2012_Isostatic_SouthAmerica_ponc_2min.grd -Crainbow -T-120/100/10 > ~/maps/a-grids/PALET_WGM_Isostatic_SouthAmerica_ponc_2min.cpt # Melhorar intervalo da escala
pscoast -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -Gc -O -K >> figure.ps
if ( "$IsostaticGlobalColors" == y    ) then
grdimage ~/maps/a-grids/WGM2012_Isostatic_SouthAmerica_ponc_2min.grd -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -C./a-grids/PALET_WGM_Isostatic_Global.cpt -K -O >> figure.ps
else
grdimage ~/maps/a-grids/WGM2012_Isostatic_SouthAmerica_ponc_2min.grd -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -C./a-grids/PALET_WGM_Isostatic_SouthAmerica_ponc_2min.cpt -K -O >> figure.ps
endif
pscoast -Q -O -K >> figure.ps
   if ( "$IsostaticScale" == y    ) then
      psscale -C./a-grids/PALET_WGM_Isostatic_Global.cpt -D5.1i/1.35i/2.88i/0.4i -O -E -K >> figure.ps
   endif


## Plot EMAG2 V2:
else if ( "$EMAG2Anomaly" == y    ) then
echo "Plotting EMAG2 Anomaly"
makecpt ~/maps/a-grids/EMAG2_SouthAmerica_V2.grd -Crainbow -T-150/150/10 > ~/maps/a-grids/PALET_EMAG2_SouthAmerica.cpt # Melhorar intervalo da escala
pscoast -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -Gc -O -K >> figure.ps
grdimage ~/maps/a-grids/EMAG2_SouthAmerica_V2.grd -R$Wlon/$Elon/$Slat/$Nlat -JM17.0 -C./a-grids/PALET_EMAG2_SouthAmerica.cpt -K -O >> figure.ps
pscoast -Q -O -K >> figure.ps
   if ( "$EMAG2Scale" == y    ) then
      psscale -C./a-grids/PALET_EMAG2_SouthAmerica.cpt -D5.1i/1.35i/2.88i/0.4i -O -E -K >> figure.ps
   endif
endif

## Plot Country Limits:
pscoast -R$Wlon/$Elon/$Slat/$Nlat -W1 -JM17.0 -A1000/1 -Di -O -K -N1 >> figure.ps

## Plot South American Plate:
if ( "$SouthAmericaPlate" == y    ) then
  psxy ~/maps/a-base/SouthAmerica-plate-countour.txt     -R -JM -m -W3,black -A1000/2     -O -K  >> figure.ps
endif 

## Plot South America and Brazil Contour:
if ( "$SAmBrazilContour" == y    ) then
  psxy ~/maps/a-base/SouthAmerica-Brazil-countour.txt     -R -JM -m -W3,black -A1000/2     -O -K  >> figure.ps
endif 

## Plot Brazilian States:
if ( "$EstadosBR" == y    ) then
  psxy ~/maps/a-base/brasil_ibge     -R -JM -m -W3,grey -A1000/2     -O -K  >> figure.ps
endif 


#psxy ~/maps/planejamento-sta-application/gmt.maps_sam/amazonas_bas.xy 	-R -JM -m -W3 -V -O -K >> figure.ps
#psxy ~/maps/planejamento-sta-application/gmt.maps_sam/araripe 		-R -JM -m -W3 -V -O -K >> figure.ps
#psxy ~/maps/planejamento-sta-application/gmt.maps_sam/margbas 		-R -JM -m -W3 -V -O -K >> figure.ps
#psxy ~/maps/planejamento-sta-application/gmt.maps_sam/margbas2 		-R -JM -m -W3 -V -O -K >> figure.ps
#psxy ~/maps/planejamento-sta-application/gmt.maps_sam/margbas3 		-R -JM -m -W3 -V -O -K >> figure.ps
#psxy ~/maps/planejamento-sta-application/gmt.maps_sam/ne.bas 		-R -JM -m -W3 -V -O -K >> figure.ps
#psxy ~/maps/planejamento-sta-application/gmt.maps_sam/pantanal_lr1.xy 	-R -JM -m -W3 -V -O -K >> figure.ps
#psxy ~/maps/planejamento-sta-application/gmt.maps_sam/parecis 		-R -JM -m -W2 -V -O -K >> figure.ps
#psxy ~/maps/planejamento-sta-application/gmt.maps_sam/sedbas 		-R -JM -m -W3 -V -O -K >> figure.ps
#psxy ~/maps/planejamento-sta-application/gmt.maps_sam/sedbas.3 		-R -JM -m -W3 -V -O -K >> figure.ps
#psxy ~/maps/planejamento-sta-application/gmt.maps_sam/secoast		-R -JM -m -W3 -V -O -K >> figure.ps

## Bacias Intracratonicas - Principais #####
if ( "$BaciasIntracratonicasPrincipaisBR" == y    ) then
psxy ~/maps/a-base/bacias-br/intracratonicas/principais/bacia-sao-francisco.txt		-R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/principais/bacia-acre.txt			-R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/principais/bacia-alto-dos-tapajos.txt	-R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/principais/bacia-amazonas.txt		-R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/principais/bacia-araripe.txt		-R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/principais/bacia-bananal.txt		-R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/principais/bacia-marajo.txt		-R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/principais/bacia-pantanal.txt		-R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/principais/bacia-parana.txt		-R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/principais/bacia-parecis.txt		-R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/principais/bacia-parnaiba.txt		-R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/principais/bacia-rio-do-peixe.txt		-R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/principais/bacia-sao-francisco.txt		-R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/principais/bacia-solimoes.txt		-R -JM -m -W2 -V -O -K >> figure.ps
endif

## Bacias Intracratonicas - Secundarias #####
if ( "$BaciasIntracratonicasSecundariasBR" == y    ) then
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-afogados-de-ingazeira.txt -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-betania.txt    		 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-cedro.txt		 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-curitiba.txt		 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-ico.txt			 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-iguatu.txt		 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-irece.txt		 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-lencois.txt		 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-lima-campos.txt		 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-malhada-vermelha.txt	 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-mirandiba.txt		 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-pajeu.txt		 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-sao-jose-de-belmonte.txt	 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-sao-paulo.txt		 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-socorro-santo-inacio.txt	 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/intracratonicas/secundarias/bacia-taubate.txt		 -R -JM -m -W2 -V -O -K >> figure.ps
endif

## Bacias Margem Equatorial #####
if ( "$BaciasMargemEquatorialBR" == y    ) then
psxy ~/maps/a-base/bacias-br/margem-equatorial/bacia-barreirinhas.txt			 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/margem-equatorial/bacia-ceara.txt				 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/margem-equatorial/bacia-foz-do-amazonas.txt		 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/margem-equatorial/bacia-para-maranhao.txt			 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/margem-equatorial/bacia-potiguar.txt			 -R -JM -m -W2 -V -O -K >> figure.ps
endif

## Bacias Margem Leste #####
if ( "$BaciasMargemLesteBR" == y    ) then
psxy ~/maps/a-base/bacias-br/margem-leste/bacia-camamu-almada.txt			 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/margem-leste/bacia-campos.txt				 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/margem-leste/bacia-cumuruxatiba.txt			 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/margem-leste/bacia-espirito-santo.txt			 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/margem-leste/bacia-jacuipe.txt				 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/margem-leste/bacia-jequitinhonha.txt			 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/margem-leste/bacia-mucuri.txt				 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/margem-leste/bacia-pelotas.txt				 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/margem-leste/bacia-pernambuco-paraiba.txt			 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/margem-leste/bacia-santos.txt				 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/margem-leste/bacia-sergipe-alagoas.txt			 -R -JM -m -W2 -V -O -K >> figure.ps
endif

## Rifts Abortados #####
if ( "$RiftsAbortadosBR" == y    ) then
psxy ~/maps/a-base/bacias-br/rifts-abortados/rift-abortado-jatoba.txt			 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/rifts-abortados/rift-abortado-reconcavo.txt		 -R -JM -m -W2 -V -O -K >> figure.ps
psxy ~/maps/a-base/bacias-br/rifts-abortados/rift-abortado-tucano.txt			 -R -JM -m -W2 -V -O -K >> figure.ps
endif

## Cratons #####
if ( "$CratonsBR" == y    ) then
psxy ~/maps/a-base/cratons-br/craton-sao-francisco.txt					 -R -JM -m -W3,a -V -O -K >> figure.ps
psxy ~/maps/a-base/cratons-br/escudo-guapore-geo.txt					 -R -JM -m -W3,a -V -O -K >> figure.ps
psxy ~/maps/a-base/cratons-br/escudo-guianas-geo.txt					 -R -JM -m -W3,a -V -O -K >> figure.ps
psxy ~/maps/a-base/cratons-br/escudo-riograndense-geo.txt				 -R -JM -m -W3,a -V -O -K >> figure.ps
psxy ~/maps/a-base/cratons-br/nucleo-cratonico-bc-parana-bloco-paranapanema-zalan.txt	 -R -JM -m -W3,a -V -O -K >> figure.ps
psxy ~/maps/a-base/cratons-br/nucleo-cratonico-bc-parana.txt				 -R -JM -m -W3,a -V -O -K >> figure.ps
psxy ~/maps/a-base/cratons-br/nucleo-cratonico-bc-parnaiba.txt				 -R -JM -m -W3,a -V -O -K >> figure.ps
endif

## Lineamentos #####
if ( "$LineamentosBR" == y    ) then
psxy ~/maps/a-base/lineamentos-br/falhas-bc-parana-zalan.txt				 -R -JM -m -W3,a -V -O -K >> figure.ps
psxy ~/maps/a-base/lineamentos-br/lineamento-transbrasiliano.txt			 -R -JM -m -W3,a -V -O -K >> figure.ps
endif

# Plot Events from a event catalog - Need include plotting symbol size based on magnitude value
if ( "$Events" == y    ) then
cat ~/maps/a-events/evlist.txt | awk '{print $10,$9}' | psxy -JM -R -Sc0.20 -L -W2 -O -Gred -K >> figure.ps
endif

# Plot Circle or Elipse - For circle elipseXsize == elipseYsize 
if ( "$elipse" == y    ) then
set elipsecenterlon = -56.729600; set elipsecenterlat = -11.612300 # PDRB
set elipsedirection = 0; set elipseXsize = 8; set elipseYsize = 8 # Sizes in degrees 
echo $elipsecenterlon $elipsecenterlat $elipsedirection $elipseXsize $elipseYsize | psxy -R -JM -O -K -Se -W0.25p >> figure.ps
endif



#psxy Brazil -R -JM -m  -W4 -A1000/2     -O -K  >> figure.ps
#psxy proj-transbrasiliano-area1.txt -m -R -JM -W5 -V -O -K >> figure.ps
#psxy geologia.dat -m -R -JM -W1,yellow -V -O -K >> figure.ps
#psxy cratonsfran.dat -m -R -JM -W1,yellow -V -O -K >> figure.ps
#psxy TBL.dat -m -R -JM -W1,yellow -V -O -K >> figure.ps
#psxy parana_zalan-paranapan-block.dat -M -R -JM -W6,/255/0/0,a -V -O -K >> figure.ps
#psxy parana_zalan-faults.dat -M -R -JM -W6/150/150/0 -V -O -K >> figure.ps
#psxy prnpnema_block.dat        -M -R -JM -W6,0/0/0,a -V -O -K >> figure.ps

# Figure Box
psxy <<END -L -A -W6 -JM -R -O -K >> figure.ps
$Wlon $Slat
$Elon $Slat
$Elon $Nlat
$Wlon $Nlat
END

## Zoom Box
if ( "$zoombox" == y ) then
psxy <<END -L -A -W1 -JM -R -O -K >> figure.ps
$Wzlon $Szlat
$Ezlon $Szlat
$Ezlon $Nzlat
$Wzlon $Nzlat
END
endif

#################################################
#         STATIONS WITH AVAILABLE DATA 
#################################################

## Global Net Stations
if ( "$globnet" == y    ) then
set color = $colorglobnet
set stasymb = $stasymbglobnet
set symbsize = $symbsizeglobnet
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N G " ~/maps/a-sta/StaList.all | grep "ativa" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps
grep "N GT" ~/maps/a-sta/StaList.all | grep "ativa" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps
grep "N IU" ~/maps/a-sta/StaList.all | grep "ativa" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML Rede Mundial
END
endif

endif 

## UFBA Net Stations
if ( "$ufba" == y    ) then
set color = $colorufba    
set stasymb = $stasymbufba    
set symbsize = $symbsizeufba    
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N UFBA " ~/maps/a-sta/StaList.all | grep "ativa" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML UFBA GEOTERM
END
endif

endif 

## IGP Peru Net Stations
if ( "$peru" == y    ) then
set color = $colorperu   
set stasymb = $stasymbperu   
set symbsize = $symbsizeperu   
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N PERU " ~/maps/a-sta/StaList.all | grep "ativa" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML IGP Peru
END
endif

endif 

## IGP Peru Net Stations
if ( "$perun" == y    ) then
set color = $colorperun   
set stasymb = $stasymbperun   
set symbsize = $symbsizeperun   
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N PERUN " ~/maps/a-sta/StaList.all | grep "ativa" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML IGP Peru
END
endif

endif 

## Planned Stations (USP)
if ( "$planusp" == y    ) then
set color = $colorplanusp
set stasymb = $stasymbplanusp
set symbsize = $symbsizeplanusp
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N PLAN-USP" ~/maps/a-sta/StaList.all |  grep planejada | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML BL-USP Planned
END
endif

endif

## USP Stations - BL
if ( "$bluspold" == y    ) then
set color = $colorbluspold
set stasymb = $stasymbbluspold
set symbsize = $symbsizebluspold
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N BL-USP" ~/maps/a-sta/StaList.all | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML USP Desativadas
END
endif

endif

## USP Stations - BL
if ( "$blusp" == y    ) then
set color = $colorblusp 
set stasymb = $stasymbblusp 
set symbsize = $symbsizeblusp 
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N BL-RSB" ~/maps/a-sta/StaList.all | grep "ativa" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML RSBR (USP)
END
endif

endif

## UFRN Stations - NB
if ( "$nbufrn" == y    ) then
set color = $colornbufrn
set stasymb = $stasymbnbufrn
set symbsize = $symbsizenbufrn
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N NB-RSB" ~/maps/a-sta/StaList.all | grep "ativa" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML RSBR (UFRN)
END
endif

endif

## ON Stations - ON
if ( "$onon" == y    ) then
set color = $coloronon
set stasymb = $stasymbonon
set symbsize = $symbsizeonon
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N ON-RSB" ~/maps/a-sta/StaList.all | grep "ativa" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML RSBR (ON)
END
endif

endif

## Projeto Milenio - NB
if ( "$nbmilen" == y    ) then
set color = $colornbmilen
set stasymb = $stasymbnbmilen
set symbsize = $symbsizenbmilen
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N NB-milenio" ~/maps/a-sta/StaList.all | grep "desativ" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W4 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML Proj Milenio
END
endif

endif

## UnB Stations - BR - Lablitos
if ( "$brlablitos" == y    ) then
set color = $colorbrlablitos
set stasymb = $stasymbbrlablitos
set symbsize = $symbsizebrlablitos
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N BR-lablitos" ~/maps/a-sta/StaList.all |  grep "desativ" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML Lablitos/UnB
END
endif

endif

## UnB Stations - BR - TBR
if ( "$brtbr" == y    ) then
set color = $colorbrtbr
set stasymb = $stasymbbrtbr
set symbsize = $symbsizebrtbr
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N BR-TBR" ~/maps/a-sta/StaList.all |  grep "desativ" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML TBR (Lablitos/UnB)
END
endif

endif

## UnB Stations - BR - GEORGE
if ( "$osgeorge" == y    ) then
set color = $colorosgeorge
set stasymb = $stasymbosgeorge
set symbsize = $symbsizeosgeorge
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N OS-GEORGE" ~/maps/a-sta/StaList.all |  grep "desativ" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML TBR (SIS/UnB)
END
endif

endif

## UnB Stations - OS - INCT
if ( "$osinct" == y    ) then
set color = $colorosinct
set stasymb = $stasymbosinct
set symbsize = $symbsizeosinct
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N OS-INCT" ~/maps/a-sta/StaList.all |  grep "desativ" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML OS INCT (SIS/UnB)
END
endif

endif

## SIS-UnB Stations - BR 
if ( "$sisunb" == y    ) then
set color = $colorsisunb
set stasymb = $stasymbsisunb
set symbsize = $symbsizesisunb
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N BR-SIS" ~/maps/a-sta/StaList.all |  awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML SIS/UnB
END
endif

endif

## UnB Stations - BR - Planejadas
if ( "$brplan" == y    ) then
set color = $colorbrplan
set stasymb = $stasymbbrplan
set symbsize = $symbsizebrplan
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N BR-PLAN" ~/maps/a-sta/StaList.all |  awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML RSBR (UnB) Planejadas
END
endif

endif

## UnB Stations - BR - Somente Infra-estrutura Instalada
if ( "$brsoinf" == y    ) then
set color = $colorbrsoinf
set stasymb = $stasymbbrsoinf
set symbsize = $symbsizebrsoinf
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N BR-RSB" ~/maps/a-sta/StaList.all |  grep "so-infra" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML RSBR (UnB) Apenas Infra
END
endif

endif

## UnB Stations - BR - Off Line
if ( "$broff" == y    ) then
set color = $colorbroff
set stasymb = $stasymbbroff
set symbsize = $symbsizebroff
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N BR-RSB" ~/maps/a-sta/StaList.all | grep "off-line" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML RSBR (UnB) Off-line
END
endif

endif

## UnB Stations - BR - Satelite
if ( "$brsat" == y    ) then
set color = $colorbrsat
set stasymb = $stasymbbrsat
set symbsize = $symbsizebrsat
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N BR-RSB" ~/maps/a-sta/StaList.all | grep "satelite" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML RSBR (UnB) Satelite
END
endif

endif

## Projeto - Planejadas
if ( "$projplan" == y    ) then
set color = $colorprojplan
set stasymb = $stasymbprojplan
set symbsize = $symbsizeprojplan
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

grep "N PROJ-PLAN" ~/maps/a-sta/StaList.all |  grep "planejada" | awk '{print $5" "$4" 0.3 "$3}' | psxy -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML PROJETO UNIVERSAL
END
endif

endif

## Estações GNSS
if ( "$gnss" == y    ) then
set color = $colorgnss
set stasymb = $stasymbgnss
set symbsize = $symbsizegnss
set symblat = `echo $symblat | awk '{print $1 + 1}'`
set textlat = $symblat

cat ~/maps/a-gps/ESTACOES_GNSS.txt | awk '{printf "%f %f 0.3 %s\n", $3, $2,$1}' | psxy -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps

if ( "$Legend" == y    ) then
psxy <<END -JM -R -S$stasymb$symbsize -L -W5 -O -G$color -K >> figure.ps
$symblon $symblat
END
pstext -JM -R -O -V -K  << END >> figure.ps
$textlon $textlat 11 0  01 ML GPS GNSS
END
endif

endif

#######
#TEXT:
#######
if ( "$text" == y    ) then
echo before pstext
pstext <<END -JM -R -N -O -K >> figure.ps
#-52.500000 -24.000000 16 000.0 06 6 Paran@!\302a
#-52.500000 -24.500000 16 000.0 06 6 Basin
#-57.100000 -22.300000 12 050.0 06 6 Rio Apa
#-56.300000 -20.000000 14 065.0 06 6 Rio Apa Block
#-45.000000 -14.500000 16 000.0 06 6 S@!\304ao Francisco
#-45.000000 -15.000000 16 000.0 06 6 Craton
#-48.700000 -17.000000 16 -47.0 06 6 Bras@!\302\365lia Belt 
#-48.000000 -24.600000 16 033.0 06 6 Ribeira Belt
#-41.700000 -18.800000 16 000.0 06 6 Norte
#-42.500000 -17.300000 16 070.0 06 6 Ara@!\313cua@!\302\365 Belt 
#-54.400000 -13.200000 16 000.0 06 6 Amazonic Craton
#-55.500000 -13.200000  24 000.0 06 6 CA
# -58.500000 -17.700000 12 -47.0 31 6 Bolivia
# -57.500000 -24.000000 12 000.0 31 6 Paraguai
# -56.500000 -28.200000 12 033.0 31 6 Argentina
# -49.000000 -14.200000 20 000.0 06 6 Brasil
# -49.000000 -14.700000 24 000.0 06 6 PT   
# -39.000000 -23.000000 16 030.0 06 6 Oceano Atl@!\342antico
# -51.311000 -22.331000 09 000.0 00 6 ppdb
# -51.330000 -20.970000 09 000.0 00 6 trib
# -50.230000 -20.100000 09 000.0 00 6 agvb
# -48.930600 -21.200000 09 000.0 00 6 olib
# -48.813900 -22.130000 09 000.0 00 6 ibib
# -47.500000 -20.400000 09 000.0 00 6 rifb
# -58.200000 -21.500000 09 000.0 00 6 ptmb
# -46.731000 -21.990000 09 000.0 00 6 cacb
# -46.286000 -20.950000 09 000.0 00 6 furb
# -45.365000 -20.800000 09 000.0 00 6 frmb
# -54.184200 -21.800000 09 000.0 00 6 navb
# -44.900000 -19.800000 09 000.0 00 6 cdcb
# -44.900000 -23.500000 09 000.0 00 6 parb
# -51.015500 -23.150000 09 000.0 00 6 capb
# -48.010000 -16.040000 09 000.0 00 6 bdfb
# -57.330000 -26.700000 09 000.0 00 6 cpup
# -44.000000 -19.630000 09 000.0 00 6 bet1
# -47.700000 -22.900000 09 000.0 00 6 vabb
# -41.400000 -21.000000 09 000.0 00 6 natb
# -43.200000 -22.454100 09 000.0 00 6 trrb
# -42.800000 -20.920000 09 000.0 00 6 atdb
# -45.000000 -22.500000 09 000.0 00 6 brsb
# -46.150000 -21.550000 09 000.0 00 6 areb
# -44.763500 -21.320000 09 000.0 00 6 bscb
# -43.800500 -20.840000 09 000.0 00 6 barb
# -51.200000 -15.900000 09 000.0 00 6 argb
# -48.000000 -23.500000 09 000.0 00 6 spb
# -45.700000 -22.900000 09 000.0 00 6 igab
# -43.800000 -21.750000 09 000.0 00 6 jfob
# -49.600000 -24.600000 09 000.0 00 6 rstb
# -48.400000 -19.300000 09 000.0 00 6 mir4
# -41.400000 -22.050000 09 000.0 00 6 camb
# -41.200000 -20.600000 09 000.0 00 6 cam3
# -41.000000 -22.500000 09 000.0 00 6 cam1
# -42.540000 -22.650000 09 000.0 00 6 cam4
# -47.000000 -22.600000 09 000.0 00 6 vao3
# -46.950000 -23.580000 09 030.0 00 6 vao2
# -47.700000 -23.100000 09 000.0 00 6 vao
# -48.200000 -23.900000 09 000.0 00 6 juqb
# -52.800000 -22.900000 09 000.0 00 6 popb
# -50.200000 -23.200000 09 000.0 00 6 canb
# -48.300000 -20.000000 09 000.0 00 6 igpb
# -48.700000 -18.750000 09 000.0 00 6 mir1
# -55.900000 -15.200000 09 000.0 00 6 man2
# -55.600000 -14.400000 09 000.0 00 6 man1
# -46.800000 -19.300000 09 000.0 00 6 np4b
# -48.700000 -18.100000 09 000.0 00 6 corb
# -45.500000 -24.000000 09 000.0 00 6 daeb
# -51.500000 -15.000000 09 000.0 00 6 pazb
# -50.350000 -16.900000 09 000.0 00 6 slmb
# -49.090000 -15.600000 09 000.0 00 6 gnsb
# -49.100000 -13.700000 09 000.0 00 6 porb
# -46.600000 -20.000000 09 000.0 00 6 bamb
# -46.600000 -14.200000 09 000.0 00 6 cv3b
# -48.000000 -14.200000 09 000.0 00 6 cv1b
# -52.000000 -21.600000 09 000.0 00 6 pacb
# -55.600000 -17.600000 09 000.0 00 6 pp1b
# -48.200000 -22.400000 09 000.0 00 6 rclb
# -47.700000 -21.000000 09 000.0 00 6 nupb
# -39.600000 -16.400000 09 000.0 00 6 itpb
# -39.400000 -12.900000 09 000.0 00 6 pdcb
# -54.700000 -20.476000 09 000.0 00 6 aqdb
# -45.550000 -18.537290 09 000.0 00 6 pmna
# -46.100000 -16.357500 09 000.0 00 6 unia
# -45.900000 -17.222200 09 000.0 00 6 prcb
# -44.240000 -15.950000 09 000.0 00 6 jnrb
# -44.636700 -13.743300 09 000.0 00 6 crtb
# -43.800000 -23.320700 09 000.0 00 6 esar
# -44.100000 -18.092200 09 000.0 00 6 trmb
# -50.300000 -28.500000 09 000.0 00 6 novb
# -52.9500000 -27.600000 09 000.0 00 6 itab
# -53.100000 -19.531401 09 000.0 00 6 cmpa
# -50.604401 -17.881399 09 000.0 00 6 jatb
## -52.3410329  -27.3080083 09 000.0 00 6 it1
## -52.1837386  -27.4501599 09 000.0 00 6 it4
## -52.0040271  -27.4603637 09 000.0 00 6 it5
## -52.0312221  -27.1345638 09 000.0 00 6 it9
## -51.8567992  -27.5946498 09 000.0 00 6 mc1
## -51.4474621  -27.3357632 09 000.0 00 6 mc5
## -51.4388283  -27.6724037 09 000.0 00 6 mc9
## -51.6651274  -27.6388859 09 000.0 00 6 m11
### -52.5186000  -26.7614000 09 000.0 00 6 qq1
END
endif

#pstext -O -V -K -R -JM -Y-2.0 -K  << END >> figure.ps
#-54.0  -36.0 13 0  01 6 Longitude [graus]
#END

#pstext <<END -O -V -K -R -JM -Y2.0 -K  >> figure.ps
#END

#pstext -O -V -K -R -JM -Y-2.0 -K  << END >> figure.ps
#-74.0   -18.0 13 90 01 6 Latitude [graus]
#END

#pstext <<END -O -V -K -R -JM -Y2.0 -K >> figure.ps
#END

######
#INLET
######
if ( "$inlet" == y    ) then
gmtset FRAME_PEN  2; gmtset DOTS_PR_INCH 300

#pscoast -O -W2 -Di -A1000/1 -R-90/-29/-57./16 -JM3. -G255 -S235 -Bwsen -X0.10 -Y15.65 -K -N1 >> figure.ps 
pscoast -O -W2 -Di -A1000/1 -R-90/-29/-57./16 -JM4. -G255 -S235 -Bwsen -X0.10 -Y0.10 -K -N1 >> figure.ps 

psxy <<END -L -A -W4 -JM -R -O -K >> figure.ps
$Wlon $Slat
$Elon $Slat
$Elon $Nlat
$Wlon $Nlat
END

pstext <<END -JM -R -O -K -Y-12.0 >> figure.ps
END
endif

# To safety figure close (without flag -K )
pstext <<END -JM -R -O >> figure.ps
END

# Rename output and criate jpg version
mv figure.ps ./figures/$filename.ps
gv ./figures/$filename.ps &
convert -quality 1000 -density 400 ./figures/$filename.ps ./figures/$filename.jpg
