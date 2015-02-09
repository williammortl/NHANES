%%% Author: William Michael Mortl
%%% Feel free to use this code for educational purposes, any other use
%%%     requires citations to: NHanes study, William Michael Mortl, and
%%%     Sriram Sankaranaraynan

function [ returnedRegressorData ] = simulateDay( genderCode, age, BMI )
%%% function: simulateDay
%%% description: wraps the daySimulator class, must have the data file
%%%     'mealsFilteredWeighted.mat' in the 'Matlab_Data' subdirectory.
%%%     Also, this function requires: 'daySimulator.m', 'mealModel.m', and
%%%     'linearModel.m' to be in the same directory. Additionally, this
%%%     function requires that all linear models have been generated and
%%%     are present in the 'Models' subdirectory
%%% inputs:
%%%     genderCode - 'M' or 'F'
%%%     age - the age
%%%     BMI - the body mass index
%%% outputs:
%%%     returnedRegressorData - has the following column layout:
%%%         Age = 2
%%%         Gender = 3
%%%         Weight = 4
%%%         BMI = 5
%%%         Weighting = 6
%%%         outputColCarbs = 7    <--- BREAKFAST
%%%         outputColProtein = 8
%%%         outputColFiber = 9
%%%         outputColTotalFat = 10
%%%         outputColGrams = 11
%%%         outputColEnergy = 12
%%%         outputColTime = 13
%%%         outputColCarbs = 14   <--- LUNCH
%%%         outputColProtein = 15
%%%         outputColFiber = 16
%%%         outputColTotalFat = 17
%%%         outputColGrams = 18
%%%         outputColEnergy = 19
%%%         outputColTime = 20
%%%         time since breakfast = 21
%%%         outputColCarbs = 22   <--- DINNER
%%%         outputColProtein = 23
%%%         outputColFiber = 24
%%%         outputColTotalFat = 25
%%%         outputColGrams = 26
%%%         outputColEnergy = 27
%%%         outputColTime = 28
%%%         time since breakfast = 29
%%%         time since lunch = 30

    %% load meal data exactly ONCE
    persistent mealsFilteredWeighted;
    if isempty(mealsFilteredWeighted)
        
        % this contains path info, if you move the mat file, change the
        %   path here
        load('Matlab_Data/mealsFilteredWeighted.mat');
    end
    

    %% create and call the object
    s = daySimulator(genderCode, age, BMI);
    returnedRegressorData = s.predictDay(mealsFilteredWeighted);

end

