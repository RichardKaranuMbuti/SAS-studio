data old_miss;
  input id $ age;
  if missing(age) then 
    age_group=.;
  else if age le 50 then 
    age_group=2;
  else
    age_group=2;
  datalines;
 001 15
 002 .
 003 78
 004 26
 ;
 proc print data=old_miss noobs;
    title 'Listing of data set Ole_miss';
run;

data freeform;
  input test $ @@;
  retain group;
  
  if test= 'A' or test='B' then
     do;
         group =test;
         delete;
      end;
  else;
       score=input(test,5.);
    drop test;
    datalines;
A 45 55 B 87 A 44 23 B 88 99
;
proc print data = freeform noobs;
   title 'listings of data set freefoam';
run;


proc format;
      value agegrp low-20='1' 21-40='2' 41-60='3' 61-high='4';
run;
data puteg;
   input age @@;
   age4=put (age, agegrp.);
   datalines;
5 10 15 20 25 30 66 68 99
;
run;


data how_long;
  length string $ 5 miss $ 4;
  string='Abe';
  miss='';
  length_string=lengthn(string);
  store_string=lengthc(string);
  display=':' || string || ':';
  length_miss=length(miss);
  store_miss=lengthc(miss);
run;

proc print data=how_long noobs;
 title 'Listings of Dataset how_long';
run;
  
  
  
data example;
  input id $ 1-4 answer $ 5-9;
  p=verify(answer,'ABCDE');
datalines;
001 ABCDE
002 ABXDE
003 12CCE
004 ABC E
;
run;

proc print data=example noobs;
   title'Listing of example';
run;



data health_survey;
  input id $ age height weight heart_rate sbp dbp;
  array miss(6) age height weight heart_rate sbp dbp;
  
  do i=1 to 6;
  
    if miss[i]=999 then
      miss[i]=.;
      
    end;
    drop i;
    datalines;
001 23 68 190 68 120 999
002 56 72 220 76 140 88 
003 37 999 999 80 132 78
004 82 60 110 80 999 999
;

proc print data=health_survey noobs;
   title' listing of Data set health_survey';
run;


/*Using temporary array to determine the number of tests passed*/
data passing;
    array pass[5]_temporary_ (65 70 65 80 75);
    array score[5];
    input id$ score [*];
    pass_num=0;
    
    do i=1 to 5;
    
    if score[i] ge pass[i] then  
      pass_num+1;
   end;
   drop i ;
   datalines;
001 64 69 68 82 74
002 80 80 80 60 80
;

proc print data=passing;
  title 'passing Data set' ;
  id id;
  var pass_num score1-score5;
run;



data many;
   input X1-X5 Y1-Y5;
   datalines;
1 2 3 4 5 6 7 8 9 10
3 . 5 . 7 5 . . . 15

9 8 . . . 4 4 4 4 1
;
run;

data SUMMARY;
   Set many;
   mean_x=mean(OF X1-X5);
   mean_y=mean(OF Y1-Y5);
   MIN_X=min(OF X1-X5);
   MIN_Y=min(OF Y1-Y5);
run;
proc print data=SUMMARY noobs;
run;
