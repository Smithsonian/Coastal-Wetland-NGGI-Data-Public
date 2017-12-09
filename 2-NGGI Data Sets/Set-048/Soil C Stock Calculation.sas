
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-048\48-Soil Carbon Stock Calculations.xlsx'
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
SCrate=SC_rate*SC*10000;
SCrate_unit="gC_m2";
proc export data=SoilCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-048\SoilCStock' replace dbms=excel;
run;