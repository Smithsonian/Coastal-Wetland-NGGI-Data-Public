
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-078\78-Soil Carbon Stock Calculations.xlsx'
	 out=SoilC
	 dbms=excel
     replace;
     sheet="Data";
run;
proc sort; by Site_ID;
run;
data SoilCdata; set SoilC;
SC=OC*BD;
SC_unit="OCg_cc";
run;
proc export data=SoilCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-078\SoilCStock' replace dbms=excel;
run;