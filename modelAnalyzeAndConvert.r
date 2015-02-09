# NHanes model conversion and analysis in r
# Author: William Michael Mortl
# Feel free to use this code for educational purposes, any other use
#     requires citations to: NHanes study, William Michael Mortl, and
#     Sriram Sankaranaraynan

# Function takes a model from lm and then analyzes it as well as its
#   residuals and then passes back just the coefficients

# library includes
library('e1071')

# function to analyze and convert a model
modelAnalyzeAndConvert <- function(lmModel, modelName, fileName)
{
  
  # analyze model and residuals
  modelText <- capture.output(summary(lmModel))
  res <- rstandard(lmModel)
  normTest <- capture.output(ks.test(res, 'pnorm', mean = mean(res), sd = sd(res)))
  k_res <- kurtosis(res)
  s_res <- skewness(res)
  meanRes <- mean(res)
  medianRes <- median(res)
  sdRes <- sd(res)
  fileOut <- file(paste(c('Model_Analysis/', 'modeldata-', fileName, '.txt'), collapse = ''))
  writeLines(c(modelText, normTest, 'Model Residual Kurtosis:', k_res, 'Model Residual Skewness:', s_res,
               'Mean of Residuals:', meanRes, 'Median of Residuals:', medianRes, 'Standard Dev. of Residuals:', sdRes), fileOut)
  close(fileOut)
  
  # create and save qqnorm
  jpeg(paste(c('Model_Analysis/', 'qq-', fileName, '.jpg'), collapse = ''))
  qqnorm(res)
  qqline(res)
  dev.off()
  
  # create and save hist
  jpeg(paste(c('Model_Analysis/', 'hist-', fileName, '.jpg'), collapse = ''))
  histData <- hist(res, main = paste(c('Residual Histogram for', modelName), collapse = ' '))
  dev.off()
  fileOut <- file(paste(c('Model_Analysis/', 'histdata-', fileName, '.txt'), collapse = ''))
  writeLines(c('Histogram Breaks:', as.character(histData['breaks']), 'Histogram Counts', as.character(histData['counts'])), fileOut)
  close(fileOut)
  
  # return just the coeffs
  outputVal <- lmModel$coefficients
  return(outputVal)
}