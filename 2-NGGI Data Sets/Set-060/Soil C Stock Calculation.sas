
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-060\60-Soil Carbon Stock Calculations.xlsx'
	 out=SoilC
	 dbms=excel
     replace;
     sheet="Data";
run;
proc sort; by Site_ID Depth;
run;
data SoilCdata; set SoilC;
SC=C*12*BD/1000;/*the unit for Soil C stock should be OC g/cc as OC g/cc = C * Bulkdensity(g/cm3) */
SC_unit="OCg_cc";
proc means noprint; var SC;
by Site_ID;
output out=SCdata(drop = _type_ _freq_)
mean=MSC;
run;

proc export data=SCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-060\SoilCStock' replace dbms=excel;
run;