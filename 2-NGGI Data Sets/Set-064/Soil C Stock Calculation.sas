
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-064\64-Soil Carbon Stock Calculations.xlsx'
	 out=SoilC
	 dbms=excel
     replace;
     sheet="Data";
run;
proc sort; by Site_ID Depth;
run;
data SoilCdata; set SoilC;
SC=OC*BD/1000;/*the unit for Soil C stock should be OC g/cc as OC g/cc = OC (mg_g/1000) * Bulkdensity(g/cm3) */
SC_unit="OCg_cc";

proc export data=SoilCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-064\SoilCStock' replace dbms=excel;
run;