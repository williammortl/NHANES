# NHanes model building in r
# Author: William Michael Mortl
# Feel free to use this code for educational purposes, any other use
#     requires citations to: NHanes study, William Michael Mortl, and
#     Sriram Sankaranaraynan

# This function takes a matrix, a vector of columns which are regressors and a 
#   column which is the dependent variable, then fits the model and eliminates 
#   unimportant columns to fit from and returns the new model plus the regressor 
#   columns, dependent columnm and the model

# library includes

# function to generate a linear model
linearModelGenerate <- function(matrix, fitTo, fitFrom, cutoff = 0.001)
{
  
  repeat
  {
    
    # generate model
    newModel <- lm(matrix[, fitTo] ~ matrix[, fitFrom])
    coeffs <- summary(newModel)$coefficients
    
    # check all coeffs for relevance, must be Pr < 0.001
    toDelete <- c()
    rows <- nrow(coeffs)
    for (itr in 2:rows)
    {
      
      # if greater than cutoff mark for deletion
      if (coeffs[itr, 4] > cutoff)
      {
        toDelete <- c(toDelete, itr - 1)
      }
    }
    
    # delete if necessary
    sizeDelete <- length(toDelete)
    if (sizeDelete == 0)
    {
      outputVar <- list(regressors = fitFrom, dependent = fitTo, model = newModel)
      break
    }
    else
    {
      fitFrom <- fitFrom[-toDelete]
    }
  }
  
  return(outputVar)
}