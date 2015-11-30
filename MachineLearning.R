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

#Give meaninful names
colnames(records.2009) <- c("AGE", "GENDER", "MILITARY", "EDUCATION", "RACE", "SPOUSE_PRESENT",
                            "INCOME", "HH_UNDER_12", "EMPLOYED_AT_TIME", 
                            "SPOUSE_OFFENDER", "EX_OFFENDER", "BF_GF_OFFENDER")
colnames(records.2010) <- c("AGE", "GENDER", "MILITARY", "EDUCATION", "RACE", "SPOUSE_PRESENT",
                            "INCOME", "HH_UNDER_12", "EMPLOYED_AT_TIME", 
                            "SPOUSE_OFFENDER", "EX_OFFENDER", "BF_GF_OFFENDER")
colnames(records.2011) <- c("AGE", "GENDER", "MILITARY", "EDUCATION", "RACE", "SPOUSE_PRESENT",
                            "INCOME", "HH_UNDER_12", "EMPLOYED_AT_TIME", 
                            "SPOUSE_OFFENDER", "EX_OFFENDER", "BF_GF_OFFENDER")
colnames(records.2012) <- c("AGE", "GENDER", "MILITARY", "EDUCATION", "RACE", "SPOUSE_PRESENT",
                            "INCOME", "HH_UNDER_12", "EMPLOYED_AT_TIME", 
                            "SPOUSE_OFFENDER", "EX_OFFENDER", "BF_GF_OFFENDER")
colnames(records.2013) <- c("AGE", "GENDER", "MILITARY", "EDUCATION", "RACE", "SPOUSE_PRESENT",
                            "INCOME", "HH_UNDER_12", "EMPLOYED_AT_TIME", 
                            "SPOUSE_OFFENDER", "EX_OFFENDER", "BF_GF_OFFENDER")
colnames(records.2014) <- c("AGE", "GENDER", "MILITARY", "EDUCATION", "RACE", "SPOUSE_PRESENT",
                            "INCOME", "HH_UNDER_12", "EMPLOYED_AT_TIME", 
                            "SPOUSE_OFFENDER", "EX_OFFENDER", "BF_GF_OFFENDER")

#derive variables
records.2009$CHILDREN <- replace(records.2009$HH_UNDER_12, records.2009$HH_UNDER_12 > 0, 1) # binary, = 1 if there are any children in the household
records.2009$IPV <- ifelse((records.2009$SPOUSE_OFFENDER > 0) | (records.2009$EX_OFFENDER > 0) | (records.2009$BF_GF_OFFENDER > 0), 1, 0)

records.2010$CHILDREN <- replace(records.2010$HH_UNDER_12, records.2010$HH_UNDER_12 > 0, 1) # binary, = 1 if there are any children in the household
records.2010$IPV <- ifelse((records.2010$SPOUSE_OFFENDER > 0) | (records.2010$EX_OFFENDER > 0) | (records.2010$BF_GF_OFFENDER > 0), 1, 0)

records.2011$CHILDREN <- replace(records.2011$HH_UNDER_12, records.2011$HH_UNDER_12 > 0, 1) # binary, = 1 if there are any children in the household
records.2011$IPV <- ifelse((records.2011$SPOUSE_OFFENDER > 0) | (records.2011$EX_OFFENDER > 0) | (records.2011$BF_GF_OFFENDER > 0), 1, 0)

records.2012$CHILDREN <- replace(records.2012$HH_UNDER_12, records.2012$HH_UNDER_12 > 0, 1) # binary, = 1 if there are any children in the household
records.2012$IPV <- ifelse((records.2012$SPOUSE_OFFENDER > 0) | (records.2012$EX_OFFENDER > 0) | (records.2012$BF_GF_OFFENDER > 0), 1, 0)

records.2013$CHILDREN <- replace(records.2013$HH_UNDER_12, records.2013$HH_UNDER_12 > 0, 1) # binary, = 1 if there are any children in the household
records.2013$IPV <- ifelse((records.2013$SPOUSE_OFFENDER > 0) | (records.2013$EX_OFFENDER > 0) | (records.2013$BF_GF_OFFENDER > 0), 1, 0)

records.2014$CHILDREN <- replace(records.2014$HH_UNDER_12, records.2014$HH_UNDER_12 > 0, 1) # binary, = 1 if there are any children in the household
records.2014$IPV <- ifelse((records.2014$SPOUSE_OFFENDER > 0) | (records.2014$EX_OFFENDER > 0) | (records.2014$BF_GF_OFFENDER > 0), 1, 0)




#also, combine into one massive dataframe, and give meaningful column names
allYears <- rbind(records.2009, records.2010, records.2011, records.2012, records.2013, records.2014)

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



######################################################
###         Machine Learning Approaches
######################################################

#***************Test and Training Data
IPV.Records <- allYears[ which(allYears$IPV == 1),]
Not.IPV <- allYears[ which(allYears$IPV == 0),]

numIPV = nrow(IPV.Records)
numNot = nrow(Not.IPV)
numRecords = numIPV + numNot

#select random sample, using 1/3 as testing and 2/3 as training
#generates a list of random numbers, with the size of 1/3 the sets
set.seed(418910)
testIPVIdx = sample(numIPV, size = floor(numIPV/3)) 
testNotIdx = sample(numNot, size = floor(numNot/3))

#then select the training and test set
testIPV = c(IPV.Records[testIPVIdx,],
                 Not.IPV[testNotIdx,] )
trainIPV = c(IPV.Records[-testIPVIdx,],
             Not.IPV[-testNotIdx,] )

#"label" data i training/test sets as IPV or not
testIsIPV = rep(c(TRUE, FALSE), 
                 c(length(testIPVIdx), length(testNotIdx)))
trainIsIPV = rep(c(TRUE, FALSE), 
                  c(numIPV - length(testIPVIdx), 
                    numNot - length(testNotIdx)))