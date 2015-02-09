%%% Author: William Michael Mortl
%%% Feel free to use this code for educational purposes, any other use
%%%     requires citations to: William Michael Mortl, and
%%%     Sriram Sankaranaraynan

% creates and saves all histograms for the data

% output columns for CSV file
% 1 - 1 for weighted, 0 for unweighted
% 2 - meal code: 1 - breakfast, 2 - lunch, 3 - dinner, 4 - snack, 5 - misc.
% 3 - mean
% 4 - median
% 5 - mode
% 6 - standard deviation



%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ORIGINAL DATA

%% init
load('Matlab_Data/consData.mat', 'consData');
mealStats = [];
buckets = 24;
mkdir('NHanes_Plots');

%% breakfast histogram
I = find(consData(:, 11) == 1);
h = figure;
subplot(2, 1, 1);
[meanVal, medianVal, modeVal, stdVal] = histogram(consData(I, 8), buckets, 'Breakfast Times', h)
subplot(2, 1, 2);
[meanValW, medianValW, modeValW, stdValW] = weightedHistogram([consData(I, 8), consData(I, 16)], buckets, 'WEIGHTED Breakfast Times', h)
print(h, '-dpng', 'NHanes_Plots/breakfast.png'); 
mealStats = [0, 1, meanVal, medianVal, modeVal, stdVal; 1, 1, meanValW, medianValW, modeValW, stdValW];
close(h);

%% lunch histogram
I = find(consData(:, 11) == 2);
h = figure;
subplot(2, 1, 1);
[meanVal, medianVal, modeVal, stdVal] = histogram(consData(I, 8), buckets, 'Lunch Times')
subplot(2, 1, 2);
[meanValW, medianValW, modeValW, stdValW] = weightedHistogram([consData(I, 8), consData(I, 16)], buckets, 'WEIGHTED Lunch Times', h)
print(h, '-dpng', 'NHanes_Plots/lunch.png'); 
mealStats = [mealStats; 0, 2, meanVal, medianVal, modeVal, stdVal; 1, 2, meanValW, medianValW, modeValW, stdValW];
close(h);

%% dinner histogram
I = find(consData(:, 11) == 3);
h = figure;
subplot(2, 1, 1);
[meanVal, medianVal, modeVal, stdVal] = histogram(consData(I, 8), buckets, 'Dinner Times')
subplot(2, 1, 2);
[meanValW, medianValW, modeValW, stdValW] = weightedHistogram([consData(I, 8), consData(I, 16)], buckets, 'WEIGHTED Dinner Times', h)
print(h, '-dpng', 'NHanes_Plots/dinner.png'); 
mealStats = [mealStats; 0, 3, meanVal, medianVal, modeVal, stdVal; 1, 3, meanValW, medianValW, modeValW, stdValW];
close(h);

%% snack histogram
I = find(consData(:, 11) == 4);
h = figure;
subplot(2, 1, 1);
[meanVal, medianVal, modeVal, stdVal] = histogram(consData(I, 8), buckets, 'Snack Times')
subplot(2, 1, 2);
[meanValW, medianValW, modeValW, stdValW] = weightedHistogram([consData(I, 8), consData(I, 16)], buckets, 'WEIGHTED Snack Times', h)
print(h, '-dpng', 'NHanes_Plots/snack.png'); 
mealStats = [mealStats; 0, 4, meanVal, medianVal, modeVal, stdVal; 1, 4, meanValW, medianValW, modeValW, stdValW];
close(h);

%% misc histogram
I = find(consData(:, 11) == 5);
h = figure;
subplot(2, 1, 1);
[meanVal, medianVal, modeVal, stdVal] = histogram(consData(I, 8), buckets, 'Misc. Times')
subplot(2, 1, 2);
[meanValW, medianValW, modeValW, stdValW] = weightedHistogram([consData(I, 8), consData(I, 16)], buckets, 'WEIGHTED Misc. Times', h)
print(h, '-dpng', 'NHanes_Plots/misc.png'); 
mealStats = [mealStats; 0, 5, meanVal, medianVal, modeVal, stdVal; 1, 5, meanValW, medianValW, modeValW, stdValW];
close(h);

%% bmi histogram
h = figure;
subplot(2, 1, 1);
histogram(consData(:, 15), 100, 'BMI')
subplot(2, 1, 2);
weightedHistogram([consData(:, 15), consData(:, 16)], 100, 'WEIGHTED BMI', h)
print(h, '-dpng', 'NHanes_Plots/bmi.png'); 
close(h);

%% weight histogram
buckets = round(max(consData(:, 14)) - min(consData(:, 14)) + 1);
I = find(consData(:, 14) > 5); % need to remove these small weights to get good look at data
h = figure;
subplot(2, 1, 1);
histogram(consData(I, 14), buckets, 'Weight')
subplot(2, 1, 2);
weightedHistogram([consData(I, 14), consData(I, 16)], buckets, 'WEIGHTED Weight', h)
print(h, '-dpng', 'NHanes_Plots/weight.png'); 
close(h);

%% age histogram
buckets = round(max(consData(:, 12)) - min(consData(:, 12)) + 1);
h = figure;
subplot(2, 1, 1);
histogram(consData(:, 12), buckets, 'Age')
subplot(2, 1, 2);
weightedHistogram([consData(:, 12), consData(:, 16)], buckets, 'WEIGHTED Age', h)
print(h, '-dpng', 'NHanes_Plots/age.png'); 
close(h);

%% save meal stats
csvwrite('NHanes_Plots/meal_meanmedmode.csv', mealStats);

%% cleanup
clear I
clear h
clear mealStats
clear meanVal
clear medianVal
clear modeVal
clear stdVal
clear meanValW
clear medianValW
clear modeValW
clear stdValW
clear buckets
clear consData



%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! FILTERED DATA

%% init
load('Matlab_Data/mealsFiltered.mat', 'mealsFiltered');
load('Matlab_Data/mealsFilteredWeighted.mat', 'mealsFilteredWeighted');
mealStats = [];
buckets = 24;

%% breakfast histogram
h = figure;
subplot(2, 1, 1);
[meanVal, medianVal, modeVal, stdVal] = histogram(mealsFiltered(:, 13), buckets, 'FILTERED Bkfst Times', h)
subplot(2, 1, 2);
[meanValW, medianValW, modeValW, stdValW] = histogram(mealsFilteredWeighted(:, 13), buckets, 'FILTERED WEIGHTED Bkfst Times', h)
print(h, '-dpng', 'NHanes_Plots/filtered_breakfast.png'); 
mealStats = [0, 1, meanVal, medianVal, modeVal, stdVal; 1, 1, meanValW, medianValW, modeValW, stdValW];
close(h);

%% lunch histogram
h = figure;
subplot(2, 1, 1);
[meanVal, medianVal, modeVal, stdVal] = histogram(mealsFiltered(:, 20), buckets, 'FILTERED Lunch Times')
subplot(2, 1, 2);
[meanValW, medianValW, modeValW, stdValW] = histogram(mealsFilteredWeighted(:, 20), buckets, 'FILTERED WEIGHTED Lunch Times', h)
print(h, '-dpng', 'NHanes_Plots/filtered_lunch.png'); 
mealStats = [mealStats; 0, 2, meanVal, medianVal, modeVal, stdVal; 1, 2, meanValW, medianValW, modeValW, stdValW];
close(h);

%% dinner histogram
h = figure;
subplot(2, 1, 1);
[meanVal, medianVal, modeVal, stdVal] = histogram(mealsFiltered(:, 27), buckets, 'FILTERED Dinner Times')
subplot(2, 1, 2);
[meanValW, medianValW, modeValW, stdValW] = histogram(mealsFilteredWeighted(:, 27), buckets, 'FILTERED WEIGHTED Dinner Times', h)
print(h, '-dpng', 'NHanes_Plots/filtered_dinner.png'); 
mealStats = [mealStats; 0, 3, meanVal, medianVal, modeVal, stdVal; 1, 3, meanValW, medianValW, modeValW, stdValW];
close(h);

%% bmi histogram
h = figure;
subplot(2, 1, 1);
histogram(mealsFiltered(:, 5), 100, 'FILTERED BMI')
subplot(2, 1, 2);
histogram(mealsFilteredWeighted(:, 5), 100, 'FILTERED WEIGHTED BMI', h)
print(h, '-dpng', 'NHanes_Plots/filtered_bmi.png'); 
close(h);

%% weight histogram
buckets = round(max(mealsFiltered(:, 4)) - min(mealsFiltered(:, 4)) + 1);
h = figure;
subplot(2, 1, 1);
histogram(mealsFiltered(:, 4), buckets, 'FILTERED Weight')
subplot(2, 1, 2);
histogram(mealsFilteredWeighted(:, 4), buckets, 'FILTERED WEIGHTED Weight', h)
print(h, '-dpng', 'NHanes_Plots/filtered_weight.png'); 
close(h);

%% age histogram
buckets = round(max(mealsFiltered(:, 2)) - min(mealsFiltered(:, 2)) + 1);
h = figure;
subplot(2, 1, 1);
histogram(mealsFiltered(:, 2), buckets, 'FILTERED Age')
subplot(2, 1, 2);
histogram(mealsFilteredWeighted(:, 2), buckets, 'FILTERED WEIGHTED Age', h)
print(h, '-dpng', 'NHanes_Plots/filtered_age.png'); 
close(h);

%% gender histogram
h = figure;
subplot(2, 1, 1);
histogram(mealsFiltered(:, 3), 2, 'FILTERED Gender')
subplot(2, 1, 2);
histogram(mealsFilteredWeighted(:, 3), 2, 'FILTERED WEIGHTED Gender', h)
print(h, '-dpng', 'NHanes_Plots/filtered_gender.png'); 
close(h);

%% save meal stats
csvwrite('NHanes_Plots/filtered_meal_meanmedmode.csv', mealStats);

%% cleanup
clear h
clear mealStats
clear meanVal
clear medianVal
clear modeVal
clear stdVal
clear meanValW
clear medianValW
clear modeValW
clear stdValW
clear buckets
clear mealsFiltered
clear mealsFilteredWeighted
