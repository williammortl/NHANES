%% num simulations
numSims = 30000;

%% load meal data
load('Matlab_Data/mealsFilteredWeighted.mat');

%% filter meal data
mealsFilteredWeighted = mealsFilteredWeighted( (isnan(mealsFilteredWeighted(:, 12)) == false) & (isnan(mealsFilteredWeighted(:, 27)) == false), : );
[sizeMFW, ~] = size(mealsFilteredWeighted);

%% create matrix for output
stdDevs = zeros(numSims, 4);
mfwStdDevs = zeros(sizeMFW, 4);

%% get base metrics
metrics = zeros(4, 2);
metrics(1, 1) = mean(mealsFilteredWeighted(:, 13));
metrics(1, 2) = std(mealsFilteredWeighted(:, 13));
metrics(2, 1) = mean(mealsFilteredWeighted(:, 12));
metrics(2, 2) = std(mealsFilteredWeighted(:, 12));
metrics(3, 1) = mean(mealsFilteredWeighted(:, 28));
metrics(3, 2) = std(mealsFilteredWeighted(:, 28));
metrics(4, 1) = mean(mealsFilteredWeighted(:, 27));
metrics(4, 2) = std(mealsFilteredWeighted(:, 27));

%% simulate days
fprintf('\nSimulating %d days...\n', numSims);
dayData = runMultipleSimulations(numSims);

%% analyze simulation data
for row = 1:numSims
    theRow = dayData(row, :);
    
    %% calculate all standard devs
    stdDevs(row, 1) = (metrics(1, 1) - theRow(13)) / metrics(1, 2);
    stdDevs(row, 2) = (metrics(2, 1) - theRow(12)) / metrics(2, 2);
    stdDevs(row, 3) = (metrics(3, 1) - theRow(28)) / metrics(3, 2);
    stdDevs(row, 4) = (metrics(4, 1) - theRow(27)) / metrics(4, 2);
end

%% run stats on mfw
fprintf('\nCalculating std devs for NHANES...\n');
for row = 1:sizeMFW
    theRow = mealsFilteredWeighted(row, :);
    
    %% calculate all standard devs
    mfwStdDevs(row, 1) = (metrics(1, 1) - theRow(13)) / metrics(1, 2);
    mfwStdDevs(row, 2) = (metrics(2, 1) - theRow(12)) / metrics(2, 2);
    mfwStdDevs(row, 3) = (metrics(3, 1) - theRow(28)) / metrics(3, 2);
    mfwStdDevs(row, 4) = (metrics(4, 1) - theRow(27)) / metrics(4, 2);
end
fprintf('\nCompleted calculating std devs for NHANES.\n');

%% plot histograms
for row = 1:4
    h = figure;
    subplot(1, 2, 1);
    hist(stdDevs(:, row), 20);
    set(get(gca,'child'),'FaceColor','g','EdgeColor','b');
    title('Generative Model');
    xlabel('Standard Deviations from the Mean');
    ylabel('Counts');
    subplot(1, 2, 2);
    hist(mfwStdDevs(:, row), 20);
    set(get(gca,'child'),'FaceColor','b','EdgeColor','g');
    title('NHANES Data');
    xlabel('Standard Deviations from the Mean');
    ylabel('Counts');
end

%% cleanup
clear numSims;
clear mealsFilteredWeighted;
clear sizeMFW;
clear dayData;
clear row;
clear theRow;

