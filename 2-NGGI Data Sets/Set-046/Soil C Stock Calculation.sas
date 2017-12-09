
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-046\46-Soil Carbon Stock Calculations.xlsx'
	 out=SoilC
	 dbms=excel
     replace;
     sheet="Data";
run;
data SoilCdata; set SoilC;
SC=BD*OC/100;/*OC unit was percent*/
SC_unit="OC_gcc";
SC_rate1=SC*Pb*10000;
SC_rate2=SC*Cs*10000;
SC_rate_unit="gCm2yr";
run;
proc export data=SoilCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-046\SoilCStock' replace dbms=excel;
run;