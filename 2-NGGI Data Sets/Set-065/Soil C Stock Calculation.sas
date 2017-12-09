
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-065\65-Soil Carbon Stock Calculations.xlsx'
	 out=SoilC
	 dbms=excel
     replace;
     sheet="Data";
run;
proc sort; by Site_ID Depth;
run;
data SoilCdata; set SoilC;
SC=OC*BD/100;/*the unit for Soil C stock should be OC g/cc as OC g/cc = OC (percent) * Bulkdensity(g/cm3) */
SC_unit="OCg_cc";
SC_rate=OCrate*1000;/*OCrate_unit = kg_m2_yr*/
SC_rate_unit="gCm-2yr-1";
proc means noprint; var SC SC_rate;
by Site_ID;
output out=SCdata(drop = _type_ _freq_)
mean=MSC MSC_rate;
run;

proc export data=SCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-065\SoilCStock' replace dbms=excel;
run;