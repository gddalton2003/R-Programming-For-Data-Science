ls() ## list names of objects present in working directory ##
rm(list=ls()) ## erase existing R objects in directory before running code for this job ##
ls() ## confrim no R objects are in working directory ##


## Load the csv file named P02_03 that is in your current working directory ##
P02_03 <- read.csv("P02_03.csv", sep = ",")

## Attach the dataframe P02_03 ##
attach(P02_03) ## attach () lets you access variables in data frame without using functions/methods ##

## Determine number of rows and columns ##
dim(P02_03)

## Determine class of the P02_03 object ##
class(P02_03) ## should be a data frame ##

## List names of columns in P02_03 ##
colnames(P02_03)

## Data Wrangling ##
## Problem 1 ##
## Identify all respondents who are female, middle-aged, with 2 children ##
## Determine average salary of this subset ##
## Under Gender, Male is 1 and Female is 2 ##
## Create Female Subset ##
female <- P02_03[P02_03$Gender == 2, ]
dim(female) ## determine rows and columns in female variable ##
female ## view female data frame ##

## Take female subset, and subset for middle-aged participants only ##
middleage <- female[female$Age == "Middle-aged", ]
dim(middleage) ## determine rows and columns in middleage variable ##
middleage ## view middleage data frame ##

## Take middleage subset, and subset for participants with 2 children ##
kids <- middleage[middleage$Children == 2, ]
dim(kids) ## determined rows and columns in kids variable ##
kids ## view kids data frame ##

## Get average salary of females that are middle-aged with 2 kids ##
colnames(kids) ## view column names in kids data frame ##
print(sapply(kids, class)) ## returns data type of each columns in kids ##
## if $ is in Salary column and if it is read as character type and not numeric ##
## kids$Salary = as.numeric(as.character(kids$Salary)) - conversts to numeric ## 
## transform(kids,Salary = as.numeric(Salary)) - or do it this way ##
## now calculate averate salary in kids subset ##
salary <- mean(kids$Salary)
salary # answer is 98573.06

## Data Wrangling ##
## Problem 2 ##
## Identify all respondents from P02_03 who are elderly and strongly agree with the environmental policy ##
## in the Opinion column. What is this groups average salary? ##

## Subset out the elderly ##
colnames(P02_03) ## view columns names of P02_03 data frame ##
elderly <- P02_03[P02_03$Age == "Elderly",] ## subset out elderly ##
dim(elderly) ## number of rows and columns in elderly data frame ##
elderly ## view elderly data frame ##

## Subset elderly dataset for those who strongly agree with policy ##
agree <- elderly[elderly$Opinion == "Strongly agree", ]
dim(agree) ## view # of rows and columns in agree data frame ##
agree ## view agree data frame ##
## Get average salary of disagree dataset ##
salary2 <- mean(agree$Salary)
salary2  # Answer is 74213

## Data Wrangling ##
## Problem 3 ##
## Identify all respondents who strongly agree with the environmental policy. ##
## What proportion of these people are young? ##
## Subset out those who strongly agree ##
strong <- P02_03[P02_03$Opinion == "Strongly agree",]
dim(strong) ## look at # of rows and columns in strong data frame ##
all <- nrow(strong) ## create "all" variable with # of respondents who strongly agree ##
strong ## view strong data frame ##
young <- strong[strong$Age == "Young",] ## subset strong to include those who are young ##
dim(young) ## view # of rows and columns in young data frame #
baby <- nrow(young) # create "baby" variable with # of young in strong data frame ##
young ## view young data frame
prop <- baby/all ## calculate proportion of young people who strongly agree and store in "prop" variable ##
prop ## Answer is .2093023

## If done, detach file ##
detach(P02_03)

## Use Filter Function to subset ##
library(tidyverse) ## load tidyverse package ##
file <- read.csv("P02_03.csv", sep = ",") ## read in P02_03 csv file ##
attach(file) ## attach data frame ##
dim(file) ## look at # of rows and columns in data frame ##
colnames(file) ## look at column names in data frame ##
print(sapply(file, class)) ## look at class of each variable simultaneously ##
view(file) ## view data frame ##
## subset by row with filter(), use cut column, take only rows with a certain value of cut ##
## Answer Problem 1 from above using filter function ##
file_female <- filter(file, Gender == 2)
dim(file_female) ## view # of rows and columns in data frame ##
view(file_female) ## view data frame ##
female_age <- filter(file_female, Age == "Middle-aged")
dim(female_age) ## view # of rows and columns in data frame ##
view(female_age) ## fiew data frame ##
female_age_2kids <- filter(female_age, Children == 2)
dim(female_age_2kids) ## view # of rows and columns in data frame ##
salary <- mean(female_age_2kids$Salary) ## calculate mean salary and store in "salary" variable ##
salary ## Answer: 98573.06 (same as above ##)
