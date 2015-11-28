#read in data
load("Data/r2009.Rda")
load("Data/r2010.Rda")
load("Data/r2011.Rda")
load("Data/r2012.Rda")
load("Data/r2013.Rda")
load("Data/r2014.Rda")

# removes rows with NAs
records.2009 <- na.omit(records.2009)
records.2010 <- na.omit(records.2010)
records.2011 <- na.omit(records.2011)
records.2012 <- na.omit(records.2012)
records.2013 <- na.omit(records.2013)
records.2014 <- na.omit(records.2014)

# combines into one data frame
allYears <- rbind(records.2009, records.2010, records.2011, records.2012, records.2013)

colnames(allYears) <- c('AGE', 'GENDER', 'MILITARY', 'EDUCATION', 'RACE', 'SPOUSE_PRESENT', 'INCOME', 
                        'HH_UNDER_12', 'EMPLOYED_AT_TIME', 'SPOUSE_OFFENDER', 'EX_OFFENDER', 'BF_GF_OFFENDER')

# number just corresponds to age as long as respondent is under 98
allYears <- allYears[allYears$AGE < 98,]

# 1 = Male, 2 = Female
allYears <- allYears[allYears$GENDER < 3,]

# 1 = Yes, 0 = No
allYears <- allYears[allYears$MILITARY < 8,]
allYears$MILITARY <- ifelse(allYears$MILITARY == 2, 0, 1)

# education - categorical
allYears <- allYears[allYears$EDUCATION < 98,]

# derived binary education variables
# 1 = This is the highest degree of education received
allYears$BELOW_HS <- ifelse((allYears$EDUCATION < 21) | (allYears$EDUCATION == 27), 1, 0)
allYears$HS <- ifelse((allYears$EDUCATION == 28), 1, 0)
allYears$HIGHER_ED <- ifelse((allYears$EDUCATION > 40), 1, 0)

# race recode - categorial
allYears <- allYears[allYears$RACE < 19,]

# derived binary race variables
# note: may have to do just "white" (1 = White, 0 = Non-white)
allYears$WHITE <- ifelse(allYears$RACE == 1, 1, 0)
allYears$BLACK <- ifelse(allYears$RACE == 2, 1, 0)
allYears$NATIVE <- ifelse(allYears$RACE == 3, 1, 0)
allYears$ASIAN <- ifelse(allYears$RACE == 4, 1, 0)
allYears$PACIFIC_ISLANDER <- ifelse(allYears$RACE == 5, 1, 0)
allYears$MIXED_RACE <- ifelse((allYears$RACE > 5) & (allYears$RACE < 19), 1, 0)
hist(allYears$RACE)

# 1 = Yes, 0 = No
allYears <- allYears[allYears$SPOUSE_PRESENT < 8,]

# increments from 1 (< $5,000) to 14 (> $75,000)
allYears <- allYears[allYears$INCOME < 98,]
hist(allYears$INCOME)

# categorial income vars (note: do not cover full spectrum of answers, only extremes!)
allYears$HIGH_INCOME <- ifelse(allYears$INCOME == 14, 1, 0)
allYears$LOW_INCOME <- ifelse(allYears$INCOME < 8, 1, 0)


# derived binary var from HH_Under_12
# binary, = 1 if there are any children in the household
allYears$CHILDREN <- ifelse(allYears$HH_UNDER_12 > 0, 1, 0)

# (employed at time of incident)
# 1 = Yes, 0 = No
allYears$EMPLOYED_AT_TIME <- ifelse(allYears$EMPLOYED_AT_TIME == 2, 0, 1)


# 0 = No, 1 = Yes (spouse was offender)
allYears <- allYears[allYears$SPOUSE_OFFENDER < 8,]

# 0 = No, 1 = Yes
allYears <- allYears[allYears$EX_OFFENDER < 8,]
  
# 0 = No, 1 = Yes
allYears <- allYears[allYears$BF_GF_OFFENDER < 8,]

# 0 = No, 1 = Yes
allYears$IPV <- ifelse((allYears$SPOUSE_OFFENDER > 0) | (allYears$EX_OFFENDER > 0) | (allYears$BF_GF_OFFENDER > 0), 1, 0)

