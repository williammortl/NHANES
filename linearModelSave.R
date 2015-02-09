# NHanes model saving in r
# Author: William Michael Mortl
# Feel free to use this code for educational purposes, any other use
#     requires citations to: NHanes study, William Michael Mortl, and
#     Sriram Sankaranaraynan

# This function saves a linear model
# Ouput is as follows:
#   ROW1: [dependent variable column], [regressor column 1], ..., [regressor column n]
#   ROW2: [intercept constant], [regression constant for column 1], ..., [regression constant for column n]

# library includes

# function to save a linear model
linearModelSave <- function(model, filename)
{
  
  matrixToSave = matrix(c(model$dependent, model$regressors, model$model), ncol = length(model$model), nrow = 2, byrow = TRUE)
  write.table(matrixToSave, file = paste(c('Models/', filename, '.csv'), collapse = ''), sep = ",", eol = "\n", row.names = FALSE, col.names = FALSE)

}