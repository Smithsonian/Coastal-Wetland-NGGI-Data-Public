
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-021\21-Soil Carbon Stock Calculations.xlsx'
	 out=SoilC
	 dbms=excel
     replace;
     sheet="Data";
run;
proc sort; by Site_ID;
run;
data SoilCdata; set SoilC;
SoilCC=0.074*(OM/100)*(OM/100) + 0.421*(OM/100) - 0.0080; /*SoilCC is soil C concentration, we used the equation developed by James Holmquist from the large soil profile database for converting from OM to C.  */
SoilCC_unit="gC_gsoil";
SC=SoilCC*BD;/*the unit for Soil C stock should be OC g/cc as OC g/cc = OC * Bulkdensity(g/cm3) */
SC_unit="OCg_cc";
if Pb210=-99 then Pb210=.;
if Cs137=-99 then Cs137=.;
SC_rate=SC*SCrate*10000;
proc means noprint; var SC SC_rate;
by Site_ID;
output out=SCdata(drop = _type_ _freq_)
mean=MSC MSC_rate;
run;
proc export data=SCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-021\SoilCStock' replace dbms=excel;
run;