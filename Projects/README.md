  Several R files are contained in this Projects folder that demonstrate a variety of skills that I use to write R code that include:
  General Statistics, Algorithms, Computer Programming, Computer Programming Tools, Data Analysis, Data Analysis Software, Data Management, 
  Data Structures, Problem Solving, Statistical Programming, and Data Wrangling.
  
  The **outcome-of-care-measures.csv** file is provided for the files related to hospital quality (**rankhospital.R, best.R**). The corr.R, complete.R,
  and pollutantmean.R files contain code for 3 functions that read data from a zip file containing 332 comma-separated-value (CSV) files containing 
  pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from a single 
  monitor and the ID number for each monitor is contained in the file name. The function 'pollutantmean' calculates the mean of a pollutant (sulfate or
  nitrate) across a specified list of monitors. The function 'complete.R' reads a directory full of files and reports the number of completely observed 
  cases in each data file. The function 'corr.R' takes a directory of data files and a threshold for complete cases and calculates the correlation between 
  sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold.

  The cachematrix.R file contains an R function that is able to cache potentially time-consuming computations. For example, taking the mean of a numeric vector 
  is typically a fast operation. However, for a very long vector, it may take too long to compute the mean, especially if it has to be computed repeatedly (e.g.
  in a loop). If the contents of a vector are not changing, it may make sense to cache the value of the mean so that when we need it again, it can be looked up 
  in the cache rather than recomputed. The '<<-' operator can be used to assign a value to an object in an environment that is different from the current environment. 
  In the R file cachematrix.R, two functions are used to do this. The first function 'makeCacheMatrix' creates a special  matrix object that can cache its inverse. 
  The second function 'cacheSolve' computes the inverse of the special matrix. If the inverse has been calculated, cacheSolve retrieves the inverse from the cache. The 
  'solve' function in R computes the inverse of a matrix.





