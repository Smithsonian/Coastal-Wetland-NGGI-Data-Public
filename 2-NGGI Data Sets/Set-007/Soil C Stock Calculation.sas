
proc import datafile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-007\7-Soil Carbon Stock Calculations.xlsx'
	 out=SoilC
	 dbms=excel
     replace;
     sheet="Data";
run;
data SoilCdata; set SoilC;
SC=(OC*1000)*12/(0.3*10000*1000000);/*[Blanca’s Response] very tricky. this was in the dataset they gave me already. use the organic C kmol/ha of natural and created 1998 numbers doing this conversion: 

10270 kmol = 10270*10^3 mol;
1ha = 10^4 m2
30 cm = 0.3 m

(10270*10^3)/(0.3*10^4) = 3423 mol C/m3

1 mol C = 12 g C
1 m3 = 10^6 cm3 (cm3 = cc)

3423*12/10^6 = 0.04108 gC/cc
 */
SC_unit="OCg_cc";

proc export data=SoilCdata
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-007\SoilCStock' replace dbms=excel;
run;