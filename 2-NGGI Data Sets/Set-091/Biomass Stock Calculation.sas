
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-091\91-Biomass Stock Calculations.xlsx'
	 out=Biomass
	 dbms=excel
     replace;
     sheet="Data";
run;
data Biomassdata; set Biomass;
Belowbiomass=sum(BelowMax,BelowMin)*1000/2;
Belowbiomass_unit="g/m2";
NPP=BelowNPP*1000;
NPP_unit="g/m2";
proc means noprint; var Belowbiomass NPP;
by Site_ID;
output out=Massdata(drop = _type_ _freq_)
mean=MBelowbiomass MNPP;
run;
proc export data=Massdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-091\BiomassStock' replace dbms=excel;
run;