Data RegPlot;
Input PRICE	GI AS TAX TLYR FRT RET RSDT;

Datalines;
2650000	464912.3	828500	0.0915	75841	81	0	34026
2600000	320987.7	650000	0.0915	59501	151.25	0	72002
2546000	190000	425700	0.0915	38969	52.5	0	31360
260000	152941.2	151420	0.0915	13861	129.92	0	58596
1358500	209000	336000	0.0915	30757	100.08	0	43326
2800000	608695.7	1256700	0.0915	115038	66.83	0	45496
1200000	193548.4	370700	0.0915	33934	99.92	0	70863
1535000	247580.6	416700	0.0915	38145	259.33	0	42864
968000	176000	258100	0.0915	23626	100	5500	34453
1500000	326087	509400	0.0915	46630	99.92	5000	63735
3250000	67567.57	625000	0.0915	57213	90.5	0	23165
4026000	821632.7	1710000	0.0915	156533	174.58	16500	105300
600000	136363.6	149000	0.0915	13639	25	0	10782
999000	120361.4	303950	0.0915	27824	37.5	0	14830
1800000	243243.2	124000	0.0915	11351	99.25	0	43520
2822500	344207.3	386000	0.0915	35334	100	0	42186
193000	148461.5	117900	0.0915	10793	100	0	42588
615000	170833.3	86000	0.0915	7872	100	0	42338
1300000	276595.7	320000	0.0915	29293	100	0	44154
910000	211627.9	264600	0.0915	24221	75	0	44820
970000	179629.6	162000	0.0915	14829	75	0	34386
1330000	170512.8	205000	0.0915	18766	100	0	43706
5250000	656250	1465000	0.0915	134106	60	800	86350
715000	148958.3	200400	0.0915	18345	52.25	3530	21766
2000000	487804.9	455000	0.0915	41651	129.58	5000	79318
2130000	463043.5	594000	0.0915	54375	96.08	10000	50963
250000	65789.47	108000	0.0915	9886	26	0	10785
1400000	285714.3	385000	0.0915	35243	65	2139	26175
970000	119753.1	445500	0.0915	40781	30	2250	9000
1500000	120000	445400	0.0915	40772	30	2250	9000
1800000	257142.9	441000	0.0915	40369	52.5	0	20795
2337500	181201.6	421600	0.0915	38593	19.67	0	21229
740000	224242.4	276400	0.0989	27322	102.42	0	61812
1800000	418604.7	868050	0.0989	85807	150	2000	61912
1900000	256756.8	686850	0.0989	67895	78	0	30225
295000	122916.7	90000	0.0989	8897	75	0	30978
725000	185897.4	247500	0.0989	24465	100	0	42926
2300000	377049.2	1330500	0.0989	131520	25.17	1450	17853
995000	268918.9	286680	0.0989	28338	99.92	4000	43526
1230000	279545.5	385770	0.0989	38133	100	4000	41312
2000000	298507.5	499500	0.0989	49376	126.17	4000	71381
3560000	134339.6	1388700	0.0989	137273	241.92	13000	123060
4340000	818867.9	1254750	0.0989	124032	75	4000	78172
327000	181666.7	305850	0.0989	30233	100	800	43822
2200000	500000	583900	0.0989	57719	104.92	7900	65436
1851025	330540.2	660700	0.0989	65310	82.5	4332	21660
860000	86868.69	354150	0.0989	35008	25	500	10831
978000	208085.1	242190	0.0989	23940	40	0	18654
950000	161016.9	352000	0.0989	34795	27.33	0	8505
1200000	333333.3	861000	0.0991	85325	222.08	0	55543
1088000	178360.7	411750	0.0991	40804	100	0	42108
560000	143589.7	159600	0.0991	15816	144.5	0	61602
2385000	397500	888750	0.0991	88075	100	0	75312
975000	348214.3	764900	0.0991	75802	46	4050	12727
1250000	260416.7	452000	0.0991	44793	111.33	4000	63838
359000	163181.8	265050	0.0991	26266	75	0	31668
5000000	240384.6	2881500	0.0991	285557	75	5400	43139
1375000	259434	430900	0.0991	42702	75	3000	43050
4350000	725000	1270350	0.0991	125892	89.33	0	64840
4200000	875000	1360200	0.1037	141039	72.42	0	91494
661000	71847.83	204750	0.1037	21231	17.17	0	4866
4280000	856000	1440630	0.1037	149379	100	0	75926
945000	242307.7	268150	0.1037	27804	100	0	42874
916000	305333.3	486000	0.1037	50393	231.92	0	66366
3290000	514062.5	1027900	0.1037	106583	74	3750	33312
2275000	307432.4	416520	0.1037	43189	59.25	0	26910
140000	100000	133230	0.1037	13815	85	0	37038
1700000	485714.3	795690	0.1037	82505	150	0	90298
530000	265000	222210	0.1037	23041	99.08	0	42924
;

proc reg plots(label)=criteria; 
	/* provides a one-page summary of model selection plots.
	The "label" argument puts the best model Index Number on the plots, 
so that we can find it in the Selection output list, below! */

model Price=GI AS TAX FRT RET RSDT / selection= adjrsq cp aic sbc;				
/* lists all possible models(!),ordered by Adjrsq, 
	and shows all criteria values */
run;

Data RegPlot;
Input PRICE	GI AS TAXRAT TAXSLYR FRNTG RETAIL RESIDL;

Datalines;
2650000	464912.3	828500	0.0915	75841	81	0	34026
2600000	320987.7	650000	0.0915	59501	151.25	0	72002
2546000	190000	425700	0.0915	38969	52.5	0	31360
260000	152941.2	151420	0.0915	13861	129.92	0	58596
1358500	209000	336000	0.0915	30757	100.08	0	43326
2800000	608695.7	1256700	0.0915	115038	66.83	0	45496
1200000	193548.4	370700	0.0915	33934	99.92	0	70863
1535000	247580.6	416700	0.0915	38145	259.33	0	42864
968000	176000	258100	0.0915	23626	100	5500	34453
1500000	326087	509400	0.0915	46630	99.92	5000	63735
3250000	67567.57	625000	0.0915	57213	90.5	0	23165
4026000	821632.7	1710000	0.0915	156533	174.58	16500	105300
600000	136363.6	149000	0.0915	13639	25	0	10782
999000	120361.4	303950	0.0915	27824	37.5	0	14830
1800000	243243.2	124000	0.0915	11351	99.25	0	43520
2822500	344207.3	386000	0.0915	35334	100	0	42186
193000	148461.5	117900	0.0915	10793	100	0	42588
615000	170833.3	86000	0.0915	7872	100	0	42338
1300000	276595.7	320000	0.0915	29293	100	0	44154
910000	211627.9	264600	0.0915	24221	75	0	44820
970000	179629.6	162000	0.0915	14829	75	0	34386
1330000	170512.8	205000	0.0915	18766	100	0	43706
5250000	656250	1465000	0.0915	134106	60	800	86350
715000	148958.3	200400	0.0915	18345	52.25	3530	21766
2000000	487804.9	455000	0.0915	41651	129.58	5000	79318
2130000	463043.5	594000	0.0915	54375	96.08	10000	50963
250000	65789.47	108000	0.0915	9886	26	0	10785
1400000	285714.3	385000	0.0915	35243	65	2139	26175
970000	119753.1	445500	0.0915	40781	30	2250	9000
1500000	120000	445400	0.0915	40772	30	2250	9000
1800000	257142.9	441000	0.0915	40369	52.5	0	20795
2337500	181201.6	421600	0.0915	38593	19.67	0	21229
740000	224242.4	276400	0.0989	27322	102.42	0	61812
1800000	418604.7	868050	0.0989	85807	150	2000	61912
1900000	256756.8	686850	0.0989	67895	78	0	30225
295000	122916.7	90000	0.0989	8897	75	0	30978
725000	185897.4	247500	0.0989	24465	100	0	42926
2300000	377049.2	1330500	0.0989	131520	25.17	1450	17853
995000	268918.9	286680	0.0989	28338	99.92	4000	43526
1230000	279545.5	385770	0.0989	38133	100	4000	41312
2000000	298507.5	499500	0.0989	49376	126.17	4000	71381
3560000	134339.6	1388700	0.0989	137273	241.92	13000	123060
4340000	818867.9	1254750	0.0989	124032	75	4000	78172
327000	181666.7	305850	0.0989	30233	100	800	43822
2200000	500000	583900	0.0989	57719	104.92	7900	65436
1851025	330540.2	660700	0.0989	65310	82.5	4332	21660
860000	86868.69	354150	0.0989	35008	25	500	10831
978000	208085.1	242190	0.0989	23940	40	0	18654
950000	161016.9	352000	0.0989	34795	27.33	0	8505
1200000	333333.3	861000	0.0991	85325	222.08	0	55543
1088000	178360.7	411750	0.0991	40804	100	0	42108
560000	143589.7	159600	0.0991	15816	144.5	0	61602
2385000	397500	888750	0.0991	88075	100	0	75312
975000	348214.3	764900	0.0991	75802	46	4050	12727
1250000	260416.7	452000	0.0991	44793	111.33	4000	63838
359000	163181.8	265050	0.0991	26266	75	0	31668
5000000	240384.6	2881500	0.0991	285557	75	5400	43139
1375000	259434	430900	0.0991	42702	75	3000	43050
4350000	725000	1270350	0.0991	125892	89.33	0	64840
4200000	875000	1360200	0.1037	141039	72.42	0	91494
661000	71847.83	204750	0.1037	21231	17.17	0	4866
4280000	856000	1440630	0.1037	149379	100	0	75926
945000	242307.7	268150	0.1037	27804	100	0	42874
916000	305333.3	486000	0.1037	50393	231.92	0	66366
3290000	514062.5	1027900	0.1037	106583	74	3750	33312
2275000	307432.4	416520	0.1037	43189	59.25	0	26910
140000	100000	133230	0.1037	13815	85	0	37038
1700000	485714.3	795690	0.1037	82505	150	0	90298
530000	265000	222210	0.1037	23041	99.08	0	42924
;

proc reg plots(label)=criteria;
model Price = GI AS TAXRAT FRNTG RETAIL RESIDL /  	
		selection=stepwise details=summary;		* Specifies step-method;
run;

proc reg  outest=junk press;			*sends press stat to file "junk";				
title 'Regression of Price on Three Variables'; 		
model Price = GI AS TAXRAT;		
run;

proc reg data=RegPlot; 			
title 'Regression of Price on Three Variables'; 		
model Price = GI AS TAXRAT;	
output out=junk  					/*creates output file "junk"; */
         P=pred
         R=res
         L95M=l95m
         U95M=u95m
         L95=l95
         U95=u95
         STDP=stdp
         STDR=stdr
         STUDENT=stud
         COOKD=cook
         H=lev
         PRESS=press
         RSTUDENT=rstud
         DFFITS=dffits
         COVRATIO=covratio;
run;

proc print;	
run;*shows the contents of file "junk";
proc gplot;
plot res*pred;
plot stud*lev;
plot rstud*lev;
run; 

proc reg  ;								
title 'Regression of Price on Seven Variables'; 		
model Price = GI AS TAXRAT TAXSLYR FRNTG RETAIL RESIDL / VIF ;	
run; 



Data BaseJr; 					/* Creates SAS dataset named BaseJr */
Input Won_2009 RS_2009 Won_2010;  /* Inputs a subset, n=8, of the Baseball Data */
Datalines; 					
95	872	89
92	804	83
97	883	81
95	780	80
87	817	94
103	915	95
93	820	97
91	730	86
;
proc reg;
model Won_2010 = Won_2009 RS_2009;	 * outputs fit diagnostics ; 
output out=junk  					/*creates output file "junk"; */
         P=pred
         R=res
         STDP=stdp
         STDR=stdr
         STUDENT=stud
         COOKD=cook
         H=lev
         PRESS=press
         RSTUDENT=rstud
         DFFITS=dffits
         COVRATIO=covratio;
run;
Data Junk; 			* I want to put in a row number column;			
Set Junk; 			* for plotting purposes ;
row_num + 1; 			* This strange trick does it ;
proc print data=Junk;run;

proc sgplot data=Junk; 	 
scatter x=Pred y=rstud;	  * plots Rstudent vs. yhat ;
run; ods graphics off;


Proc IML;
use BaseJr;			/* Identifies the SAS file to import */
read all; 			/* Imports all components of SAS dataset "Junk"	*/

Y = Won_2010;						
n=nrow(Y); 			/* gets the sample size from # of rows in Y */

one_vec=j(n,1);		*column of 1's;
pressi=j(n,1); 		/* prepares a column to receive the press residuals */

X = one_vec || Won_2009 || RS_2009;			

b = inv(t(X) * X)* (t(X)*Y);		* just in case it is needed by somebody! ;

row=1:n;				* used in the "hold=out-one-at-a-time" steps;

do i = 1 to n; 					* start of loop;
	rowd=remove(row,i);				* Step 1;
	Xd = X[rowd,];					* Step 2;
	Yd=Y[rowd,]; 					* Step 3;
	bd = inv(t(Xd) * Xd)* t(Xd)*Yd;		* Step 4;
	yhatd=Xd*bd; 					* Step 5;
	yhati=X[i,]*bd;				* Step 6;
	pressi[i]=Y[i]-yhati; 				* Step 7;
end;
print pressi;					
create NewJr var {pre_out};			
append from pressi; 						
run;	

Proc print data=NewJr;
run;

