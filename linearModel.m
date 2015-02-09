classdef linearModel

    % PUBLIC properties
    properties
        regressorFields
        dependentField
    end

    % PRIVATE properties
    properties (Access = private)
        coefficients
        numCoefficients
    end
    
    % PUBLIC methods
    methods
        
        %% constructor
        function obj = linearModel(modelFile)
            
            %% read in CSV file
            csvData = csvread(modelFile);
            [~, obj.numCoefficients] = size(csvData);
            
            %% split CSV data
            obj.dependentField = csvData(1, 1);
            obj.regressorFields = csvData(1, 2:obj.numCoefficients);
            obj.coefficients = csvData(2, :);
            
        end
        
        %% predict dependent value from data
        function returnedRegressorData = predictDependent(obj, regressorData, trainingData)
            
            %% init   
            outputVal = NaN;
            [rd_row, rd_col] = size(regressorData);
            if (rd_row > rd_col)
                regressorData = regressorData';
            end
            returnedRegressorData = regressorData;
            valuesToUse = regressorData(obj.regressorFields);
            coeff = obj.coefficients(2:obj.numCoefficients)';
            
            % loop until is a real number
            while ((isnan(outputVal)) || (outputVal <= 0))
            
                %% calculate the dependent value
                outputVal = obj.coefficients(1) + (valuesToUse * coeff);

                %% add a random residual if training data is passed in
                if (nargin > 2)

                    % pick a random row to determine residual from
                    [sizeTrainingData, ~] = size(trainingData);
                    randomRow = trainingData(randi(sizeTrainingData, 1, 1), :);
                    while (isnan(sum(randomRow)))
                        randomRow = trainingData(randi(sizeTrainingData, 1, 1), :);
                    end
                    valuesToUse = randomRow(obj.regressorFields);

                    % determine residual and then add to existing dependent value
                    actualValue = randomRow(obj.dependentField);
                    predictedValue = (obj.coefficients(1) + (valuesToUse * coeff));
                    residualValue = actualValue - predictedValue;
                    outputVal = outputVal + residualValue;
                    if (outputVal < 0)
                        outputVal = 0;
                    end

                end
                
            end

            %% set output value
            returnedRegressorData(obj.dependentField) = outputVal;
            
        end
        
    end
    
    % PRIVATE methods
    methods (Access = private)
    end
    
end

