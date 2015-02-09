classdef mealModel

    % PUBLIC properties
    properties
        genderCode      % 'M' male, otherwise female
        mealCode        % 'b' - breakfast, 'l' - lunch, 'd' - dinner... defaults 'b'
    end

    % PRIVATE properties
    properties (Access = private)
        modelTimes
        modelCalories
        modelCarbs
        modelProtein
        modelGrams
        modelFat
        modelFiber
    end
    
    % PUBLIC methods
    methods
        
        %% constructor
        function obj = mealModel(genderCode, mealCode)
            
            %% configure inputs
            if (genderCode ~= 'M')
                genderCode = 'F';
            end
            if ((mealCode ~= 'b') && (mealCode ~= 'l') && (mealCode ~= 'd'))
                mealCode = 'b';
            end
            obj.genderCode = genderCode;
            obj.mealCode = mealCode;
            file_modelTime = ['Models/' mealCode '_Times_' genderCode '.csv'];
            file_modelCalories = ['Models/' mealCode '_Calories_' genderCode '.csv'];
            file_modelCarbs = ['Models/' mealCode '_Carbs_' genderCode '.csv'];
            file_modelProtein = ['Models/' mealCode '_Protein_' genderCode '.csv'];
            file_modelGrams = ['Models/' mealCode '_Grams_' genderCode '.csv'];
            file_modelFat = ['Models/' mealCode '_Fat_' genderCode '.csv'];
            file_modelFiber = ['Models/' mealCode '_Fiber_' genderCode '.csv'];
            
            %% open models
            obj.modelTimes = linearModel(file_modelTime);
            obj.modelCalories = linearModel(file_modelCalories);
            obj.modelCarbs = linearModel(file_modelCarbs);
            obj.modelProtein = linearModel(file_modelProtein);
            obj.modelGrams = linearModel(file_modelGrams);
            obj.modelFat = linearModel(file_modelFat);
            obj.modelFiber = linearModel(file_modelFiber);
            
        end
        
        %% predict dependent value from data
        function returnedRegressorData = predictMeal(obj, regressorData, trainingData)
            
            %% fill in fields by regressing the meal
            returnedRegressorData = obj.modelTimes.predictDependent(regressorData, trainingData);
            returnedRegressorData = obj.modelCalories.predictDependent(returnedRegressorData, trainingData);
            returnedRegressorData = obj.modelCarbs.predictDependent(returnedRegressorData, trainingData);
            returnedRegressorData = obj.modelProtein.predictDependent(returnedRegressorData, trainingData);
            returnedRegressorData = obj.modelGrams.predictDependent(returnedRegressorData, trainingData);
            returnedRegressorData = obj.modelFat.predictDependent(returnedRegressorData, trainingData);
            returnedRegressorData = obj.modelFiber.predictDependent(returnedRegressorData, trainingData);
            
            %% meal specific field updates
            if (obj.mealCode == 'l')
                returnedRegressorData(20) = returnedRegressorData(13) + returnedRegressorData(21);
            elseif (obj.mealCode == 'd')
                returnedRegressorData(28) = returnedRegressorData(20) + returnedRegressorData(30);
                returnedRegressorData(29) = returnedRegressorData(21) + returnedRegressorData(30);
            end
            
        end
        
    end
    
    % PRIVATE methods
    methods (Access = private)
    end
    
end

