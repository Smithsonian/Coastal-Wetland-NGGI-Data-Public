
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-008\8-Soil Carbon Stock Calculations.xlsx'
	 out=SoilC
	 dbms=excel
     replace;
     sheet="Data";
run;
data SoilCdata; set SoilC;
SCrate=(SCratemin+SCratemax)/2;/*Soil C rate data was calculated from mean value of min and max for Natural marsh. */
SCrate_unit="gC_m2_yr";

proc export data=SoilCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-008\SoilCStock' replace dbms=excel;
run;