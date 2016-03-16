Data Rich.mdata;
Input Group	NetWt Count;
Datalines;
2	51.8	20.0
2	51.3	20.5
2	53.2	19.5
2	50.9	19.0
2	49.8	20.0
2	53.1	22.0
2	51.5	20.0
2	46.2	18.0
2	50.1	20.0
2	50.0	20.0
2	46.1	18.0
2	46.7	18.0
2	52.8	20.0
2	49.3	19.0
2	48.5	19.0
2	49.3	20.0
2	51.1	19.0
2	51.1	19.0
2	50.5	18.0
2	51.4	20.0
2	47.7	19.0
2	52.5	21.0
2	51.9	22.0
2	50.8	19.0
3	48.8	18.0
3	51.3	21.0
3	52.9	21.0
3	52.0	21.0
3	47.4	19.0
3	50.6	20.0
3	50.7	20.0
3	49.3	19.0
3	50.8	21.0
3	52.4	21.0
3	49.2	20.0
3	52.2	20.0
3	51.1	20.0
3	51.8	20.0
3	49.4	18.0
3	48.6	19.0
3	48.2	18.0
3	48.5	19.0
3	50.6	20.0
3	52.1	21.0
3	50.4	19.0
3	48.8	19.0
3	50.5	21.0
3	49.4	19.0
5	48.7	20.0
5	52.1	21.0
5	49.0	19.0
5	49.9	20.0
5	51.1	20.0
5	51.8	20.0
5	50.3	20.0
5	49.7	19.0
5	50.1	19.0
5	50.6	20.0
5	52.9	21.0
5	49.2	19.0
5	47.9	19.0
5	50.4	20.0
5	50.5	20.0
5	51.3	21.0
5	51.8	20.0
5	49.2	19.0
5	50.5	20.0
5	49.4	19.0
5	52.9	20.0
5	51.5	20.0
5	48.8	19.0
5	47.4	19.0
6	48.7	18.0
6	49.4	19.0
6	49.3	19.0
6	49.8	20.0
6	50.5	20.0
6	49.8	19.0
6	51.5	20.0
6	50.3	20.0
6	48.8	18.0
6	52.7	20.0
6	50.7	19.0
6	49.4	18.0
6	52.9	21.0
6	50.3	20.0
6	50.9	20.0
6	50.0	19.0
6	51.6	20.0
6	47.9	18.0
6	48.1	19.0
6	47.6	19.0
6	48.9	19.0
6	49.4	19.0
6	50.6	19.0
6	44.4	17.0
7	51.8	20.0
7	48.9	19.0
7	52.3	19.0
7	50.6	21.0
7	48.7	19.0
7	53.5	21.0
7	49.8	20.0
7	47.0	20.0
7	50.5	19.0
7	50.9	20.0
7	50.7	20.0
7	50.8	20.0
7	54.6	22.0
7	49.7	20.0
7	51.5	20.0
7	49.2	19.0
7	52.0	20.0
7	48.9	18.0
7	49.0	20.0
7	50.7	20.0
7	49.7	19.0
7	50.5	19.0
7	51.0	19.0
7	46.4	19.0
8	49.1	20.0
8	50.4	20.0
8	51.6	20.0
8	48.3	18.0
8	50.1	19.0
8	50.9	19.0
8	49.7	19.0
8	49.6	18.0
8	48.1	18.0
8	52.6	20.0
8	51.8	20.0
8	49.1	19.0
8	48.1	18.0
8	51.0	20.0
8	51.0	20.0
8	49.4	20.0
8	46.8	17.0
8	51.0	20.0
8	51.1	19.0
8	51.3	21.0
8	49.8	18.0
8	51.0	20.0
8	52.9	20.0
8	52.3	19.0
9	48.2	19.0
9	49.5	20.0
9	48.8	18.0
9	50.0	19.0
9	51.5	20.0
9	46.6	18.0
9	52.2	22.0
9	52.1	21.0
9	50.1	20.0
9	49.9	19.0
9	49.2	19.0
9	48.8	19.0
9	52.2	20.0
9	51.2	20.0
9	52.7	21.0
9	50.1	20.0
9	47.6	19.0
9	50.5	19.0
9	50.3	20.0
9	52.7	20.0
9	47.5	18.0
9	50.8	20.0
9	47.4	18.0
9	50.2	19.0
10	50.2	20.0
10	48.8	19.0
10	50.0	20.0
10	50.7	20.0
10	45.6	17.0
10	48.5	20.0
10	50.6	21.0
10	49.9	19.0
10	48.8	18.0
10	44.1	17.0
10	50.5	19.0
10	52.3	20.0
10	51.5	20.0
10	52.1	21.0
10	52.9	22.0
10	50.8	21.0
10	51.9	22.0
10	49.7	20.0
10	48.3	17.0
10	50.6	20.0
10	49.8	19.0
10	49.6	20.0
10	51.1	21.0
10	49.0	19.0
;
Run;


proc print data=rich.Mdata;
run;
Proc Sgplot data=rich.Mdata;
	Scatter x=Count y=NetWt;
	title 'Net Weights of Bags of MM versus Count';
Run;

Data Rich.Temp;
Set Rich.mdata;
RdCount=round(Count);
run;

Proc univariate data=rich.temp noprint;
Class RdCount;
Histogram NetWt / nrows=6 normal(noprint);
run; 

proc reg data=rich.mdata outest=rich.regre_model;
model netwt=count;
by group;
run;
