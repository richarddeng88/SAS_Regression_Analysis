libname rich 'C:\Users\q.deng\Desktop\regression'; * Reference a SAS data library;

proc print data=rich.Mdata (obs=10);run;

Proc Sgplot data=rich.Mdata;
	Scatter x=Count y=NetWt;
	reg x=count y=netwt/ clm cli CLMtransparency=0.2;
	title 'Net Weights of Bags of MM versus Count';
Run;

Data Rich.Temp;
Set Rich.mdata;
RdCount=round(Count);
run;

proc print data=rich.temp (obs=10);run;

Proc univariate data=rich.temp noprint;
Class RdCount;
Histogram NetWt / nrows=6 normal(noprint);
run; 

proc reg data=rich.mdata;
model netwt=count;
*by group;
run;











