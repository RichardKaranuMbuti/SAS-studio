/*Checking for missing values in the transaction dataset */
ods noproctitle;

proc format;
	value _nmissprint low-high="Non-missing";
run;

proc freq data=WORK.TRANSACTIONS;
	title3 "Missing Data Frequencies";
	title4 h=2 "Legend: ., A, B, etc = Missing";
	format 'GL Account'n _nmissprint.;
	tables 'GL Account'n / missing nocum;
run;

title3;
ods noproctitle;

proc format;
	value _nmissprint low-high="Non-missing";
	value $_cmissprint " "=" " other="Non-missing";
run;

proc freq data=WORK.TRANSACTIONS;
	title3 "Missing Data Frequencies";
	title4 h=2 "Legend: ., A, B, etc = Missing";
	format 'GL Account'n Vendor 'Purchase Amount'n PO_Number 'Document Number'n 
		_nmissprint.;
	format 'Payment Type'n 'Order Type'n $_cmissprint.;
	tables 'GL Account'n Vendor 'Purchase Amount'n PO_Number 'Document Number'n 
		'Payment Type'n 'Order Type'n / missing nocum;
run;

proc freq data=WORK.TRANSACTIONS noprint;
	table 'GL Account'n * Vendor * 'Purchase Amount'n * PO_Number * 
		'Document Number'n * 'Payment Type'n * 'Order Type'n / missing 
		out=Work._MissingData_;
	format 'GL Account'n Vendor 'Purchase Amount'n PO_Number 'Document Number'n 
		_nmissprint.;
	format 'Payment Type'n 'Order Type'n $_cmissprint.;
run;

proc print data=Work._MissingData_ noobs label;
	title3 "Missing Data Patterns across Variables";
	title4 h=2 "Legend: ., A, B, etc = Missing";
	format 'GL Account'n Vendor 'Purchase Amount'n PO_Number 'Document Number'n 
		_nmissprint.;
	format 'Payment Type'n 'Order Type'n $_cmissprint.;
	label count="Frequency" percent="Percent";
run;

title3;

/* Clean up */
proc delete data=Work._MissingData_;
run;

/* Deleting rows with at least one missing value */
data WORK.TRANSACTIONS_clean;
 set WORK.TRANSACTIONS;
 if cmiss(of _all_) then delete;
run;

/*sorting the data*/
proc sort data=WORK.TRANSACTIONS_CLEAN out=work.sortedoutput1 equals;
	by 'GL Account'n 'Payment Type'n 'Order Type'n Vendor;
run;