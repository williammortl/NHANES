%%% Author: William Michael Mortl
%%% Feel free to use this code for educational purposes, any other use
%%%     requires citations to: NHanes study, William Michael Mortl, and
%%%     Sriram Sankaranaraynan

function [dataOut] = adjustForWeighting(dataIn, weightCol)

    %% init
    [numVals, numAttributes] = size(dataIn);
    minWeight = min(dataIn(find(dataIn(:, weightCol) > 0), weightCol));
    
    %% create matrix
    totalRows = 0;
    for itr = 1:numVals
        numCopies = ceil(dataIn(itr, weightCol) / minWeight);
        totalRows = totalRows + numCopies;
    end
    dataOut = zeros(totalRows, numAttributes);
    
    %% copy data
    outputRow = 1;
    for itr = 1:numVals
        numCopies = ceil(dataIn(itr, weightCol) / minWeight);
        rowToCopy = dataIn(itr, :);
        for itrCopies = 1:numCopies
            for itrAttr = 1:numAttributes
                dataOut(outputRow, itrAttr) = rowToCopy(itrAttr);
            end
            outputRow = outputRow + 1;
        end
    end
end

