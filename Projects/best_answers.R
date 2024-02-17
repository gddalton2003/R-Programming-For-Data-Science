# Finding The Best Hospital In A State #
# Using Data From the Hospital Compare Website http://hospital.compare.hhs.gov #
# Data Used For This Analysis Is The "outcome-of-care-measures.csv" File From #
# The Website. The Hospitals Are Ranked By Outcome In A State Using The Function #
# Below Called "best". The Function Takes Two Arguments (1) A 2 Character State #
# Abbreviated Name And (2) An Outcome Name. The Function Returns A Character #
# Vector With The Name Of The Hospital That Has The Best Or Lowest 30-Day #
# Mortality For The Specified Outcome In That State. Hospitals That Do Not #
# Have Data On A Particular Outcome Should Be Excluded From The Set Of Hospitals #
# When Deciding The Rankings. If There Is A Tie Between Hospitals For An Outcome #
# The Hospital Names Should Be Sorted Alphabetically To Determine Their Position #
# In The List. The Function Should Return "invalid state" If An Incorrect State #
# Abbreviation Is Entered As Well As "invalid outcome" If An Incorrect Outcome #
# Is Entered. #

library(datasets)
accepted_outcomes <- c("heart attack", "pneumonia", "heart failure")
best <- function(state, outcome) {
  ## Read outcome data
  table <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid 
  if(!(state %in% state.abb)) {stop("invalid state")}
  if(!(outcome %in% accepted_outcomes)) {stop("invalid outcome")}
  
  ## Change Column Names To Match Accepted_Outcomes Names
  colnames(table)[13] <- "heart attack"
  colnames(table)[19] <- "heart failure"
  colnames(table)[25] <- "pneumonia"
  
  # Row subsets matching state and without "Not Available" values
  table <- table[table$State == state & table[outcome] != "Not Available", ]
  
  # Returns the row in which the outcome has the minium value
  data <- table[which.min(table[ ,outcome]), ]
  # Order the rows by the outcome column and then by hospital name
  data <- data[order(data$Hospital.Name),]
  hospital_name <- data[ ,"Hospital.Name"]
  hospital_name
}
# Sample Questions And Answers #
best("TX", "heart attack") # CYPRESS FAIRBANKS MEDICAL CENTER
best("TX", "heart failure") # FORT DUNCAN MEDICAL CENTER
best("MD", "heart attack") # JOHNS HOPKINS HOSPITAL THE
best("MD", "pneumonia") # GREATER BALTIMORE MEDICAL CENTER
best("BB", "heart attack") # Error in best("BB", "heart attack") : invalid state
best("NY", "hert attack") # Error in best("NY", "hert attack") : invalid outcome
best("SC", "heart attack") # MUSC Medical Center
best("NY", "pneumonia") # MAIMONIDES MEDICAL CENTER
best("AK", "pneumonia") # YUKON KUSKOKWIM DELTA REG HOSPITAL
