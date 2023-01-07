/*week 1 writing first  SAS program*/
data distance;
 miles=26.22;
 kilometers=1.61*miles;
proc print data=distance;
run;