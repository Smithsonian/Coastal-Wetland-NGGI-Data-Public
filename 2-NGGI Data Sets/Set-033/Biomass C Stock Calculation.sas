
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-033\33-Biomass Carbon Stock Calculations.xlsx'
	 out=SoilC
	 dbms=excel
     replace;
     sheet="Data";
run;
proc sort; by Site_ID;
run;
data SoilCdata; set SoilC;
Abovebiomass=Abovebio*12/(44*4050);/*the unit for plant biomass = (CO2 equivalent *12/44)/4050 */
Abovebiomass_unit="g_m2";
Belowbiomass=Belowbio*12/(44*4050);
Belowbiomass_unit="g_m2";
run;
proc export data=SoilCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-033\BiomassCStock' replace dbms=excel;
run;