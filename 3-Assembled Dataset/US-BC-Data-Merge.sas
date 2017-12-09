/*This program was written for the National Greenhouse Gas Inventory of US Coastal Wetlands. The purpose of the program is to assemble literature data on 
coastal wetland carbon stocks into a single dataset that can be analyzed by code. This is step 1 of the process. Here, the program read the data from many 
individual flat files, merges the data, and writes it out as CSV file. Each individual file represents the data from one publication. One of the flat files
is a large EPA dataset that is read separately before merging.*/

/******************************************************************************************************************************************************/
/************This section defines the format (numeric or alphanumeric) of all variables in the input file *********************************************/
/******************************************************************************************************************************************************/

Data Set1;
infile "S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-001\US-BC-Analysis-1.csv" delimiter = ','
MISSOVER DSD lrecl=32767 firstobs=2;
	informat PublicationID best32. ;
	informat First_Author $26. ;
	informat Year best32. ;
    informat Publication_Type best32. ;
    informat Source best32. ;
    informat Latitude best32. ;
    informat Longitude best32. ;
    informat Ecosystem $26. ;
    informat CCAP_Class $26. ;
    informat Climate_Zone $26. ;
    informat Salinity_Regime $26. ;
    informat Elevation best32. ;
    informat Tide_Range best32. ;
    informat MHW best32. ;
    informat Stature $26. ;
    informat Soil_Order $26. ;
    informat Management $26. ;
    informat Disturbance $26. ;
    informat Activity $26. ;
    informat Activity_Time best32. ;
    informat Current_Land_Use $26. ;
    informat Previous_Land_Use $26. ;
    informat CH4 best32. ;
    informat N2O best32. ;
    informat NEE best32. ;
    informat DOC best32. ;
    informat CO2 best32. ;
    informat Salinity_in_Soil best32. ;
    informat Salinity_in_Water best32. ;
    informat Species1 $26. ;
    informat Species2 $26. ;
    informat Species3 $26. ;
    informat BD best32. ;
    informat LOI best32. ;
    informat C best32. ;
    informat AGB best32. ;
    informat AGBunits $26. ;
    informat delAGB best32. ;
    informat delAGBunits $26. ;
    informat BGB best32. ;
    informat BGBunits $26. ;
    informat delBGB best32. ;
    informat delBGBunits $26. ;
    informat Unit_Source best32. ;
    informat Deadwood best32. ;
    informat Litter best32. ;
    informat SOC1 best32. ;
    informat SOC1units $26. ;
    informat SOC1depth best32. ;
    informat Roots best32. ;
    informat CalculationMethod $26. ;
    informat delSOC1Pb best32. ;
    informat delSOC1units $26. ;
	informat delSOC2Cs best32. ;
    informat delSOC2units $26. ;
    informat delSOC3Marker best32. ;
    informat delSOC3units $26. ;
    informat delSOC4SET best32. ;
    informat delSOC4units $26. ;
	informat delSOC5RadioC best32. ;
    informat delSOC5units $26. ;
      format PublicationID best32. ;
      format First_Author $26. ;
      format Year best32. ;
      format Publication_Type best32. ;
      format Source best32. ;
      format Latitude best32. ;
      format Longitude best32. ;
      format Ecosystem $26. ;
      format CCAP_Class $26. ;
      format Climate_Zone $26. ;
      format Salinity_Regime $26. ;
      format Elevation best32. ;
      format Tide_Range best32. ;
      format MHW best32. ;
      format Stature $26. ;
      format Soil_Order $26. ;
      format Management $26. ;
      format Disturbance $26. ;
      format Activity $26. ;
      format Activity_Time best32. ;
      format Current_Land_Use $26. ;
      format Previous_Land_Use $26. ;
      format CH4 best32. ;
      format N2O best32. ;
      format NEE best32. ;
      format DOC best32. ;
      format CO2 best32. ;
      format Salinity_in_Soil best32. ;
      format Salinity_in_Water best32. ;
      format Species1 $26. ;
      format Species2 $26. ;
      format Species3 $26. ;
      format BD best32. ;
      format LOI best32. ;
      format C best32. ;
      format AGB best32. ;
      format AGBunits $26. ;
      format delAGB best32. ;
      format delAGBunits $26. ;
      format BGB best32. ;
      format BGBunits $26. ;
      format delBGB best32. ;
      format delBGBunits $26. ;
      format Unit_Source best32. ;
      format Deadwood best32. ;
      format Litter best32. ;
      format SOC1 best32. ;
      format SOC1units $26. ;
      format SOC1depth best32. ;
      format Roots best32. ;
      format CalculationMethod $26. ;
      format delSOC1Pb best32. ;
      format delSOC1units $26. ;
	  format delSOC2Cs best32. ;
      format delSOC2units $26. ;
      format delSOC3Marker best32. ;
      format delSOC3units $26. ;
      format delSOC4SET best32. ;
      format delSOC4units $26. ;
	  format delSOC5RadioC best32. ;
      format delSOC5units $26. ;
input
PublicationID
First_Author $
Year
Publication_Type
Source
Latitude
Longitude
Ecosystem $
CCAP_Class $
Climate_Zone $
Salinity_Regime $
Elevation
Tide_Range
MHW
Stature $
Soil_Order $
Management $
Disturbance $
Activity $
Activity_Time
Current_Land_Use $
Previous_Land_Use $
CH4
N2O
NEE
DOC
CO2
Salinity_in_Soil
Salinity_in_Water
Species1 $
Species2 $
Species3 $
BD
LOI
C
AGB
AGBunits $
delAGB
delAGBunits $
BGB
BGBunits $
delBGB
delBGBunits $
Unit_Source
Deadwood
Litter
SOC1
SOC1units $
SOC1depth
Roots
CalculationMethod
delSOC1Pb
delSOC1units $
delSOC2Cs
delSOC2units $
delSOC3Marker
delSOC3units $
delSOC4SET
delSOC4units $
delSOC5RadioC
delSOC5units $;
run;


/***********************************************************************************************************************************/
/************This section reads flat files for prepared from individual publications ***********************************************/
/***********************************************************************************************************************************/

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-002\US-BC-Analysis-2.csv"
out=Set2
dbms=csv
replace;
proc append base=Set1 data=Set2 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-003\US-BC-Analysis-3.csv"
out=Set3
dbms=csv
replace;
proc append base=Set1 data=Set3 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-004\US-BC-Analysis-4.csv"
out=Set4
dbms=csv
replace;
proc append base=Set1 data=Set4 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-005\US-BC-Analysis-5.csv"
out=Set5
dbms=csv
replace;
proc append base=Set1 data=Set5 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-006\US-BC-Analysis-6.csv"
out=Set6
dbms=csv
replace;
proc append base=Set1 data=Set6 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-007\US-BC-Analysis-7.csv"
out=Set7
dbms=csv
replace;
proc append base=Set1 data=Set7 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-008\US-BC-Analysis-8.csv"
out=Set8
dbms=csv
replace;
proc append base=Set1 data=Set8 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-009\US-BC-Analysis-9.csv"
out=Set9
dbms=csv
replace;
proc append base=Set1 data=Set9 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-010\US-BC-Analysis-10.csv"
out=Set10
dbms=csv
replace;
proc append base=Set1 data=Set10 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-011\US-BC-Analysis-11.csv"
out=Set11
dbms=csv
replace;
proc append base=Set1 data=Set11 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-012\US-BC-Analysis-12.csv"
out=Set12
dbms=csv
replace;
proc append base=Set1 data=Set12 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-013\US-BC-Analysis-13.csv"
out=Set13
dbms=csv
replace;
proc append base=Set1 data=Set13 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-014\US-BC-Analysis-14.csv"
out=Set14
dbms=csv
replace; 
proc append base=Set1 data=Set14 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-015\US-BC-Analysis-15.csv"
out=Set15
dbms=csv
replace;
proc append base=Set1 data=Set15 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-016\US-BC-Analysis-16.csv"
out=Set16
dbms=csv
replace;
proc append base=Set1 data=Set16 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-017\US-BC-Analysis-17.csv"
out=Set17
dbms=csv
replace;
proc append base=Set1 data=Set17 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-018\US-BC-Analysis-18.csv"
out=Set18
dbms=csv
replace;
proc append base=Set1 data=Set18 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-019\US-BC-Analysis-19.csv"
out=Set19
dbms=csv
replace;
proc append base=Set1 data=Set19 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-020\US-BC-Analysis-20.csv"
out=Set20
dbms=csv
replace;
proc append base=Set1 data=Set20 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-021\US-BC-Analysis-21.csv"
out=Set21
dbms=csv
replace;
proc append base=Set1 data=Set21 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-022\US-BC-Analysis-22.csv"
out=Set22
dbms=csv
replace;
proc append base=Set1 data=Set22 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-023\US-BC-Analysis-23.csv"
out=Set23
dbms=csv
replace;
proc append base=Set1 data=Set23 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-024\US-BC-Analysis-24.csv"
out=Set24
dbms=csv
replace;
proc append base=Set1 data=Set24 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-025\US-BC-Analysis-25.csv"
out=Set25
dbms=csv
replace;
proc append base=Set1 data=Set25 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-026\US-BC-Analysis-26.csv"
out=Set26
dbms=csv
replace;
proc append base=Set1 data=Set26 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-027\US-BC-Analysis-27.csv"
out=Set27
dbms=csv
replace;
proc append base=Set1 data=Set27 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-028\US-BC-Analysis-28.csv"
out=Set28
dbms=csv
replace;
proc append base=Set1 data=Set28 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-029\US-BC-Analysis-29.csv"
out=Set29
dbms=csv
replace;
proc append base=Set1 data=Set29 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-030\US-BC-Analysis-30.csv"
out=Set30
dbms=csv
replace;
proc append base=Set1 data=Set30 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-031\US-BC-Analysis-31.csv"
out=Set31
dbms=csv
replace;
proc append base=Set1 data=Set31 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-032\US-BC-Analysis-32.csv"
out=Set32
dbms=csv
replace;
proc append base=Set1 data=Set32 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-033\US-BC-Analysis-33.csv"
out=Set33
dbms=csv
replace;
proc append base=Set1 data=Set33 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-034\US-BC-Analysis-34.csv"
out=Set34
dbms=csv
replace;
proc append base=Set1 data=Set34 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-035\US-BC-Analysis-35.csv"
out=Set35
dbms=csv
replace;
proc append base=Set1 data=Set35 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-036\US-BC-Analysis-36.csv"
out=Set36
dbms=csv
replace;
proc append base=Set1 data=Set36 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-037\US-BC-Analysis-37.csv"
out=Set37
dbms=csv
replace;
proc append base=Set1 data=Set37 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-038\US-BC-Analysis-38.csv"
out=Set38
dbms=csv
replace;
proc append base=Set1 data=Set38 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-039\US-BC-Analysis-39.csv"
out=Set39
dbms=csv
replace;
proc append base=Set1 data=Set39 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-040\US-BC-Analysis-40.csv"
out=Set40
dbms=csv
replace;
proc append base=Set1 data=Set40 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-041\US-BC-Analysis-41.csv"
out=Set41
dbms=csv
replace;
proc append base=Set1 data=Set41 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-042\US-BC-Analysis-42.csv"
out=Set42
dbms=csv
replace;
proc append base=Set1 data=Set42 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-043\US-BC-Analysis-43.csv"
out=Set43
dbms=csv
replace;
proc append base=Set1 data=Set43 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-044\US-BC-Analysis-44.csv"
out=Set44
dbms=csv
replace;
proc append base=Set1 data=Set44 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-045\US-BC-Analysis-45.csv"
out=Set45
dbms=csv
replace;
proc append base=Set1 data=Set45 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-046\US-BC-Analysis-46.csv"
out=Set46
dbms=csv
replace;
proc append base=Set1 data=Set46 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-047\US-BC-Analysis-47.csv"
out=Set47
dbms=csv
replace;
proc append base=Set1 data=Set47 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-048\US-BC-Analysis-48.csv"
out=Set48
dbms=csv
replace;
proc append base=Set1 data=Set48 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-049\US-BC-Analysis-49.csv"
out=Set49
dbms=csv
replace;
proc append base=Set1 data=Set49 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-050\US-BC-Analysis-50.csv"
out=Set50
dbms=csv
replace;
proc append base=Set1 data=Set50 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-051\US-BC-Analysis-51.csv"
out=Set51
dbms=csv
replace;
proc append base=Set1 data=Set51 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-052\US-BC-Analysis-52.csv"
out=Set52
dbms=csv
replace;
proc append base=Set1 data=Set52 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-053\US-BC-Analysis-53.csv"
out=Set53
dbms=csv
replace;
proc append base=Set1 data=Set53 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-054\US-BC-Analysis-54.csv"
out=Set54
dbms=csv
replace;
proc append base=Set1 data=Set54 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-055\US-BC-Analysis-55.csv"
out=Set55
dbms=csv
replace;
proc append base=Set1 data=Set55 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-056\US-BC-Analysis-56.csv"
out=Set56
dbms=csv
replace;
proc append base=Set1 data=Set56 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-057\US-BC-Analysis-57.csv"
out=Set57
dbms=csv
replace;
proc append base=Set1 data=Set57 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-058\US-BC-Analysis-58.csv"
out=Set58
dbms=csv
replace;
proc append base=Set1 data=Set58 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-059\US-BC-Analysis-59.csv"
out=Set59
dbms=csv
replace;
proc append base=Set1 data=Set59 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-060\US-BC-Analysis-60.csv"
out=Set60
dbms=csv
replace;
proc append base=Set1 data=Set60 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-061\US-BC-Analysis-61.csv"
out=Set61
dbms=csv
replace;
proc append base=Set1 data=Set61 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-062\US-BC-Analysis-62.csv"
out=Set62
dbms=csv
replace;
proc append base=Set1 data=Set62 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-063\US-BC-Analysis-63.csv"
out=Set63
dbms=csv
replace;
proc append base=Set1 data=Set63 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-064\US-BC-Analysis-64.csv"
out=Set64
dbms=csv
replace;
proc append base=Set1 data=Set64 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-065\US-BC-Analysis-65.csv"
out=Set65
dbms=csv
replace;
proc append base=Set1 data=Set65 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-066\US-BC-Analysis-66.csv"
out=Set66
dbms=csv
replace;
proc append base=Set1 data=Set66 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-067\US-BC-Analysis-67.csv"
out=Set67
dbms=csv
replace;
proc append base=Set1 data=Set67 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-068\US-BC-Analysis-68.csv"
out=Set68
dbms=csv
replace;
proc append base=Set1 data=Set68 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-069\US-BC-Analysis-69.csv"
out=Set69
dbms=csv
replace;
proc append base=Set1 data=Set69 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-070\US-BC-Analysis-70.csv"
out=Set70
dbms=csv
replace;
proc append base=Set1 data=Set70 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-071\US-BC-Analysis-71.csv"
out=Set71
dbms=csv
replace;
proc append base=Set1 data=Set71 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-072\US-BC-Analysis-72.csv"
out=Set72
dbms=csv
replace;
proc append base=Set1 data=Set72 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-073\US-BC-Analysis-73.csv"
out=Set73
dbms=csv
replace;
proc append base=Set1 data=Set73 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-074\US-BC-Analysis-74.csv"
out=Set74
dbms=csv
replace;
proc append base=Set1 data=Set74 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-075\US-BC-Analysis-75.csv"
out=Set75
dbms=csv
replace;
proc append base=Set1 data=Set75 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-076\US-BC-Analysis-76.csv"
out=Set76
dbms=csv
replace;
proc append base=Set1 data=Set76 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-077\US-BC-Analysis-77.csv"
out=Set77
dbms=csv
replace;
proc append base=Set1 data=Set77 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-078\US-BC-Analysis-78.csv"
out=Set78
dbms=csv
replace;
proc append base=Set1 data=Set78 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-079\US-BC-Analysis-79.csv"
out=Set79
dbms=csv
replace;
proc append base=Set1 data=Set79 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-080\US-BC-Analysis-80.csv"
out=Set80
dbms=csv
replace;
proc append base=Set1 data=Set80 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-081\US-BC-Analysis-81.csv"
out=Set81
dbms=csv
replace;
proc append base=Set1 data=Set81 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-082\US-BC-Analysis-82.csv"
out=Set82
dbms=csv
replace;
proc append base=Set1 data=Set82 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-083\US-BC-Analysis-83.csv"
out=Set83
dbms=csv
replace;
proc append base=Set1 data=Set83 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-084\US-BC-Analysis-84.csv"
out=Set84
dbms=csv
replace;
proc append base=Set1 data=Set84 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-085\US-BC-Analysis-85.csv"
out=Set85
dbms=csv
replace;
proc append base=Set1 data=Set85 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-086\US-BC-Analysis-86.csv"
out=Set86
dbms=csv
replace;
proc append base=Set1 data=Set86 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-087\US-BC-Analysis-87.csv"
out=Set87
dbms=csv
replace;
proc append base=Set1 data=Set87 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-088\US-BC-Analysis-88.csv"
out=Set88
dbms=csv
replace;
proc append base=Set1 data=Set88 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-089\US-BC-Analysis-89.csv"
out=Set89
dbms=csv
replace;
proc append base=Set1 data=Set89 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-090\US-BC-Analysis-90.csv"
out=Set90
dbms=csv
replace;
proc append base=Set1 data=Set90 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-091\US-BC-Analysis-91.csv"
out=Set91
dbms=csv
replace;
proc append base=Set1 data=Set91 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-092\US-BC-Analysis-92.csv"
out=Set92
dbms=csv
replace;
proc append base=Set1 data=Set92 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-093\US-BC-Analysis-93.csv"
out=Set93
dbms=csv
replace;
proc append base=Set1 data=Set93 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-094\US-BC-Analysis-94.csv"
out=Set94
dbms=csv
replace;
proc append base=Set1 data=Set94 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-095\US-BC-Analysis-95.csv"
out=Set95
dbms=csv
replace;
proc append base=Set1 data=Set95 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-096\US-BC-Analysis-96.csv"
out=Set96
dbms=csv
replace;
proc append base=Set1 data=Set96 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-097\US-BC-Analysis-97.csv"
out=Set97
dbms=csv
replace;
proc append base=Set1 data=Set97 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-098\US-BC-Analysis-98.csv"
out=Set98
dbms=csv
replace;
proc append base=Set1 data=Set98 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-099\US-BC-Analysis-99.csv"
out=Set99
dbms=csv
replace;
proc append base=Set1 data=Set99 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-100\US-BC-Analysis-100.csv"
out=Set100
dbms=csv
replace;
proc append base=Set1 data=Set100 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-101\US-BC-Analysis-101.csv"
out=Set101
dbms=csv
replace;
proc append base=Set1 data=Set101 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-102\US-BC-Analysis-102.csv"
out=Set102
dbms=csv
replace;
proc append base=Set1 data=Set102 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-103\US-BC-Analysis-103.csv"
out=Set103
dbms=csv
replace;
proc append base=Set1 data=Set103 force;
run;

proc import datafile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-104\US-BC-Analysis-104.csv"
out=Set104
dbms=csv
replace;
proc append base=Set1 data=Set104 force;
run;

/***********************************************************************************************************************************/
/************This section reads a single large files from an EPA Dataset *********** ***********************************************/
/***********************************************************************************************************************************/

Data Set105;
infile "S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\Set-105\US-BC-Analysis-105.csv" delimiter = ','
MISSOVER DSD lrecl=32767 firstobs=2;
	informat PublicationID best32. ;
	informat First_Author $26. ;
	informat Year best32. ;
    informat Publication_Type best32. ;
    informat Source best32. ;
    informat Latitude best32. ;
    informat Longitude best32. ;
    informat Ecosystem $26. ;
    informat CCAP_Class $26. ;
    informat Climate_Zone $26. ;
    informat Salinity_Regime $26. ;
    informat Elevation best32. ;
    informat Tide_Range best32. ;
    informat MHW best32. ;
    informat Stature $26. ;
    informat Soil_Order $26. ;
    informat Management $26. ;
    informat Disturbance $26. ;
    informat Activity $26. ;
    informat Activity_Time best32. ;
    informat Current_Land_Use $26. ;
    informat Previous_Land_Use $26. ;
    informat CH4 best32. ;
    informat N2O best32. ;
    informat NEE best32. ;
    informat DOC best32. ;
    informat CO2 best32. ;
    informat Salinity_in_Soil best32. ;
    informat Salinity_in_Water best32. ;
    informat Species1 $26. ;
    informat Species2 $26. ;
    informat Species3 $26. ;
    informat BD best32. ;
    informat LOI best32. ;
    informat C best32. ;
    informat AGB best32. ;
    informat AGBunits $26. ;
    informat delAGB best32. ;
    informat delAGBunits $26. ;
    informat BGB best32. ;
    informat BGBunits $26. ;
    informat delBGB best32. ;
    informat delBGBunits $26. ;
    informat Unit_Source best32. ;
    informat Deadwood best32. ;
    informat Litter best32. ;
    informat SOC1 best32. ;
    informat SOC1units $26. ;
    informat SOC1depth best32. ;
    informat Roots best32. ;
    informat CalculationMethod $26. ;
    informat delSOC1Pb best32. ;
    informat delSOC1units $26. ;
	informat delSOC2Cs best32. ;
    informat delSOC2units $26. ;
    informat delSOC3Marker best32. ;
    informat delSOC3units $26. ;
    informat delSOC4SET best32. ;
    informat delSOC4units $26. ;
	informat delSOC5RadioC best32. ;
    informat delSOC5units $26. ;
      format PublicationID best32. ;
      format First_Author $26. ;
      format Year best32. ;
      format Publication_Type best32. ;
      format Source best32. ;
      format Latitude best32. ;
      format Longitude best32. ;
      format Ecosystem $26. ;
      format CCAP_Class $26. ;
      format Climate_Zone $26. ;
      format Salinity_Regime $26. ;
      format Elevation best32. ;
      format Tide_Range best32. ;
      format MHW best32. ;
      format Stature $26. ;
      format Soil_Order $26. ;
      format Management $26. ;
      format Disturbance $26. ;
      format Activity $26. ;
      format Activity_Time best32. ;
      format Current_Land_Use $26. ;
      format Previous_Land_Use $26. ;
      format CH4 best32. ;
      format N2O best32. ;
      format NEE best32. ;
      format DOC best32. ;
      format CO2 best32. ;
      format Salinity_in_Soil best32. ;
      format Salinity_in_Water best32. ;
      format Species1 $26. ;
      format Species2 $26. ;
      format Species3 $26. ;
      format BD best32. ;
      format LOI best32. ;
      format C best32. ;
      format AGB best32. ;
      format AGBunits $26. ;
      format delAGB best32. ;
      format delAGBunits $26. ;
      format BGB best32. ;
      format BGBunits $26. ;
      format delBGB best32. ;
      format delBGBunits $26. ;
      format Unit_Source best32. ;
      format Deadwood best32. ;
      format Litter best32. ;
      format SOC1 best32. ;
      format SOC1units $26. ;
      format SOC1depth best32. ;
      format Roots best32. ;
      format CalculationMethod $26. ;
      format delSOC1Pb best32. ;
      format delSOC1units $26. ;
	  format delSOC2Cs best32. ;
      format delSOC2units $26. ;
      format delSOC3Marker best32. ;
      format delSOC3units $26. ;
      format delSOC4SET best32. ;
      format delSOC4units $26. ;
	  format delSOC5RadioC best32. ;
      format delSOC5units $26. ;
input
PublicationID
First_Author $
Year
Publication_Type
Source
Latitude
Longitude
Ecosystem $
CCAP_Class $
Climate_Zone $
Salinity_Regime $
Elevation
Tide_Range
MHW
Stature $
Soil_Order $
Management $
Disturbance $
Activity $
Activity_Time
Current_Land_Use $
Previous_Land_Use $
CH4
N2O
NEE
DOC
CO2
Salinity_in_Soil
Salinity_in_Water
Species1 $
Species2 $
Species3 $
BD
LOI
C
AGB
AGBunits $
delAGB
delAGBunits $
BGB
BGBunits $
delBGB
delBGBunits $
Unit_Source
Deadwood
Litter
SOC1
SOC1units $
SOC1depth
Roots
CalculationMethod
delSOC1Pb
delSOC1units $
delSOC2Cs
delSOC2units $
delSOC3Marker
delSOC3units $
delSOC4SET
delSOC4units $
delSOC5RadioC
delSOC5units $;
run;

/***********************************************************************************************************************************/
/************This section appends the individual files into a single file **********************************************************/
/***********************************************************************************************************************************/
proc append base=Set1 data=Set105 force;
run;

/***********************************************************************************************************************************/
/************This section writes the assembled file into a single CSV file *********************************************************/
/***********************************************************************************************************************************/

proc export data=Set1
outfile="S:\Biogeochemistry\NOAA US Carbon Accounting\US Coastal Carbon Accounting\3-Third Data Compilation\3-DataMerge\US-BC-Analysis-1-105.csv" replace dbms=csv;
run;