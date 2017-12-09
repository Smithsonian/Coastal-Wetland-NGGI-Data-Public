
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-051\51-Soil Carbon Stock Calculations.xlsx'
	 out=SoilC
	 dbms=excel
     replace;
     sheet="Data";
run;
proc sort; by Site_ID Depth;
run;
data SoilCdata; set SoilC;
SoilCC=0.074*(OM/100)*(OM/100) + 0.421*(OM/100) - 0.0080; /*SoilCC is soil C concentration, we used the equation developed by James Holmquist from the large soil profile database for converting from OM to C.  */
SoilCC_unit="gC_gsoil";
SC=SoilCC*BD;/*the unit for Soil C stock should be OC g/cc as OC g/cc = OM * Bulkdensity(g/cm3) */
SC_unit="OCg_cc";
proc means noprint; var SC;
by Site_ID;
output out=SCdata(drop = _type_ _freq_)
mean=MSC;
run;

proc export data=SCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-051\SoilCStock' replace dbms=excel;
run;