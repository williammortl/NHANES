# NHanes model building and analysis in r
# Author: William Michael Mortl
# Feel free to use this code for educational purposes, any other use
#     requires citations to: NHanes study, William Michael Mortl, and
#     Sriram Sankaranaraynan

# set working directory, NEED TO CHANGE THIS TO RUN ON YOUR MACHINE
setwd('~/Documents/Code/NHANES')

# other file includes
source('modelAnalyzeAndConvert.r')
source('linearModelGenerate.r')
source('linearModelSave.r')

# load data
print('Loading data...')
mealData <- as.matrix(read.table('Matlab_Data/mealsFilteredWeighted.csv', sep = ","))
print('Completed loading data.')

# seperate male and female data, then remove unified data set
mealData_M <- mealData[which(mealData[,3] == 1),]
lenMealData_M <- nrow(mealData_M)
mealData_F <- mealData[which(mealData[,3] != 1),]
lenMealData_F <- nrow(mealData_F)
if ((lenMealData_M + lenMealData_F) != nrow(mealData))
{
  stop('Row counts do not match!')
}
remove(mealData)

# create output subdirectories
dir.create('Model_Analysis')
dir.create('Models')

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! BUILD Breakfast MODELS for generative model
print('Building and ANALYZING breakfast models...')
# male
b_Times_M <- linearModelGenerate(mealData_M, 13, c(2, 5))
b_Times_M$model <- modelAnalyzeAndConvert(b_Times_M$model, 'Breakfast Times, Males', 'b_times_m')
b_Calories_M <- linearModelGenerate(mealData_M, 12, c(2, 5))
b_Calories_M$model <- modelAnalyzeAndConvert(b_Calories_M$model, 'Breakfast Calories, Males', 'b_cals_m')
b_Grams_M <- linearModelGenerate(mealData_M, 11, c(2, 5))
b_Grams_M$model <- modelAnalyzeAndConvert(b_Grams_M$model, 'Breakfast Grams, Males', 'b_grams_m')
b_Carbs_M <- linearModelGenerate(mealData_M, 7, c(2, 5, 11, 12))
b_Carbs_M$model <- modelAnalyzeAndConvert(b_Carbs_M$model, 'Breakfast Carbs, Males', 'b_carbs_m')
b_Protein_M <- linearModelGenerate(mealData_M, 8, c(2, 5, 11, 12))
b_Protein_M$model <- modelAnalyzeAndConvert(b_Protein_M$model, 'Breakfast Protein, Males', 'b_protein_m')
b_Fat_M <- linearModelGenerate(mealData_M, 10, c(2, 5, 7, 8, 11, 12))
b_Fat_M$model <- modelAnalyzeAndConvert(b_Fat_M$model, 'Breakfast Fat, Males', 'b_fat_m')
b_Fiber_M <- linearModelGenerate(mealData_M, 9, c(2, 5, 7, 8, 11, 12))
b_Fiber_M$model <- modelAnalyzeAndConvert(b_Fiber_M$model, 'Breakfast Fiber, Males', 'b_fiber_m')

#female
b_Times_F <- linearModelGenerate(mealData_F, 13, c(2, 5))
b_Times_F$model <- modelAnalyzeAndConvert(b_Times_F$model, 'Breakfast Times, Females', 'b_times_F')
b_Calories_F <- linearModelGenerate(mealData_F, 12, c(2, 5))
b_Calories_F$model <- modelAnalyzeAndConvert(b_Calories_F$model, 'Breakfast Calories, Females', 'b_cals_F')
b_Grams_F <- linearModelGenerate(mealData_F, 11, c(2, 5))
b_Grams_F$model <- modelAnalyzeAndConvert(b_Grams_F$model, 'Breakfast Grams, Females', 'b_grams_F')
b_Carbs_F <- linearModelGenerate(mealData_F, 7, c(2, 5, 11, 12))
b_Carbs_F$model <- modelAnalyzeAndConvert(b_Carbs_F$model, 'Breakfast Carbs, Females', 'b_carbs_F')
b_Protein_F <- linearModelGenerate(mealData_F, 8, c(2, 5, 11, 12))
b_Protein_F$model <- modelAnalyzeAndConvert(b_Protein_F$model, 'Breakfast Protein, Females', 'b_protein_F')
b_Fat_F <- linearModelGenerate(mealData_F, 10, c(2, 5, 7, 8, 11, 12))
b_Fat_F$model <- modelAnalyzeAndConvert(b_Fat_F$model, 'Breakfast Fat, Females', 'b_fat_F')
b_Fiber_F <- linearModelGenerate(mealData_F, 9, c(2, 5, 7, 8, 11, 12))
b_Fiber_F$model <- modelAnalyzeAndConvert(b_Fiber_F$model, 'Breakfast Fiber, Females', 'b_fiber_F')

# save models
linearModelSave(b_Times_M, 'b_Times_M')
linearModelSave(b_Calories_M, 'b_Calories_M')
linearModelSave(b_Grams_M, 'b_Grams_M')
linearModelSave(b_Carbs_M, 'b_Carbs_M')
linearModelSave(b_Protein_M, 'b_Protein_M')
linearModelSave(b_Fat_M, 'b_Fat_M')
linearModelSave(b_Fiber_M, 'b_Fiber_M')
linearModelSave(b_Times_F, 'b_Times_F')
linearModelSave(b_Calories_F, 'b_Calories_F')
linearModelSave(b_Grams_F, 'b_Grams_F')
linearModelSave(b_Carbs_F, 'b_Carbs_F')
linearModelSave(b_Protein_F, 'b_Protein_F')
linearModelSave(b_Fat_F, 'b_Fat_F')
linearModelSave(b_Fiber_F, 'b_Fiber_F')



#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! BUILD LUNCH MODELS
print('Building and ANALYZING lunch models...')
# male
l_Times_M <- linearModelGenerate(mealData_M, 21, c(2, 5, 7:13))
l_Times_M$model <- modelAnalyzeAndConvert(l_Times_M$model, 'Time Since Breakfast, Males', 'l_times_m')
l_Calories_M <- linearModelGenerate(mealData_M, 19, c(2, 5, 7:13))
l_Calories_M$model <- modelAnalyzeAndConvert(l_Calories_M$model, 'Lunch Calories, Males', 'l_cals_m')
l_Grams_M <- linearModelGenerate(mealData_M, 18, c(2, 5, 7:13))
l_Grams_M$model <- modelAnalyzeAndConvert(l_Grams_M$model, 'Lunch Grams, Males', 'l_grams_m')
l_Carbs_M <- linearModelGenerate(mealData_M, 14, c(2, 5, 7:13, 18, 19))
l_Carbs_M$model <- modelAnalyzeAndConvert(l_Carbs_M$model, 'Lunch Carbs, Males', 'l_carbs_m')
l_Protein_M <- linearModelGenerate(mealData_M, 15, c(2, 5, 7:13, 18, 19))
l_Protein_M$model <- modelAnalyzeAndConvert(l_Protein_M$model, 'Lunch Protein, Males', 'l_protein_m')
l_Fat_M <- linearModelGenerate(mealData_M, 17, c(2, 5, 7:13, 14, 15, 18, 19))
l_Fat_M$model <- modelAnalyzeAndConvert(l_Fat_M$model, 'Lunch Fat, Males', 'l_fat_m')
l_Fiber_M <- linearModelGenerate(mealData_M, 16, c(2, 5, 7:13, 14, 15, 18, 19))
l_Fiber_M$model <- modelAnalyzeAndConvert(l_Fiber_M$model, 'Lunch Fiber, Males', 'l_fiber_m')

#female
l_Times_F <- linearModelGenerate(mealData_F, 21, c(2, 5, 7:13))
l_Times_F$model <- modelAnalyzeAndConvert(l_Times_F$model, 'Time Since Breakfast, Females', 'l_times_F')
l_Calories_F <- linearModelGenerate(mealData_F, 19, c(2, 5, 7:13))
l_Calories_F$model <- modelAnalyzeAndConvert(l_Calories_F$model, 'Lunch Calories, Females', 'l_cals_F')
l_Grams_F <- linearModelGenerate(mealData_F, 18, c(2, 5, 7:13))
l_Grams_F$model <- modelAnalyzeAndConvert(l_Grams_F$model, 'Lunch Grams, Females', 'l_grams_F')
l_Carbs_F <- linearModelGenerate(mealData_F, 14, c(2, 5, 7:13, 18, 19))
l_Carbs_F$model <- modelAnalyzeAndConvert(l_Carbs_F$model, 'Lunch Carbs, Females', 'l_carbs_F')
l_Protein_F <- linearModelGenerate(mealData_F, 15, c(2, 5, 7:13, 18, 19))
l_Protein_F$model <- modelAnalyzeAndConvert(l_Protein_F$model, 'Lunch Protein, Females', 'l_protein_F')
l_Fat_F <- linearModelGenerate(mealData_F, 17, c(2, 5, 7:13, 14, 15, 18, 19))
l_Fat_F$model <- modelAnalyzeAndConvert(l_Fat_F$model, 'Lunch Fat, Females', 'l_fat_F')
l_Fiber_F <- linearModelGenerate(mealData_F, 16, c(2, 5, 7:13, 14, 15, 18, 19))
l_Fiber_F$model <- modelAnalyzeAndConvert(l_Fiber_F$model, 'Lunch Fiber, Females', 'l_fiber_F')

# save models
linearModelSave(l_Times_M, 'l_Times_M')
linearModelSave(l_Calories_M, 'l_Calories_M')
linearModelSave(l_Grams_M, 'l_Grams_M')
linearModelSave(l_Carbs_M, 'l_Carbs_M')
linearModelSave(l_Protein_M, 'l_Protein_M')
linearModelSave(l_Fat_M, 'l_Fat_M')
linearModelSave(l_Fiber_M, 'l_Fiber_M')
linearModelSave(l_Times_F, 'l_Times_F')
linearModelSave(l_Calories_F, 'l_Calories_F')
linearModelSave(l_Grams_F, 'l_Grams_F')
linearModelSave(l_Carbs_F, 'l_Carbs_F')
linearModelSave(l_Protein_F, 'l_Protein_F')
linearModelSave(l_Fat_F, 'l_Fat_F')
linearModelSave(l_Fiber_F, 'l_Fiber_F')



#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! BUILD DINNER MODELS
print('Building and ANALYZING dinner models...')
# male
d_Times_M <- linearModelGenerate(mealData_M, 30, c(2, 5, 7:20))
d_Times_M$model <- modelAnalyzeAndConvert(d_Times_M$model, 'Time Since Lunch, Males', 'd_times_m')
d_Calories_M <- linearModelGenerate(mealData_M, 27, c(2, 5, 7:20))
d_Calories_M$model <- modelAnalyzeAndConvert(d_Calories_M$model, 'Dinner Calories, Males', 'd_cals_m')
d_Grams_M <- linearModelGenerate(mealData_M, 26, c(2, 5, 7:20))
d_Grams_M$model <- modelAnalyzeAndConvert(d_Grams_M$model, 'Dinner Grams, Males', 'd_grams_m')
d_Carbs_M <- linearModelGenerate(mealData_M, 22, c(2, 5, 7:20, 26, 27))
d_Carbs_M$model <- modelAnalyzeAndConvert(d_Carbs_M$model, 'Dinner Carbs, Males', 'd_carbs_m')
d_Protein_M <- linearModelGenerate(mealData_M, 23, c(2, 5, 7:20, 26, 27))
d_Protein_M$model <- modelAnalyzeAndConvert(d_Protein_M$model, 'Dinner Protein, Males', 'd_protein_m')
d_Fat_M <- linearModelGenerate(mealData_M, 25, c(2, 5, 7:20, 22, 23, 26, 27))
d_Fat_M$model <- modelAnalyzeAndConvert(d_Fat_M$model, 'Dinner Fat, Males', 'd_fat_m')
d_Fiber_M <- linearModelGenerate(mealData_M, 24, c(2, 5, 7:20, 22, 23, 26, 27))
d_Fiber_M$model <- modelAnalyzeAndConvert(d_Fiber_M$model, 'Dinner Fiber, Males', 'd_fiber_m')

#female
d_Times_F <- linearModelGenerate(mealData_F, 30, c(2, 5, 7:20))
d_Times_F$model <- modelAnalyzeAndConvert(d_Times_F$model, 'Time Since Breakfast, Females', 'd_times_F')
d_Calories_F <- linearModelGenerate(mealData_F, 27, c(2, 5, 7:20))
d_Calories_F$model <- modelAnalyzeAndConvert(d_Calories_F$model, 'Dinner Calories, Females', 'd_cals_F')
d_Grams_F <- linearModelGenerate(mealData_F, 26, c(2, 5, 7:20))
d_Grams_F$model <- modelAnalyzeAndConvert(d_Grams_F$model, 'Dinner Grams, Females', 'd_grams_F')
d_Carbs_F <- linearModelGenerate(mealData_F, 22, c(2, 5, 7:20, 26, 27))
d_Carbs_F$model <- modelAnalyzeAndConvert(d_Carbs_F$model, 'Dinner Carbs, Females', 'd_carbs_F')
d_Protein_F <- linearModelGenerate(mealData_F, 23, c(2, 5, 7:20, 26, 27))
d_Protein_F$model <- modelAnalyzeAndConvert(d_Protein_F$model, 'Dinner Protein, Females', 'd_protein_F')
d_Fat_F <- linearModelGenerate(mealData_F, 25, c(2, 5, 7:20, 22, 23, 26, 27))
d_Fat_F$model <- modelAnalyzeAndConvert(d_Fat_F$model, 'Dinner Fat, Females', 'd_fat_F')
d_Fiber_F <- linearModelGenerate(mealData_F, 24, c(2, 5, 7:20, 22, 23, 26, 27))
d_Fiber_F$model <- modelAnalyzeAndConvert(d_Fiber_F$model, 'Dinner Fiber, Females', 'd_fiber_F')

# save models
linearModelSave(d_Times_M, 'd_Times_M')
linearModelSave(d_Calories_M, 'd_Calories_M')
linearModelSave(d_Grams_M, 'd_Grams_M')
linearModelSave(d_Carbs_M, 'd_Carbs_M')
linearModelSave(d_Protein_M, 'd_Protein_M')
linearModelSave(d_Fat_M, 'd_Fat_M')
linearModelSave(d_Fiber_M, 'd_Fiber_M')
linearModelSave(d_Times_F, 'd_Times_F')
linearModelSave(d_Calories_F, 'd_Calories_F')
linearModelSave(d_Grams_F, 'd_Grams_F')
linearModelSave(d_Carbs_F, 'd_Carbs_F')
linearModelSave(d_Protein_F, 'd_Protein_F')
linearModelSave(d_Fat_F, 'd_Fat_F')
linearModelSave(d_Fiber_F, 'd_Fiber_F')

#completed!
print('Completed.')