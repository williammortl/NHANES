%%% Author: William Michael Mortl
%%% Feel free to use this code for educational purposes, any other use
%%%     requires citations to: NHanes study, William Michael Mortl,
%%%     Sriram Sankaranaraynan, and Fraser Cameron

%% consolidated data
consData = [];

% output columns for consData
% outputColID = 1;
% outputColCarbs = 2;
% outputColProtein = 3;
% outputColFiber = 4;
% outputColTotalFat = 5;
% outputColGrams = 6;
% outputColEnergy = 7;
% outputColTime = 8;
% outputColDay = 9;
% outputColFile = 10;
% outputColMealCode = 11;
% outputColAge = 12;
% outputColGender = 13;
% outputColWeight = 14; % in kilograms
% outputColBMI = 15; % kg/m^2
% outputColWeighting = 16;

% output columns for mealsFiltered / mealsFilteredWeighted
% ID = 1
% Age = 2
% Gender = 3
% Weight = 4
% BMI = 5
% Weighting = 6
% outputColCarbs = 7    <--- BREAKFAST
% outputColProtein = 8
% outputColFiber = 9
% outputColTotalFat = 10
% outputColGrams = 11
% outputColEnergy = 12
% outputColTime = 13
% outputColCarbs = 14   <--- LUNCH
% outputColProtein = 15
% outputColFiber = 16
% outputColTotalFat = 17
% outputColGrams = 18
% outputColEnergy = 19
% outputColTime = 20
% time since breakfast = 21
% outputColCarbs = 22   <--- DINNER
% outputColProtein = 23
% outputColFiber = 24
% outputColTotalFat = 25
% outputColGrams = 26
% outputColEnergy = 27
% outputColTime = 28
% time since breakfast = 29
% time since lunch = 30

% input file codes:
%   1 - DRXIFF
%   2 - DRXIFF_B
%   3 - DR1IFF_C
%   4 - DR2IFF_C
%   5 - DR1IFF_D
%   6 - DR2IFF_D
%   7 - DR1IFF_E
%   8 - DR2IFF_E
%   9 - DR1IFF_F
%   10 - DR2IFF_F

% meal codes:
%   1 - breakfast
%   2 - lunch
%   3 - dinner
%   4 - snack
%   5 - misc. (probably a Spanish meal)

% gender codes:
%   1 - male

% spanish meal mapping:
%   desayuno - breakfast
%   almuerzo - breakfast
%   comida - lunch
%   cena - dinner
%   merienda - snack
%   entre comida - snack
%   botana - snack
%   bocadillo - snack
%   Tentempie - snack

%% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! DRXIFF, 1999
inputColID = 1;
inputColCarbs = 21;
inputColProtein = 20;
inputColFiber = 27;
inputColTotalFat = 22;
inputColGrams = 18;
inputColEnergy = 19;
inputColTime = 11;
inputColMeal = 12;
inputColAge = 6;
inputColGender = 5;
inputColWeight = 5;
inputColBMI = 13;
inputColWeighting = 2;
meals = {[1; 2; 9; 10], [3; 11], [5; 13], [4; 12; 14; 15; 16]};
fprintf('\nStarting DRXIFF.mat...');
load('DRXIFF.mat', 'data');
load('BMX.mat', 'dataBMX');
load('DEMO.mat', 'dataDemo');
consData = [consData; consolidateFunc(data, dataBMX, dataDemo, inputColID, inputColCarbs, inputColProtein, inputColFiber, inputColTotalFat, inputColGrams, inputColEnergy, inputColTime, 1, 1, inputColMeal, meals, inputColAge, inputColGender, inputColWeight, inputColBMI, inputColWeighting)];
clear data dataBMX dataDemo;
fprintf('\nCompleted DRXIFF.mat.\n');

%% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! DRXIFF_B, 2001
inputColID = 1;
inputColCarbs = 17;
inputColProtein = 16;
inputColFiber = 19;
inputColTotalFat = 20;
inputColGrams = 14;
inputColEnergy = 15;
inputColTime = 10;
inputColMeal = 11;
inputColAge = 6;
inputColGender = 5;
inputColWeight = 2;
inputColBMI = 10;
inputColWeighting = 2;
meals = {[1; 5; 10; 11], [2; 12], [3; 14], [6; 13; 15; 16; 17]};
fprintf('\nStarting DRXIFF_B.mat...');
load('DRXIFF_B.mat', 'data');
load('BMX_B.mat', 'dataBMX');
load('DEMO_B.mat', 'dataDemo');
consData = [consData; consolidateFunc(data, dataBMX, dataDemo, inputColID, inputColCarbs, inputColProtein, inputColFiber, inputColTotalFat, inputColGrams, inputColEnergy, inputColTime, 1, 2, inputColMeal, meals, inputColAge, inputColGender, inputColWeight, inputColBMI, inputColWeighting)];
clear data dataBMX dataDemo;
fprintf('\nCompleted DRXIFF_B.mat.\n');

%% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! DR1IFF_C & Day 2, 2003
inputColID = 1;
inputColCarbs = 22;
inputColProtein = 21;
inputColFiber = 24;
inputColTotalFat = 25;
inputColGrams = 19;
inputColEnergy = 20;
inputColTime = 13;
inputColMeal = 14;
inputColAge = 6;
inputColGender = 5;
inputColWeight = 9;
inputColBMI = 17;
inputColWeighting = 3;
meals = {[1; 5; 10; 11], [2; 12], [3; 4; 14], [6; 7; 13; 15; 16; 17; 18; 19]};
fprintf('\nStarting DR1IFF_C.mat...');
load('DR1IFF_C.mat', 'data');
load('BMX_C.mat', 'dataBMX');
load('DEMO_C.mat', 'dataDemo');
consData = [consData; consolidateFunc(data, dataBMX, dataDemo, inputColID, inputColCarbs, inputColProtein, inputColFiber, inputColTotalFat, inputColGrams, inputColEnergy, inputColTime, 1, 3, inputColMeal, meals, inputColAge, inputColGender, inputColWeight, inputColBMI, inputColWeighting)];
clear data;
fprintf('\nCompleted DR1IFF_C.mat.');
fprintf('\nStarting DR2IFF_C.mat...');
load('DR2IFF_C.mat', 'data');
consData = [consData; consolidateFunc(data, dataBMX, dataDemo, inputColID, inputColCarbs, inputColProtein, inputColFiber, inputColTotalFat, inputColGrams, inputColEnergy, inputColTime, 2, 4, inputColMeal, meals, inputColAge, inputColGender, inputColWeight, inputColBMI, inputColWeighting)];
clear data dataBMX dataDemo;
fprintf('\nCompleted DR2IFF_C.mat.\n');

%% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! DR1IFF_D & Day 2, 2005
inputColID = 1;
inputColCarbs = 22;
inputColProtein = 21;
inputColFiber = 24;
inputColTotalFat = 25;
inputColGrams = 19;
inputColEnergy = 20;
inputColTime = 13;
inputColMeal = 14;
inputColAge = 6;
inputColGender = 5;
inputColWeight = 3;
inputColBMI = 11;
inputColWeighting = 3;
meals = {[1; 5; 10; 11], [2; 12], [3; 4; 14], [6; 7; 13; 15; 16; 17; 18; 19]};
fprintf('\nStarting DR1IFF_D.mat...');
load('DR1IFF_D.mat', 'data');
load('BMX_D.mat', 'dataBMX');
load('DEMO_D.mat', 'dataDemo');
consData = [consData; consolidateFunc(data, dataBMX, dataDemo, inputColID, inputColCarbs, inputColProtein, inputColFiber, inputColTotalFat, inputColGrams, inputColEnergy, inputColTime, 1, 5, inputColMeal, meals, inputColAge, inputColGender, inputColWeight, inputColBMI, inputColWeighting)];
clear data;
fprintf('\nCompleted DR1IFF_D.mat.');
fprintf('\nStarting DR2IFF_D.mat...');
load('DR2IFF_D.mat', 'data');
consData = [consData; consolidateFunc(data, dataBMX, dataDemo, inputColID, inputColCarbs, inputColProtein, inputColFiber, inputColTotalFat, inputColGrams, inputColEnergy, inputColTime, 2, 6, inputColMeal, meals, inputColAge, inputColGender, inputColWeight, inputColBMI, inputColWeighting)];
clear data dataBMX dataDemo;
fprintf('\nCompleted DR2IFF_D.mat.\n');

%% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! DR1IFF_E & Day 2, 2007
inputColID = 1;
inputColCarbs = 23;
inputColProtein = 22;
inputColFiber = 25;
inputColTotalFat = 26;
inputColGrams = 20;
inputColEnergy = 21;
inputColTime = 14;
inputColMeal = 15;
inputColAge = 6;
inputColGender = 5;
inputColWeight = 2;
inputColBMI = 11;
inputColWeighting = 2;
meals = {[1; 5; 10; 11], [2; 12], [3; 4; 14], [6; 7; 13; 15; 16; 17; 18; 19]};
fprintf('\nStarting DR1IFF_E.mat...');
load('DR1IFF_E.mat', 'data');
load('BMX_E.mat', 'dataBMX');
load('DEMO_E.mat', 'dataDemo');
consData = [consData; consolidateFunc(data, dataBMX, dataDemo, inputColID, inputColCarbs, inputColProtein, inputColFiber, inputColTotalFat, inputColGrams, inputColEnergy, inputColTime, 1, 7, inputColMeal, meals, inputColAge, inputColGender, inputColWeight, inputColBMI, inputColWeighting)];
clear data;
fprintf('\nCompleted DR1IFF_E.mat.');
fprintf('\nStarting DR2IFF_E.mat...');
load('DR2IFF_E.mat', 'data');
consData = [consData; consolidateFunc(data, dataBMX, dataDemo, inputColID, inputColCarbs, inputColProtein, inputColFiber, inputColTotalFat, inputColGrams, inputColEnergy, inputColTime, 2, 8, inputColMeal, meals, inputColAge, inputColGender, inputColWeight, inputColBMI, inputColWeighting)];
clear data dataBMX dataDemo;
fprintf('\nCompleted DR2IFF_E.mat.\n');

%% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! DR1IFF_F & Day 2, 2009
inputColID = 1;
inputColCarbs = 23;
inputColProtein = 22;
inputColFiber = 25;
inputColTotalFat = 26;
inputColGrams = 20;
inputColEnergy = 21;
inputColTime = 14;
inputColMeal = 15;
inputColAge = 6;
inputColGender = 5;
inputColWeight = 2;
inputColBMI = 11;
inputColWeighting = 2;
meals = {[1; 5; 10; 11], [2; 12], [3; 4; 14], [6; 7; 13; 15; 16; 17; 18; 19]};
fprintf('\nStarting DR1IFF_F.mat...');
load('DR1IFF_F.mat', 'data');
load('BMX_F.mat', 'dataBMX');
load('DEMO_F.mat', 'dataDemo');
consData = [consData; consolidateFunc(data, dataBMX, dataDemo, inputColID, inputColCarbs, inputColProtein, inputColFiber, inputColTotalFat, inputColGrams, inputColEnergy, inputColTime, 1, 9, inputColMeal, meals, inputColAge, inputColGender, inputColWeight, inputColBMI, inputColWeighting)];
clear data;
fprintf('\nCompleted DR1IFF_F.mat.');
fprintf('\nStarting DR2IFF_F.mat...');
load('DR2IFF_F.mat', 'data');
consData = [consData; consolidateFunc(data, dataBMX, dataDemo, inputColID, inputColCarbs, inputColProtein, inputColFiber, inputColTotalFat, inputColGrams, inputColEnergy, inputColTime, 2, 10, inputColMeal, meals, inputColAge, inputColGender, inputColWeight, inputColBMI, inputColWeighting)];
clear data dataBMX dataDemo;
fprintf('\nCompleted DR2IFF_F.mat.\n');

%% convert seconds to minutes
consData(:,8) = consData(:,8) / 60;

%% remove meals within an hour of eachother and sort data
remInd = [];
for itr = size(consData,1):-1:2
    if ((consData(itr-1, 1) == consData(itr, 1)) && ((consData(itr, 8) - consData(itr-1, 8)) < 60))
        consData(itr-1,2:7) = consData(itr-1,2:7) + consData(itr,2:7);
        remInd = [remInd; itr];
    end
end
consData(remInd, :) = [];
consData = sortrows(consData, [10 1 11]);

%% create new var with non standard meals (snacks, misc) removed
%%  filter data with 3 standard meals iif person's weight is > 5
fprintf('\nStarting generating meal data...\n');
I = find((consData(:, 11) ~= 4) & (consData(:, 11) ~= 5) & (consData(:, 14) > 5) & ~(isnan(consData(:, 16))));
consDataMealsFiltered = consData(I, :);
intervalStart = 1;
currentRow = 1;
currentUser = consDataMealsFiltered(1, 1);
[sizeConsDataMealsFiltered, ~] = size(consDataMealsFiltered);
mealsFiltered = zeros(int64(sizeConsDataMealsFiltered / 3), 30);
for itr = 1:size(consDataMealsFiltered(:, 1))
    
    % if the user is different, then add data, and start new interval
    if consDataMealsFiltered(itr, 1) ~= currentUser
        
        % add data
        if ((itr - intervalStart) == 3)
           
            % user information
            newRow = [consDataMealsFiltered(intervalStart, 1), ...
                      consDataMealsFiltered(intervalStart, 12), ...
                      consDataMealsFiltered(intervalStart, 13), ...
                      consDataMealsFiltered(intervalStart, 14), ...
                      consDataMealsFiltered(intervalStart, 15), ...
                      consDataMealsFiltered(intervalStart, 16), ...
                      consDataMealsFiltered(intervalStart, 2), ...
                      consDataMealsFiltered(intervalStart, 3), ...
                      consDataMealsFiltered(intervalStart, 4), ...
                      consDataMealsFiltered(intervalStart, 5), ...
                      consDataMealsFiltered(intervalStart, 6), ...
                      consDataMealsFiltered(intervalStart, 7), ...
                      consDataMealsFiltered(intervalStart, 8), ...
                      consDataMealsFiltered(intervalStart + 1, 2), ...
                      consDataMealsFiltered(intervalStart + 1, 3), ...
                      consDataMealsFiltered(intervalStart + 1, 4), ...
                      consDataMealsFiltered(intervalStart + 1, 5), ...
                      consDataMealsFiltered(intervalStart + 1, 6), ...
                      consDataMealsFiltered(intervalStart + 1, 7), ...
                      consDataMealsFiltered(intervalStart + 1, 8), ...
                      consDataMealsFiltered(intervalStart + 1, 8) - consDataMealsFiltered(intervalStart, 8), ...
                      consDataMealsFiltered(intervalStart + 2, 2), ...
                      consDataMealsFiltered(intervalStart + 2, 3), ...
                      consDataMealsFiltered(intervalStart + 2, 4), ...
                      consDataMealsFiltered(intervalStart + 2, 5), ...
                      consDataMealsFiltered(intervalStart + 2, 6), ...
                      consDataMealsFiltered(intervalStart + 2, 7), ...
                      consDataMealsFiltered(intervalStart + 2, 8), ...
                      consDataMealsFiltered(intervalStart + 2, 8) - consDataMealsFiltered(intervalStart, 8), ...
                      consDataMealsFiltered(intervalStart + 2, 8) - consDataMealsFiltered(intervalStart + 1, 8)];
            
            % append to mealsFiltered
            mealsFiltered(currentRow, :) = newRow;
            currentRow = currentRow + 1;
        end
        
        % start new interval
        intervalStart = itr;
        currentUser = consDataMealsFiltered(itr, 1);
    end
end

% filter out blank rows and meals that are out of order
mealsFiltered(currentRow:int64(sizeConsDataMealsFiltered / 3), :) = [];
I = find(mealsFiltered(:, 21) <= 0 | mealsFiltered(:, 29) <= 0 | mealsFiltered(:, 30) <= 0);
mealsFiltered(I, :) = [];
fprintf('Completed generating meal data.\n');

%% created weighted meal data
fprintf('\nGenerating WEIGHTED meal data...\n');
mealsFilteredWeighted = adjustForWeighting(mealsFiltered, 6);
fprintf('Completed generating meal data.\n');

%% export data
fprintf('\nExporting data...\n');
mkdir('Matlab_Data');
save('Matlab_Data/consData.mat', 'consData');
save('Matlab_Data/mealsFiltered.mat', 'mealsFiltered');
csvwrite('Matlab_Data/mealsFiltered.csv', mealsFiltered);
save('Matlab_Data/mealsFilteredWeighted.mat', 'mealsFilteredWeighted');
csvwrite('Matlab_Data/mealsFilteredWeighted.csv', mealsFilteredWeighted);
fprintf('Completed exporting data...\n');

%% cleanup
clear I;
clear intervalStart;
clear currentUser;
clear sizeConsDataMealsFiltered;
clear currentRow;
clear newRow;
clear itr;
clear remInd;
clear inputColID;
clear inputColCarbs;
clear inputColProtein;
clear inputColFiber;
clear inputColTotalFat;
clear inputColGrams;
clear inputColEnergy;
clear inputColTime;
clear inputColMeal;
clear meals;
clear inputColAge;
clear inputColGender;
clear inputColWeight;
clear inputColBMI;
clear inputColWeighting;
clear consDataMealsFiltered;

fprintf('\nCompleted consolidating.\n');