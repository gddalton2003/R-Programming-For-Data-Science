# Ranking Hospitals By Outcome In A State #
# Using Data From the Hospital Compare Website http://hospital.compare.hhs.gov #
# Data Used For This Analysis Is The "outcome-of-care-measures.csv" File From #
# The Website. The Hospitals Are Ranked In Each State By Outcome Using The Function #
# Called "rankhospital". The Function Takes Three Arguments (1) A 2 Character State #
# Abbreviated Name, (2) An Outcome Name, And (3) The Ranking Of A Hospital In That #
# State For That Outcome (num). The Function Returns A Character Vector With The #
# Name Of The Hospital That Has The Ranking Specified By The num Argument #
# The call rankhospital("MD", "heart failure", 5) Returns A Character Vector #
# Containing The Name Of The Hospital With The 5th Lowest 30-Day Death Rate For #
# Heart Failure. The num Argument Can Take The Values "best", "worst", or an integer #
# Indicating The Ranking (Smaller Numbers Are Better). If The Number Given By num #
# Is Larger Than The Number Of Hospitals In That State, Then The Function Should #
# Return NA. Hospitals That Do Not Have Data ON A Particular Outcome Should Be #
# Excluded From The Set Of Hospitals When Deciding The Rankings. If Two Hospitals #
# Have The Same Mortality Rate Ties Should Be Broken By Listing Them Alphabetically #
# If An Invalid State Abbreviation Is Entered The Function Should Return "invalid state" #
# While "invalid outcome" Should Be Returned If A Wrong Outcome Is Entered. #


library(datasets)
accepted_outcomes <- c("heart attack", "pneumonia", "heart failure")

rankhospital <- function(state, outcome, num) {
  ## Read outcome data
  table <- read.csv("outcome-of-care-measures.csv", stringsAsFactors=FALSE)
  
  ## Check that state and outcome are valid
  if(!(state %in% state.abb)) {stop("invalid state")}
  if(!(outcome %in% accepted_outcomes)) {stop("invalid outcome")}
  
  ## Change Column Names To Match accepted_outcomes Names
  colnames(table)[11] <- "heart attack"
  colnames(table)[17] <- "heart failure"
  colnames(table)[23] <- "pneumonia"
  
  ## Row subsets matching state values
  table <- table[table$State == state, ]
  
  ## Subset table containing only Hospital.Name and outcome for the state
  table <- subset(table, select = c("Hospital.Name", outcome))
  ## Remove rows with "Not Available" in outcome column
  table <- table[table[outcome] != "Not Available", ]
  
  ## Convert outcome column to double
  table[outcome] <- as.double(table[,outcome])
  
  ## Order data according to outcome and then by Hospital.Name
  table <- table[order(table[outcome],table$Hospital.Name), ]
  
  ## Return hosptial name in that state with the given rank
  ## 30-day death rate
  if(num == "best") {hospital <- table[1,"Hospital.Name"]}
  else if(num == "worst") {hospital <- table[nrow(table),"Hospital.Name"]}
  else if(num > nrow(table)) {hospital <- "NA"}
  else {hospital <- table[num,"Hospital.Name"]}
  hospital
}
# Sample Questions And Answers
rankhospital("TX", "heart failure", 4) # Answer: DETAR HOSPITAL NAVARRO
rankhospital("MD", "heart attack", "worst") # Answer: HARFORD MEMORIAL HOSPITAL
rankhospital("MN", "heart attack", 5000) # Answer: NA
rankhospital("MD", "heart failure", 5) # SAINT AGNES HOSPITAL
rankhospital("NC", "heart attack", "worst") # WAYNE MEMORIAL HOSPITAL
rankhospital("WA", "heart attack", 7) # YAKIMA VALLEY MEMORIAL HOSPITAL
rankhospital("TX", "pneumonia", 10) # SETON SMITHVILLE REGIONAL HOSPITAL
rankhospital("NY", "heart attack", 7) # BELLEVUE HOSPITAL CENTER
