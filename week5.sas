/*This program reads temparature in degrees celcius and convert them to degrees farhreheit*/
Data convert;
 infile '/home/u48506455/sasuser.v94/celsius.txt' dlm=',';
 input Temp_C;
 Temp_F=1.8*Temp_C+32;
run;
title "Temperature conversion chart";
proc print data=convert;
var Temp_C Temp_F;
run;


data work.data1;
  name='Mike';
  x=1;
  output;
  name='Steve';
  x=2;
  output;
run;

proc sql;
  create table work.sqltry1
  (name char(5),
  x num,
  y num);
quit;

proc sql outobs=15;
 create table work.sqlmytry2 as
 select * from sashelp.cars;
 select * from work.sqlmytru2;
quit;