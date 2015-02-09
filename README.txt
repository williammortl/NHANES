NHanes analysis tools
Author: William Michael Mortl
Feel free to use this code for educational purposes, any other use
     requires citations to: the NHANES study, William Michael Mortl,
     Sriram Sankaranaraynan, and Fraser Cameron
     
NHANES: http://www.cdc.gov/nchs/nhanes.htm

This document outlines how to use this code, and what files are generated.



-------------------------------------------------------------
| Create Meal Prediction Models and Simulate - Instructions |
-------------------------------------------------------------

These instructions are for if you want to create the predictive models for NHanes, and then perform meal simulations. After cloning all files do the following to use the meal prediction models:

IN R:

1.)Open 'buildModels.R'.
2.)Adjust line 8 of the R code which sets the working directory to point to the directory where you cloned the repository into.

IN MATLAB:

3.)Run 'buildDataAndModels', this will take about 5-10 minutes and will create directories 'Matlab_Data' and 'Models'.

	'Matlab_Data' will contain the following consolidated data files:

		mealsFiltered.mat			|
		mealsFiltered.csv			--> consolidated data containing only days that contained 3 square meals
		mealsFilteredWeighted.mat	|
		mealsFilteredWeighted.csv	--> weighted adjusted consolidated data containing only days that contained 3 square meals
		consData.mat				consolidated meal data from NHanes

	'Models' will contain all the CSV files for the predictive models

4.)Run a single simulation! The column mappings are located below the instructions.

	Usage: simulateDay({'M' | 'F'}, {age}, {body mass index})
	output = simulateDay('M', 37, 32.5)

5.) ...Or you can perform multiple simulations in the following manner:

	Usage: runMultipleSimulations({number of days to simulate})
	sims = runMultipleSimulations(1000);

NOTE: In order to use the meal simulator as part of another project, you need the following files and directories (including their contents):

	Matlab_Data\
	Models\
	daySimulator.m
	linearModel.m
	mealModel.m
	simulateDay.m
	runMultipleSimulations.m	<- optional



----------------------------------------------------------------------
| Columns descriptions in mealsFilteredWeighted and simulator output |
----------------------------------------------------------------------

ID = 1
Age = 2
Gender = 3
Weight = 4
BMI = 5
Weighting = 6
outputColCarbs = 7    <--- BREAKFAST
outputColProtein = 8
outputColFiber = 9
outputColTotalFat = 10
outputColGrams = 11
outputColEnergy = 12
outputColTime = 13
outputColCarbs = 14   <--- LUNCH
outputColProtein = 15
outputColFiber = 16
outputColTotalFat = 17
outputColGrams = 18
outputColEnergy = 19
outputColTime = 20
time since breakfast = 21
outputColCarbs = 22   <--- DINNER
outputColProtein = 23
outputColFiber = 24
outputColTotalFat = 25
outputColGrams = 26
outputColEnergy = 27
outputColTime = 28
time since breakfast = 29
time since lunch = 30



-----------------------------------------------------------------------
| Create Meal Prediction Models, Simulate, and Analyze - Instructions |
-----------------------------------------------------------------------

These instructions are for if you want to analyze and explore the NHanes data in addition to generating models for use with the meal simulator. After cloning all files do the following to use the meal prediction models:

IN MATLAB:

1.)Run 'consolidate', this will take about 3-5 minutes and will create a directory 'Matlab_Data'.

	'Matlab_Data' will contain the following consolidated data files:

		mealsFiltered.mat			|
		mealsFiltered.csv			--> consolidated data containing only days that contained 3 square meals
		mealsFilteredWeighted.mat	|
		mealsFilteredWeighted.csv	--> weighted adjusted consolidated data containing only days that contained 3 square meals
		consData.mat				consolidated meal data from NHanes

2.)Run 'createPlots', this will create a directory 'NHanes_Plots' and fill it with various NHanes data analysis.

IN R:

4.)Open 'buildModelsAndAnalyze.R'.
5.)Adjust line 8 of the R code which sets the working directory to point to the directory where you cloned the repository into.
6.)Execute this whole file, it will take 5-10 minutes.

	This will create two new directories: 

		'Models' - which contains the data for the models used for meal prediction
		'Model_Analysis' - which contains analysis of each and every model including residual qq plots and histograms

IN MATLAB:

7.)Initialize a daySimulator object, below is an example for simulating me:

	Usage: objRef = daySimulator({'M' | 'F'}, {age}, {body mass index})
	objRef = daySimulator('M', 37, 32.5)

8.)Load 'mealsFilteredWeighted.mat'.
9.)Simulate a random day. The column mappings are located above the instructions.

	Usage: objRef.predictDay({matrix which was used to build the models used by the simulator})
	output = objRef.predictDay(mealsFilteredWeighted)

10.) ...Or you can perform multiple simulations by using the following function call:

	sims = runMultipleSimulations({number of days to simulate})
	sims = runMultipleSimulations(1000);