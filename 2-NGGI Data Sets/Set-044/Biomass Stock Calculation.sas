
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-044\44-Biomass Stock Calculations.xlsx'
	 out=Biomass
	 dbms=excel
     replace;
     sheet="Data";
run;
data Biomassdata; set Biomass;
Abovebiomass=Density*sum(Leavesmass,Shootmass)/1000;
Belowbiomass=Density*sum(Rhizome,Roots)/1000;
Abovebiomass_unit="g_m2";
Belowbiomass_unit="g_m2";

proc export data=Biomassdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-044\BiomassStock' replace dbms=excel;
run;