%%% Author: William Michael Mortl
%%% Feel free to use this code for educational purposes, any other use
%%%     requires citations to: NHanes study, William Michael Mortl, and
%%%     Sriram Sankaranaraynan

function [matrixOfSimulations] = runMultipleSimulations(numSimulations)
%%% function: simulateDay
%%% description: this runs 'numSimulations' randomly selected simulations
%%% inputs:
%%%     numSimulations - number of simulations to run
%%% outputs:
%%%     matrixOfSimulations - has the following column layout:
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

    %% init
    matrixOfSimulations = zeros(numSimulations, 30);
    load('Matlab_Data/mealsFilteredWeighted.mat');
    [sizeMealsFilteredWeighted, ~] = size(mealsFilteredWeighted);
    t1 = clock;
    
    %% loop through multiple simulations
    for itr = 1:numSimulations
        
        %% randomly select input data
        age = mealsFilteredWeighted(randi(sizeMealsFilteredWeighted, 1, 1), 2); 
        if (mealsFilteredWeighted(randi(sizeMealsFilteredWeighted, 1, 1), 3) == 1)
            genderCode = 'M';
        else
            genderCode = 'F';
        end
        BMI = mealsFilteredWeighted(randi(sizeMealsFilteredWeighted, 1, 1), 5); 
        
        %% create simulator, simulate day, store result
        s = daySimulator(genderCode, age, BMI);
        newRow = s.predictDay(mealsFilteredWeighted);
        matrixOfSimulations(itr, :) = newRow;
        
    end
    
    %% cleanup
    clear mealsFilteredWeighted;
    
    %% print elapsed time for data run
    t2 = clock;
    interval = etime(t2, t1);
    fprintf('\nCompleted simulations in %.2f seconds.\n', interval);

end

