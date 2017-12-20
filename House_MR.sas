*;
*;
* HOUSE - Multiple Regression;
*;
    ods graphics on;
*;
options ls=80 ps=50 nodate pageno=1;
*;
ods all close;
ods pdf file = "D:\SAS Project\SAS\Output4.pdf";
*;
* Input House ;
*;
Data House;
Infile 'D:\SAS Project\SAS\Transformed.txt' DLM = '09'X TRUNCOVER;
Input X1 X2 X3 X4 X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X20 X21 X22;
*;
                 
*;
Data House;
	Set House (Keep = X1 X2 X3 X4 X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X20 X21 X22);
	Label X1 = 'X1 - Numbers'
		  X2 = 'X2 - id'
		  X3 = 'X3 - date'
          X4 = 'X4 - price'
          X5 = 'X5 - bedrooms'
          X6 = 'X6 - bathrooms'
          X7 = 'X7- sqft_living'
          X8 = 'X8 - sqft_lot'
		  X9 = 'X9 - floors'
          X10 = 'X10 - view'
		  X11 = 'X11 - condition'
          X12 = 'X12 - grade'
          X13 = 'X13 - sqft_above'
          X14 = 'X14 - zipcode'
          X15 = 'X15 - lat'
          X16 = 'X16 - long'
          X17 = 'X17 - sqft_living15'
          X18 = 'X18 - sqft_lot15'
          X19 = 'X19 - age_of_house' 
		  X20 = 'X20 - basement_present'
		  X21 = 'X21 - renovated'
		  X22 = 'X22 - waterfront_present'          
;
Proc Print Data = House (obs=20);

*;
*;
* Correlation Matrix - All Variables;
*;
Proc Corr Data = House;
    Var X4 X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X20 X21 X22;

*;
* Regression Analysis - X4 = X7;
* Fit and Analyze the best single independent (simple) regression analysis;
*;
Proc Reg Data = House plots(unpack);
	Model X4 = X7 /;
	
Proc Reg Data = House plots(unpack);
	Model X4 = X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 /;

Proc Reg Data = House plots(unpack);
	Model X4 = X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X20 X21 X22/;

*;
*	Perform a Stepwise Regression Analysis to select the best subset model using Alpha = 0.05;
*;
Proc Reg Data = House Corr Simple plots(unpack);
	Model X4 = X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 / Selection=Stepwise SLEntry=0.05;

Proc Reg Data = House Corr Simple plots(unpack);
	Model X4 = X5 X6 X7 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 / Selection=Stepwise SLEntry=0.05;
	
Proc Reg Data = House Corr Simple plots(unpack);
	Model X4 = X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X20 X21 X22/ Selection=Stepwise SLEntry=0.05;

Proc Reg Data = House Corr Simple plots(unpack);
	Model X4 = X5 X6 X7 X8 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X21 X22/ Selection=Stepwise SLEntry=0.05;

Run;
ods pdf close;
Quit;
