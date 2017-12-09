/*This program was written for the National Greenhouse Gas Inventory of US Coastal Wetlands. The purpose of the program is to calculate Geomean results for 
different ecosystem and climate zones. Here, the program read the data from the assembled data set that was merged from 105 individual data set, and converted
the original data to log10 value for geomean calculation. Details of the SAS codes and calculation can be found below.*/

/******************************************************************************************************************************************************/
/********************This section read in the assembled data set that was merged from 105 indivudual data set *****************************************/
/******************************************************************************************************************************************************/


proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\1-Coastal Wetland NGGI Data\4-Data Analysis\Coastal Carbon NGGI Data.xlsx"
	 out=Alldata
	 dbms=excel
     replace;
     sheet="Data";

/******************************************************************************************************************************************************/
/********************This section converted the original data for each variable to log10 value for geomean calculation ********************************/
/******************************************************************************************************************************************************/

data Cal1; set Alldata;
if AGBunits='g_m2' then NewAGB=log10(AGB/100);
if AGBunits='gC_m2' then NewAGB=log10(AGB*2/100);
if AGBunits='kg_ha' then NewAGB=log10(AGB/1000);
if AGBunits='Mg_ha' then NewAGB=log10(AGB); 
if AGBunits='MgC_ha' then NewAGB=log10(AGB*2); 
if delAGBunits='g_m2' then NewdelAGB=log10(delAGB/100);
if delAGBunits='Mg_ha' then NewdelAGB=log10(delAGB);

if BGBunits='g_m2' then NewBGB=log10(BGB/100);
if BGBunits='gC_m2' then NewBGB=log10(BGB*2/100);
if BGBunits='Mg_ha' then NewBGB=log10(BGB); 
if BGBunits='MgC_ha' then NewBGB=log10(BGB*2); 
if delBGBunits='g_m2' then NewdelBGB=log10(delBGB/100);
if delBGBunits='Mg_ha' then NewdelBGB=log10(delBGB);

if SOC1units='gC_m2' then NewSOC1=log10(SOC1/100);
if SOC1units='MgC_ha' then NewSOC1=log10(SOC1);
if SOC1units='OCg_cc' then NewSOC1=log10(SOC1*10000);

if delSOC1units='gC_m2' then NewdelSOC1Pb=log10(delSOC1Pb/100);

if delSOC2units='gC_m2' then NewdelSOC2Cs=log10(delSOC2Cs/100);

/******************************************************************************************************************************************************/
/********This section defined and converted the ecosystem type from the original data set (mangrove, marsh, tidal fresh marsh/forest) *****************/
/******************************************************************************************************************************************************/

if Ecosystem='marsh' then Ecosystem='Estuarine_Emergent_Wetlands';
if Ecosystem='mangrove' and Stature='shrub' then Ecosystem='Estuarine_Emergent_Wetlands';
if Ecosystem='mangrove' and Stature ne 'shrub' then Ecosystem='Estuarine_Forested_Wetlands';
if Ecosystem='tidal_fresh_marsh' then Ecosystem='Palustrine_Emergent_Wetland';
if Ecosystem='tidal_fresh_forest' then Ecosystem='Palustrine_Forested_Wetland';

if Management = 'D' or Management = 'M' or Management = 'R' then delete; /*We only included Natural Ecosystem in this calculation, disturbed, managed or restored systems were not included in this version */

proc sort; by Management Ecosystem Climate_Zone Latitude;

/******************************************************************************************************************************************************/
/********************************This section calculated the mean values for the converted log10 data *************************************************/
/******************************************************************************************************************************************************/

proc means noprint; var NewAGB NewdelAGB NewBGB NewdelBGB NewSOC1 NewdelSOC1Pb NewdelSOC2Cs;
by Management Ecosystem Climate_Zone; 
output out=Calculation (drop = _type_ _freq_) 
mean=MNewAGB MNewdelAGB MNewBGB MNewdelBGB MNewSOC1 MNewdelSOC1Pb MNewdelSOC2Cs 
median=MeNewAGB MeNewdelAGB MeNewBGB MeNewdelBGB MeNewSOC1 MeNewdelSOC1Pb MeNewdelSOC2Cs 
stderr=SeNewAGB SeNewdelAGB SeNewBGB SeNewdelBGB SeNewSOC1 SeNewdelSOC1Pb SeNewdelSOC2Cs
stdDev=SdNewAGB SdNewdelAGB SdNewBGB SdNewdelBGB SdNewSOC1 SdNewdelSOC1Pb SdNewdelSOC2Cs
N=NNewAGB NNewdelAGB NNewBGB NNewdelBGB NNewSOC1 NNewdelSOC1Pb NNewdelSOC2Cs;
run;

/******************************************************************************************************************************************************/
/***************This section calculated the geomean, lower and upper 95%CI of geomean, and sample size for each variable*******************************/
/******************************************************************************************************************************************************/

data Cal2; set Calculation;
MGeoAGB=10**MNewAGB;
MGeodelAGB=10**MNewdelAGB;
MGeoBGB=10**MNewBGB;
MGeodelBGB=10**MNewdelBGB;
MGeoSOC1=10**MNewSOC1;
MGeodelSOC1Pb=10**MNewdelSOC1Pb;
MGeodelSOC2Cs=10**MNewdelSOC2Cs;

MeGeoAGB=10**MeNewAGB;
MeGeodelAGB=10**MeNewdelAGB;
MeGeoBGB=10**MeNewBGB;
MeGeodelBGB=10**MeNewdelBGB;
MeGeoSOC1=10**MeNewSOC1;
MeGeodelSOC1Pb=10**MeNewdelSOC1Pb;
MeGeodelSOC2Cs=10**MeNewdelSOC2Cs;

SeGeoAGB=10**SeNewAGB;
SeGeodelAGB=10**SeNewdelAGB;
SeGeoBGB=10**SeNewBGB;
SeGeodelBGB=10**SeNewdelBGB;
SeGeoSOC1=10**SeNewSOC1;
SeGeodelSOC1Pb=10**SeNewdelSOC1Pb;
SeGeodelSOC2Cs=10**SeNewdelSOC2Cs;

SdGeoAGB=10**SdNewAGB;
SdGeodelAGB=10**SdNewdelAGB;
SdGeoBGB=10**SdNewBGB;
SdGeodelBGB=10**SdNewdelBGB;
SdGeoSOC1=10**SdNewSOC1;
SdGeodelSOC1Pb=10**SdNewdelSOC1Pb;
SdGeodelSOC2Cs=10**SdNewdelSOC2Cs;

CIMNewAGB=SeNewAGB*1.96;
CIMNewdelAGB=SeNewdelAGB*1.96;
CIMNewBGB=SeNewBGB*1.96;
CIMNewdelBGB=SeNewdelBGB*1.96;
CIMNewSOC1=SeNewSOC1*1.96;
CIMNewdelSOC1Pb=SeNewdelSOC1Pb*1.96;
CIMNewdelSOC2Cs=SeNewdelSOC2Cs*1.96;

LowerCIGeoAGB=10**(MNewAGB-CIMNewAGB);
LowerCIGeodelAGB=10**(MNewdelAGB-CIMNewdelAGB);
LowerCIGeoBGB=10**(MNewBGB-CIMNewBGB);
LowerCIGeodelBGB=10**(MNewdelBGB-CIMNewdelBGB);
LowerCIGeoSOC1=10**(MNewSOC1-CIMNewSOC1);
LowerCIGeodelSOC1Pb=10**(MNewdelSOC1Pb-CIMNewdelSOC1Pb);
LowerCIGeodelSOC2Cs=10**(MNewdelSOC2Cs-CIMNewdelSOC2Cs);

UpperCIGeoAGB=10**(MNewAGB+CIMNewAGB);
UpperCIGeodelAGB=10**(MNewdelAGB+CIMNewdelAGB);
UpperCIGeoBGB=10**(MNewBGB+CIMNewBGB);
UpperCIGeodelBGB=10**(MNewdelBGB+CIMNewdelBGB);
UpperCIGeoSOC1=10**(MNewSOC1+CIMNewSOC1);
UpperCIGeodelSOC1Pb=10**(MNewdelSOC1Pb+CIMNewdelSOC1Pb);
UpperCIGeodelSOC2Cs=10**(MNewdelSOC2Cs+CIMNewdelSOC2Cs);

NGeoAGB=NNewAGB;
NGeodelAGB=NNewdelAGB;
NGeoBGB=NNewBGB;
NGeodelBGB=NNewdelBGB;
NGeoSOC1=NNewSOC1;
NGeodelSOC1Pb=NNewdelSOC1Pb;
NGeodelSOC2Cs=NNewdelSOC2Cs;
run;

/******************************************************************************************************************************************************/
/*****************************************This section retain and output the geomean results***********************************************************/
/******************************************************************************************************************************************************/

data write; retain Management Ecosystem Climate_Zone MGeoAGB LowerCIGeoAGB UpperCIGeoAGB NGeoAGB MGeodelAGB LowerCIGeodelAGB UpperCIGeodelAGB NGeodelAGB MGeoBGB LowerCIGeoBGB UpperCIGeoBGB NGeoBGB MGeodelBGB LowerCIGeodelBGB UpperCIGeodelBGB NGeodelBGB
 MGeoSOC1 LowerCIGeoSOC1 UpperCIGeoSOC1 NGeoSOC1 MGeodelSOC1Pb LowerCIGeodelSOC1Pb UpperCIGeodelSOC1Pb NGeodelSOC1Pb MGeodelSOC2Cs LowerCIGeodelSOC2Cs UpperCIGeodelSOC2Cs NGeodelSOC2Cs; set cal2;
proc export data=write
outfile='S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\1-Coastal Wetland NGGI Data\4-Data Analysis\RetainGEOMEAN1-105' replace dbms=excel;
run;