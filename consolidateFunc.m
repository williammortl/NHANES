%%% Author: William Michael Mortl
%%% Feel free to use this code for educational purposes, any other use
%%%     requires citations to: NHanes study, William Michael Mortl,
%%%     Sriram Sankaranaraynan, and Fraser Cameron

function [consData] = consolidateFunc(data, dataBMX, dataDemo, inputColID, inputColCarbs, inputColProtein, inputColFiber, inputColTotalFat, inputColGrams, inputColEnergy, inputColTime, dayValue, fileValue, inputColMeal, meals, inputColAge, inputColGender, inputColWeight, inputColBMI, inputCol2YearWeight)

    %% loop through each row, aggregate data
    consData = zeros(100000,16);
    consDataRowCount=1;
    itr=1;
    while itr<size(data,1)
        if data(itr, inputColID) ~=0
            ind=itr-1+find((data(itr, inputColTime) == data(itr:min(size(data,1),itr+20), inputColTime)).* (data(itr, inputColID) == data(itr:min(size(data,1),itr+20), inputColID)));

            %% figure out meal code, TODO: make this prettier... it works though!
            inputMealCode = data(itr, inputColMeal);
            outputMealCode = 5; % 5 defaultly a miscellaneous meal
            for itrMeals = 1:4
                codes = meals{itrMeals};
                [countCodes, ~] = size(codes);
                for itrCodes = 1:countCodes
                    if (inputMealCode == codes(itrCodes))
                        outputMealCode = itrMeals;
                        break;
                    end
                end
                if (outputMealCode ~= 5)
                    break;
                end
            end
            
            %% get age(in months) and gender
            ageVal = -1;
            genderVal = -1;
            I = find(dataDemo(:, inputColID) == data(itr, inputColID));
            [sizeI, ~] = size(I);
            if (sizeI >= 1)
                ageVal = dataDemo(I(1), inputColAge);
                genderVal = dataDemo(I(1), inputColGender);
            end
            
            %% get weight and bmi
            weightVal = -1;
            bmiVal = -1;
            I = find(dataBMX(:, inputColID) == data(itr, inputColID));
            [sizeI, ~] = size(I);
            if (sizeI >= 1)
                weightVal = dataBMX(I(1), inputColWeight);
                bmiVal = dataBMX(I(1), inputColBMI);
            end
            
            
            %% consolidate meal
            row = [data(itr, inputColID)]; % ID
            row = [row, sum(data(ind, inputColCarbs))]; % Carbs
            row = [row, sum(data(ind, inputColProtein))]; % Protein
            row = [row, sum(data(ind, inputColFiber))]; % Fiber
            row = [row, sum(data(ind, inputColTotalFat))]; % Fat
            row = [row, sum(data(ind, inputColGrams))]; % Grams
            row = [row, sum(data(ind, inputColEnergy))]; % Energy
            row = [row, data(itr, inputColTime), dayValue, fileValue]; % Time/Day/File
            row = [row, outputMealCode]; % Meal code
            row = [row, ageVal]; % age
            row = [row, genderVal]; % gender
            row = [row, weightVal]; % weight
            row = [row, bmiVal]; % bmi
            row = [row, data(itr, inputCol2YearWeight)]; % 2 year weight
            consData(consDataRowCount,:) = row;
            consDataRowCount=consDataRowCount+1;
            data(ind, inputColID)=0;
        end
        itr=itr+1;
    end
    consData=consData(1:consDataRowCount-1,:);

    % sort by day, patient, and meal times in ascending order
    consData=sortrows(consData,[9,1,8]);
end