
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-063\63-Soil Carbon Stock Calculations.xlsx'
	 out=SoilC
	 dbms=excel
     replace;
     sheet="Data";
run;
data SoilCdata; set SoilC;
SC=OC*BD/100;/*the unit for Soil C concentration was percent, Bulkdensity was g/cm3 */
SC_unit="OCg_cc";

proc export data=SoilCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-063\SoilCStock' replace dbms=excel;
run;