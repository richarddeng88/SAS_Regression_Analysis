Data BaseJr; 					  /* Creates SAS dataset named BaseJr */
Input Won_2009 RS_2009 Won_2010;  /* Inputs a subset, n=8, of Baseball Data */
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

Proc Reg;				/*gets the slope coefficients for comparison*/
Model Won_2010 = Won_2009 RS_2009;
run;

Proc IML; 				/* Opens the Matrix Language procedure */
use BaseJr;				/* Identifies the SAS file to import */
read all; 				/* Imports all components of SAS dataset 
					    BaseJr with their names! */

one_vec = j(8,1);          	/* "j(n,1)" creates a vector of length n 
						filled with 1's. */

X = one_vec || Won_2009 || RS_2009; /* "||" sandwiches columns into a matrix */
print X;							

Y = Won_2010; 
print Y;

mat1 = t(X) * X;		/* shows steps, for those who are curious */
mat2=  inv(t(X) * X);
mat3 = inv(t(X) * X) * t(X);
print mat1, mat2, mat3;

b = inv(t(X) * X) * (t(X)*Y); 	/* Computes b vector in one go! */
print b;

					/* How to export IML results to SAS file */
create NewJr var {b_vec};		/* Creates SAS data set NewJr and 
   SAS variable b_vec*/
append from b; 			/* Sends IML variable "b" to SAS variable b_vec	*/
						/* LEARN TO USE COMMENTS*/

quit;					/* exits IML */

proc print data=NewJr; 				/*Shows that the b values were in fact exported to
									   the SAS data set NewJr. */
run;
