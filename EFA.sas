*;
*;
* HOUSE - Principal Componenet Analysis;
*;
    ods graphics on;
*;
options ls=80 ps=50 nodate pageno=1;
*;
ods all close;
ods pdf file = "D:\SAS Project\SAS\PCA.pdf";
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
* Principal Components Analysis - Except Variables X1,X2,X3;
*;
*;
************ Except Variables X1,X2,X3 X4 - Method=Principal Rotation: None and Varimax ****************;
*;
Proc Princomp Data = House Plots = ALL;
    Var X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X20 X21 X22;
*;

*;
************ Except Variables X1,X2,X3,X4 - Method=Principal Rotation: None and Varimax ****************;
*;
Proc Factor Data = House Method = Principal Rotate = None NFactors = 8 Print Score Corr Simple MSA Plots = Scree MINEIGEN = 0
Reorder;
Var X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X20 X21 X22;

Proc Factor Data = House Method = Principal Rotate = Varimax NFactors = 8 Print Score Corr Simple MSA Plots = Scree MINEIGEN = 0
Reorder;
Var X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X20 X21 X22;
*;

*;
* Principal Components Analysis - Except Variables X1,X2,X3,X4
Deleting Variable X20
;
*;
*;
************ Except Variables X1,X2,X3,X4 - Method=Principal Rotation: None and Varimax ****************;
*;
Proc Factor Data = House Method = Principal Rotate = None NFactors = 7 Print Score Corr Simple MSA Plots = Scree MINEIGEN = 0
Reorder;
Var X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X21 X22;

Proc Factor Data = House Method = Principal Rotate = Varimax NFactors = 7 Print Score Corr Simple MSA Plots = Scree MINEIGEN = 0
Reorder;
Var X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X21 X22;
*;
*;
* Principal Components Analysis - Except Variables X1,X2,X3,X4
Deleting Variable X20,X21
;
*;
*;
************ Except Variables X1,X2,X3,X4 - Method=Principal Rotation: None and Varimax ****************;
*;
Proc Factor Data = House Method = Principal Rotate = None NFactors = 7 Print Score Corr Simple MSA Plots = Scree MINEIGEN = 0
Reorder;
Var X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X22;

Proc Factor Data = House Method = Principal Rotate = Varimax NFactors = 7 Print Score Corr Simple MSA Plots = Scree MINEIGEN = 0
Reorder;
Var X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X22;
*;
*;
*;
* Principal Components Analysis - Except Variables X1,X2,X3,X4
Deleting Variable X20,X21,X15
;
*;
*;
************ Except Variables X1,X2,X3,X4 - Method=Principal Rotation: None and Varimax ****************;
*;
Proc Factor Data = House Method = Principal Rotate = None NFactors = 6 Print Score Corr Simple MSA Plots = Scree MINEIGEN = 0
Reorder;
Var X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X16 X17 X18 X19 X22;

Proc Factor Data = House Method = Principal Rotate = Varimax NFactors = 6 Print Score Corr Simple MSA Plots = Scree MINEIGEN = 0
Reorder;
Var X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X16 X17 X18 X19 X22;
*;
*;
*;
* Principal Components Analysis - Except Variables X1,X2,X3,X4
Deleting Variable X20,X21,X15
;
*;
*;
************ Except Variables X1,X2,X3,X4 - Method=Principal Rotation: None and Varimax ****************;
*;
Proc Factor Data = House Method = Principal Rotate = None NFactors = 5 Print Score Corr Simple MSA Plots = Scree MINEIGEN = 0
Reorder;
Var X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X16 X17 X18 X19 X22;

Proc Factor Data = House Method = Principal Rotate = Varimax NFactors = 5 Print Score Corr Simple MSA Plots = Scree MINEIGEN = 0
Reorder;
Var X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X16 X17 X18 X19 X22;
*;

;
************  Compute Factor and Summated Scores****************; 
*;
Proc Factor Data = House OutStat = FactOut Method = Principal Rotate = Varimax NFactors = 5 Print Score Simple MSA 
Plots = Scree MINEIGEN = 0 Reorder;
    Var X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X16 X17 X18 X19 X22;

Proc Score Data = House Score = FactOut Out = FScore;
    Var X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X16 X17 X18 X19 X22;

Proc Print Data = FactOut;

Proc Print Data = FScore;

Data FScore
	Set FScore;
	Label SumScale1 = 'SumScale1 '
		  SumScale2 = 'SumScale2 '
		  SumScale3 = 'SumScale3 '
		  SumScale4 = 'SumScale2 '
		  SumScale5 = 'SumScale3 ';
	SumScale1 = (X7 + X13 + X6 + X12 + X17 + X5) / 6;
	SumScale2 = (X8 + X18) / 2;
	SumScale3 = (X11 + X19 + (10-X9)) / 3;
	SumScale4 = (X14 + (10-X16)) / 2;
	SumScale5 = (X22 + X10) / 2;

Proc Print Data = FScore;

Proc Means Data = FScore;
	Var Factor1 Factor2 Factor3 Factor4 Factor5 SumScale1 SumScale2 SumScale3 SumScale4 SumScale5;

*;
************  Compute Factor and Summated Correlations ****************; 
*;

Proc Corr Data = FScore;
	Var Factor1 Factor2 Factor3 Factor4 Factor5 SumScale1 SumScale2 SumScale3 SumScale4 SumScale5;



Run;
ods pdf close;
Quit;
