
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-045\45-Soil Carbon Stock Calculations.xlsx'
	 out=SoilC
	 dbms=excel
     replace;
     sheet="Data";
run;
proc sort; by Site_ID;
run;
data SoilCdata; set SoilC;
if BD=-99 then BD=.;
SC=OC*BD/100;/*the unit for Soil C stock should be OC g/cc as OC g/cc = OC * Bulkdensity(g/cm3) */
SC_unit="OCg_cc";
run;
proc export data=SoilCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-045\SoilCStock' replace dbms=excel;
run;