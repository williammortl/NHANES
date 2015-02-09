%%% Author: William Michael Mortl
%%% Feel free to use this code for educational purposes, any other use
%%%     requires citations to: William Michael Mortl, and
%%%     Sriram Sankaranaraynan

function [meanVal, medianVal, modeVal, stdVal] = weightedHistogram(valsAndWeights, numBins, titleStr, h)

    %% remove NaN vals
    I = find(isnan(valsAndWeights(:, 1)) | isnan(valsAndWeights(:, 2)));
    valsAndWeights(I, :) = [];

    %% get adjusted data weights to bins
    histValues = adjustForWeighting(valsAndWeights, 2);
    histValues = histValues(:, 1);
    
    % get stats
    stdVal = std(histValues);
    meanVal = mean(histValues);
    medianVal = median(histValues);
    modeVal = mode(histValues);
    
    %% create the actual histogram
    hist(histValues, numBins);
    titleStrStats = [titleStr ' -  Mean: ' num2str(meanVal) ', Median: ' num2str(medianVal) ', Mode: ' num2str(modeVal) ', Std Dev: ' num2str(stdVal)];
    title(titleStrStats);
end

