data oldcars;
  infile '/home/u48506455/sasuser.v94/Auction.dat.txt';
  input Make $ 1-13 model $ 15-29 YearMade Seats MillionsPaid;
  
  if YearMade < 1890 then 
   Veteran='Yes';
  if Model='F-88' then 
  do;
     Make='Oldsmobile';
     Seats=2;
    end;
run;

proc print data=oldcars;
  title'Cars sold at Auction';
run;

/*IF_THEN/ELSE statements*/
   
data homeimprovements;
  infile '/home/u48506455/sasuser.v94/Home.dat.txt';
  input Owner $ 1-7 Description $ 9-33 Cost;
   if Cost=. then 
     CostGroup='missing';
   else if Cost <2000 then 
     CostGroup='low';
   else if Cost <1000 then 
     CostGroup='medium';
   else
     CostGroup='high';
run;
proc print data=homeimprovements;
  title'Home improvements cost groups';
run;

/*do loops*/
data generate;
 do x=1 to 6;
  y=x**2;
  output;
 end;
 proc print data=generate;
  title'Generated data';
run;

/*DO UNTIL loop*/
data bank;
  interest_rate=.07;
  amount=1000;
  goal=2000;
  year=0;
  do until (amount gt goal);
   year=year+1;
   amount=amount+interest_rate*amount;
   output;
  end;
  format amount goal dollar9.2;
run;
proc print data=bank noobs;
  title'Listings of data set bank';
run;  
     
/*Project 3 Question 3*/
data question3;
  input Group $ Score;
datalines;
A 10
B 11
C 12
A 20
B 21
C 22
;
run;
proc print data=question3 noobs;
  title'Groups and scores';
run;
    
  

