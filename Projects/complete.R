# Write a function that reads a directory full of files and reports the number of completely
# observed cases in each data file. The function should return a data frame where the first 
# column is the name of the file and the second column is the number of complete cases.
complete <- function(directory, id = 1:332) {
  directory <- paste(getwd(), "/", directory, "/", sep = "") # create new directory
  all_files <- list.files(directory) # list files in new directory
  ids <- vector() # create vector of ids
  nobs <- vector() # create vector of nobs
  for(i in id) {
    file_list <- paste(directory, all_files[i], sep = "") # create address for each file in directory
    each_file <- read.csv(file_list) # read in each file
    ids <- c(ids, i) # add id of each file to ids vector
    nobs <- c(nobs, sum(complete.cases(each_file))) # sum complete cases for each id to nobs vector
  }
  data.frame(id = ids, nobs = nobs) # create data frame with ids and nobs
}
complete("specdata", 1) 
# Answer
# id   nobs
#  1   117
complete("specdata", c(2, 4, 8, 10, 12))
# Answer
#  id   nobs
#  2    1041
#  4    474
#  8    192
# 10    148
# 12     96
complete("specdata", 30:25)
# Answer
#  id   nobs
#  30   932
#  29   711
#  28   475
#  27   338
#  26   586
#  25   463
complete("specdata", 3)
#  id   nobs
#  3    243
