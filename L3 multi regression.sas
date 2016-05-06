libname rich 'C:\Users\q.deng\Desktop\regression'; * Reference a SAS data library;



proc reg data=rich.regplot; 				* produces the estimates of the parameters, etc.;
model Price=GI AS ; 			* defines the model;
run; 
