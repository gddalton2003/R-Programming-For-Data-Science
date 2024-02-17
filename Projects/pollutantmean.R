# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' 
# takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 
# 'pollutantmean' reads that monitors' particulate matter data from the directory specified 
# in the 'directory' argument and returns the mean of the pollutant across all of the monitors, 
# ignoring any missing values coded as NA. 

pollutantmean <- function(directory, pollutant, id = 1:332) {
  directory <- paste(getwd(), "/", directory, "/", sep = "") # set new working directory
  all_files <- list.files(directory) # list files in new directory
  df <- data.frame() # create empty data frame
  for(i in id) { # for loop to read in files in new directory
    file_list <- paste(directory, all_files[i], sep = "")
    each_file <- read.csv(file_list)
    df <- rbind(df, each_file) # bind rows of read files together
  }
  mean(df[[pollutant]], na.rm = TRUE) # calculate requested pollutant mean, remove NAs
}
# Sample Questions And Answers
pollutantmean("specdata", "sulfate", 1:10) # Answer: 4.064128
pollutantmean("specdata", "nitrate", 70:72) # Answer: 1.706047
pollutantmean("specdata", "nitrate", 23) # Answer: 1.280833
