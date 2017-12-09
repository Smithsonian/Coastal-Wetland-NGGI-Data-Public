
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-053\53-Soil Carbon Stock Calculations.xlsx'
	 out=SoilC
	 dbms=excel
     replace;
     sheet="Data";
run;
proc sort; by Site_ID Depth;
run;
data SoilCdata; set SoilC;
SC=OC*BD/100;/*the unit for Soil C stock should be OC g/cc as OC g/cc = OM * Bulkdensity(g/cm3) */
SC_unit="OCg_cc";
SC_rate=SC*AccuRate*10000;
SC_rate_unit="gCm2yr";
proc export data=SoilCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-053\SoilCStock' replace dbms=excel;
run;