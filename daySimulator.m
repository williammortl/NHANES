%%% Author: William Michael Mortl
%%% Feel free to use this code for educational purposes, any other use
%%%     requires citations to: NHanes study, William Michael Mortl, and
%%%     Sriram Sankaranaraynan

classdef daySimulator

    % PUBLIC properties
    properties
        genderCode      % 'M' male, otherwise female
        age
        BMI
    end
    
    % PRIVATE properties
    properties (Access = private)
        mealBreakfast
        mealLunch
        mealDinner
    end
    
    % PUBLIC methods
    methods
        
        %% constructor
        function obj = daySimulator(genderCode, age, BMI)
                        
            %% configure inputs
            if (genderCode ~= 'M')
                genderCode = 'F';
            end
            obj.genderCode = genderCode;
            obj.age = age;
            obj.BMI = BMI;
            
            %% load meal models
            obj.mealBreakfast = mealModel(genderCode, 'b');
            obj.mealLunch = mealModel(genderCode, 'l');
            obj.mealDinner = mealModel(genderCode, 'd');
            
        end
        
        %% predict dependent value from data
        function returnedRegressorData = predictDay(obj, trainingData)
        %%% function: predictDay
        %%% description: must have the data file 'mealsFilteredWeighted.mat' 
        %%%     in the 'Matlab_Data' subdirectory. Also, this function 
        %%%     requires: 'daySimulator.m', 'mealModel.m', and
        %%%     'linearModel.m' to be in the same directory. Additionally, 
        %%%     this function requires that all linear models have been 
        %%%     generated and are present in the 'Models' subdirectory
        %%% inputs:
        %%%     trainingData - a copy of 'mealsFilteredWeighted.mat'
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
            
            %% setup initial input to models
            returnedRegressorData = zeros(1, 30);
            returnedRegressorData(2) = obj.age;
            if (obj.genderCode == 'M')
                returnedRegressorData(3) = 1;
            else
                returnedRegressorData(3) = 2;
            end
            returnedRegressorData(5) = obj.BMI;
            
            %% regress for each meal
            returnedRegressorData = obj.mealBreakfast.predictMeal(returnedRegressorData, trainingData);
            returnedRegressorData = obj.mealLunch.predictMeal(returnedRegressorData, trainingData);
            returnedRegressorData = obj.mealDinner.predictMeal(returnedRegressorData, trainingData);
            
        end
        
    end
        
    % PRIVATE methods
    methods (Access = private)
    end
    
end

