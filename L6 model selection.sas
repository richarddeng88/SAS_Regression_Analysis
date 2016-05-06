
proc reg data=rich.regplot2 plots(label)=criteria; 
	/* provides a one-page summary of model selection plots.
	The "label" argument puts the best model Index Number on the plots, 
so that we can find it in the Selection output list, below! */

model Price=GI AS TAX FRT RET RSDT / selection= adjrsq cp aic sbc;				
/* lists all possible models(!),ordered by Adjrsq, 
	and shows all criteria values */
run;



proc reg data=rich.regplot3 plots(label)=criteria;
model Price = GI AS TAXRAT FRNTG RETAIL RESIDL /  	
		selection=stepwise details=summary;		* Specifies step-method;
run;

proc reg data=rich.regplot3 outest=junk press;			*sends press stat to file "junk";				
title 'Regression of Price on Three Variables'; 		
model Price = GI AS TAXRAT;		
run;

proc reg data=rich.regplot3; 			
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



* Bias in Model Selection;
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



*########## Produces Diagnostic Plots with Labels on Unusual Points #######;
Data BaseballWins;
Input Team $10. Won_09	W1_09	L1_09	RS_09	RA_09	Won_10;
Datalines;
 Boston		95	22	17	872	736	89
 Colorado	92	23	20	804	715	83
 LA_Ang		97	27	18	883	761	81
 LA_Dod		95	28	22	780	611	80
 Minn		87	24	20	817	765	94
 NY_Yan		103	22	16	915	753	95
 Phila		93	24	21	820	709	97
 StLouis	91	24	21	730	640	86
 Arizona	70	20	27	720	782	65
 Atlanta	86	27	25	735	641	91
 Balt		64	17	22	741	876	66
 Chi_Cub	83	16	22	707	672	75
 Chi_WS		79	19	27	724	732	88
 Cinc		78	19	20	673	723	91
 Cleve		65	19	21	773	865	69
 Detroit	86	28	22	743	745	81
 Florida	87	30	20	772	766	80
 Houston	74	24	23	643	770	76
 KanC		65	16	25	686	842	67
 Milw		80	20	23	785	818	77
 NY_Met		70	19	24	671	757	79
 Oakland	75	15	23	759	761	80
 Pittsb		62	12	22	636	768	57
 SanD		75	23	18	638	769	90
 SanF		88	21	22	657	611	92
 Seattle	85	35	20	640	692	61
 Tampa		84	20	25	803	754	96
 Texas		87	19	18	784	740	90
 Toronto	75	21	28	798	771	85
 Wash		59	22	24	710	874	69
;
run;
proc print;
run;

proc reg plots(label)=(CooksD RStudentByLeverage);
id Team;
model Won_10 = Won_09 W1_09 L1_09 RS_09 RA_09; 	
run;
