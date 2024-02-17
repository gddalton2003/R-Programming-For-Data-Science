# Write a function that takes a directory of data files and a threshold for complete cases 
# and calculates the correlation between sulfate and nitrate for monitor locations where 
# the number of completely observed cases (on all variables) is greater than the threshold. 
# The function should return a vector of correlations for the monitors that meet the threshold 
# requirement. If no monitors meet the threshold requirement, then the function should return 
# a numeric vector of length 0.

source("Complete.R")
corr <- function(directory, threshold = 0) {
  directory <- paste(getwd(), "/", directory, "/", sep = "") # set the new directory
  all_files <- list.files(directory) # list the files in the directory
  id = 1:332 # give sequence of files in directory
  nobs <- vector() # define empty vector for correlation values
  
  for(i in id) {
    file_list <- paste(directory, all_files[i], sep = "") # give path to file
    each_file <- read.csv(file_list) # read file
    each_file <- subset(each_file, complete.cases(each_file)) # subset file with no NAs
    each_file <- subset(each_file, sum(complete.cases(each_file)) > threshold) # subset file to thresdhold
    nobs <- c(nobs,cor(each_file$nitrate,each_file$sulfate)) # run correaltion
  }
  nobs # this is vector of correlation values with NAs
  nobs <- nobs[!is.na(nobs)] # removes NAs from vector of correlation values
}
# Sample Question And Answer

cr <- corr("specdata", 150)
head(cr)
# Answer: -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
