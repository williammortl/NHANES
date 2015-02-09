%%% Author: William Michael Mortl
%%% Feel free to use this code for educational purposes, any other use
%%%     requires citations to: William Michael Mortl, and
%%%     Sriram Sankaranaraynan

function [meanVal, medianVal, modeVal, stdVal] = histogram(vals, numBins, titleStr, h)

    %% remove NaN vals
    I = find(isnan(vals(:)));
    vals(I) = [];
    
    % get stats
    stdVal = std(vals);
    meanVal = mean(vals);
    medianVal = median(vals);
    modeVal = mode(vals);
    
    %% create the actual histogram
    hist(vals, numBins);
    titleStrStats = [titleStr ' - Mean: ' num2str(meanVal) ', Median: ' num2str(medianVal) ', Mode: ' num2str(modeVal) ', Std Dev: ' num2str(stdVal)];
    title(titleStrStats);

end

