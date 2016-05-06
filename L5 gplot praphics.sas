libname rich 'C:\Users\q.deng\Desktop\regression'; * Reference a SAS data library;


data a ; set rich.doctors;
proc template; 						
		* "How-to" see http://robslink.com/SAS/papers/sg_procs/sgplot.html#pointlabels;
		* Also,  http://www2.sas.com/proceedings/forum2007/088-2007.pdf;
 Define style styles.circlefill;
  Parent=styles.default;
  Style graphdata1 from graphdata1 / MarkerSymbol="circlefilled" Color=red Contrastcolor=red;
  Style graphdata2 from graphdata2 / MarkerSymbol="circlefilled" Color=blue Contrastcolor=blue;
  end;
 run;
ods listing style=circlefill;    *Instructs system to use above template;

title 'Fig.2a Hospital Beds versus Medicare Recipients, Per 100,000';
proc sgplot;
scatter x=Medicare y=Beds;  
	/* sgplot assigns the x and y variables by direct statement */
yaxis Label="Hospital Beds Per 100,000";
xaxis Label="Medicare Recipients Per 100,000";
run;


title 'Fig.2b Hospital Beds versus Medicare Recipients, Per 100,000';
proc sgplot;
scatter x=Medicare y=Beds;  
REG X = Medicare Y = Beds / DATALABEL = State; 	*Adds State Labels to points;
yaxis Label="Hospital Beds Per 100,000";
xaxis Label="Medicare Recipients Per 100,000";
run;


title 'Fig.2c Hospital Beds versus Medicare Recipients, Per 100,000';
proc sgplot;
scatter x=Medicare y=Beds;  
REG X = Medicare Y = Beds / DATALABEL = State CLM CLI CLMtransparency=0.2; 
	*Adds yhat line and 95% confidence and prediction intervals;
yaxis Label="Hospital Beds Per 100,000";
xaxis Label="Medicare Recipients Per 100,000";
run;

title 'Fig.2d Hospital Beds versus Medicare Recipients, Per 100,000';
proc sgplot;
scatter x=Medicare y=Beds / group=Vote08;  *adds the separation into Obama/McCain;
REG X = Medicare Y = Beds / DATALABEL = State CLM CLI CLMtransparency=0.6; 
yaxis Label="Hospital Beds Per 100,000";
xaxis Label="Medicare Recipients Per 100,000";
run;



proc sgscatter;
plot Beds*Medicare /  datalabel=State  		/* Easy point labels*/		
		reg=(degree=1 clm cli nogroup);	/*degree of polyomial & intervals*/
title 'Fig.3a  Hospital Beds versus Medicare Recipients';
title2 'with 95% confidence and prediction intervals';
label Beds='Hospital Beds per Pop 100,000' Medicare='Medicare Recipients per Pop 100,000';
run;


ods rtf file="myfile.rtf" style=journal;		/* change output style */

proc sgscatter;
plot Beds*Medicare / datalabel=State  			
		reg=(degree=9 clm cli nogroup); 
title 'Fig.3b  Hospital Beds versus Medicare Recipients';
title2 'with 95% confidence and prediction intervals';
label Beds='Hospital Beds per Pop 100,000' Medicare='Medicare Recipients per Pop 100,000';
run;

proc sgscatter;
plot Beds*Medicare / datalabel=State  			
		reg=(degree=9 clm cli nogroup); 
run;

proc sgscatter;
matrix Phys Beds Medicare SocSec SupSec SocEnr /  
ellipse=(type=predicted) diagonal=(histogram) Group=Vote08;
run;
