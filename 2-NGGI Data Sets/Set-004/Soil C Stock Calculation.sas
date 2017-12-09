
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-004\4-Soil Carbon Stock Calculations.xlsx'
	 out=SoilC
	 dbms=excel
     replace;
     sheet="Data";
run;
data SoilCdata; set SoilC;
SoilCC=0.074*(OM/100)*(OM/100) + 0.421*(OM/100) - 0.0080; /*SoilCC is soil C concentration, we used the equation developed by James Holmquist from the large soil profile database for converting from OM to C.  */
SoilCC_unit="gC_gsoil";
SC=SoilCC*BD;/*the unit for Soil C stock should be OC g/cc as OC g/cc = OM * Bulkdensity(g/cm3) */
SC_unit="OCg_cc";
SCrate=(Cs137+ Pb210)/2; /* Soil C vertical accretion rate was calculated from the mean value based on both 137Cs and 210Pb C rate data.*/ 
if Pb210=-99 and Cs137 ne -99 then SCrate=Cs137;
if Cs137=-99 and Pb210 ne -99 then SCrate=Pb210;
SCrate_unit="gC_m2";
proc export data=SoilCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-004\SoilCStock' replace dbms=excel;
run;