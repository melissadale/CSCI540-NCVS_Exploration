#read in data
load("Data/r2009.Rda")
load("Data/r2010.Rda")
load("Data/r2011.Rda")
load("Data/r2012.Rda")
load("Data/r2013.Rda")
load("Data/r2014.Rda")

# number just corresponds to age, as long as they're under 98
AGE <- c(records.2009$V2012[records.2009$V2012 < 98], records.2010$V2012[records.2010$V2012 < 98], 
         records.2011$V2012[records.2011$V2012 < 98], records.2012$V2012[records.2012$V2012 < 98], 
         records.2013$V2012[records.2013$V2012 < 98], records.2014$V2012[records.2014$V2012 < 98])
AGE <- AGE[!is.na(AGE)]

# 1 = Male, 2 = Female
GENDER <- c(records.2009$V3017[records.2009$V3017 < 3], records.2010$V3017[records.2010$V3017 < 3], 
            records.2011$V3017[records.2011$V3017 < 3], records.2012$V3017[records.2012$V3017 < 3], 
            records.2013$V3017[records.2013$V3017 < 3], records.2014$V3017[records.2014$V3017 < 3])
GENDER <- GENDER[!is.na(GENDER)]

# 1 = Yes, 2 = No
MILITARY <- c(records.2009$V3019[records.2009$V3019 < 8], records.2010$V3019[records.2010$V3019 < 8], 
              records.2011$V3019[records.2011$V3019 < 8], records.2012$V3019[records.2012$V3019 < 8], 
              records.2013$V3019[records.2013$V3019 < 8], records.2014$V3019[records.2014$V3019 <8])
MILITARY <- MILITARY[!is.na(MILITARY)]

# categorical
EDUCATION <- c(records.2009$V3020[records.2009$V3020 < 98], records.2010$V3020[records.2010$V3020 < 98], 
               records.2011$V3020[records.2011$V3020 < 98], records.2012$V3020[records.2012$V3020 < 98], 
               records.2013$V3020[records.2013$V3020 < 98], records.2014$V3020[records.2014$V3020 < 98])
EDUCATION <- EDUCATION[!is.na(EDUCATION)]
# derived binary education variables
# 1 = This is the highest degree of education received
BELOW_HS <- ifelse((EDUCATION < 21) | (EDUCATION == 27), 1, 0)
HS <- ifelse((EDUCATION == 28), 1, 0)
HIGHER_ED <- ifelse((EDUCATION > 40), 1, 0)

# TODO: race recode
RACE <- c(records.2009$V3023A[records.2009$V3023A < 19], records.2010$V3023A[records.2010$V3023A < 19], 
          records.2011$V3023A[records.2011$V3023A < 19], records.2012$V3023A[records.2012$V3023A < 19], 
          records.2012$V3023A[records.2012$V3023A < 19], records.2013$V3023A[records.2013$V3023A < 19])
RACE <- RACE[!is.na(RACE)]
# derived binary race variables
# note: may have to do just "white" (1 = White, 0 = Non-white)
WHITE <- ifelse(RACE == 1, 1, 0)
BLACK <- ifelse(RACE == 2, 1, 0)
NATIVE <- ifelse(RACE == 3, 1, 0)
ASIAN <- ifelse(RACE == 4, 1, 0)
PACIFIC_ISLANDER <- ifelse(RACE == 5, 1, 0)
MIXED_RACE <- ifelse((RACE > 5) & (RACE < 19), 1, 0)
hist(RACE)

# 1 = Yes, 2 = No
SPOUSE_PRESENT <- c(records.2009$V3063[records.2009$V3063 < 8], records.2010$V3063[records.2010$V3063 < 8], 
                    records.2011$V3063[records.2011$V3063 < 8], records.2012$V3063[records.2012$V3063 < 8], 
                    records.2013$V3063[records.2013$V3063 < 8], records.2014$V3063[records.2014$V3063 < 8])
SPOUSE_PRESENT <- c(SPOUSE_PRESENT[!is.na(SPOUSE_PRESENT)])

# increments from 1 (< $5,000) to 14 (> $75,000)
INCOME <- c(records.2009$V2026[records.2009$V2026 < 98], records.2010$V2026[records.2010$V2026 < 98], 
            records.2011$V2026[records.2011$V2026 < 98], records.2012$V2026[records.2012$V2026 < 98], 
            records.2013$V2026[records.2013$V2026 < 98], records.2014$V2026[records.2014$V2026 < 98]) 
INCOME <- INCOME[!is.na(INCOME)]

# number of household members under 12
HH_UNDER_12 <- c(records.2009$V2072, records.2010$V2072, records.2011$V2072, records.2012$V2072, 
            records.2013$V2072, records.2014$V2072) 
# binary, = 1 if there are any children in the household
CHILDREN <- replace(HH_UNDER_12, HH_UNDER_12 > 0, 1)

# 1 = Yes, 2 = No (employed at time of incident)
EMPLOYED_AT_TIME <- c(records.2009$V4479, records.2010$V4479, records.2011$V4479, records.2012$V4479, 
                      records.2013$V4479, records.2014$V4479) 
EMPLOYED_AT_TIME <- EMPLOYED_AT_TIME[!is.na(EMPLOYED_AT_TIME)]

# 0 = No, 1 = Yes (spouse was offender)
SPOUSE_OFFENDER <- c(records.2009$V4513[records.2009$V4513 < 8], records.2010$V4513[records.2010$V4513 < 8], 
                     records.2011$V4513[records.2011$V4513 < 8], records.2012$V4513[records.2012$V4513 < 8], 
                     records.2013$V4513[records.2013$V4513 < 8], records.2014$V4513[records.2014$V4513 < 8]) 
SPOUSE_OFFENDER <- SPOUSE_OFFENDER[!is.na(SPOUSE_OFFENDER)]

# 0 = No, 1 = Yes
EX_OFFENDER <- c(records.2009$V4514[records.2009$V4514 < 8], records.2010$V4514[records.2010$V4514 < 8], 
                 records.2011$V4514[records.2011$V4514 < 8], records.2012$V4514[records.2012$V4514 < 8], 
                 records.2013$V4514[records.2013$V4514 < 8], records.2014$V4514[records.2014$V4514 < 8]) 
EX_OFFENDER <- EX_OFFENDER[!is.na(EX_OFFENDER)]
  
# 0 = No, 1 = Yes
BF_GF_OFFENDER <- c(records.2009$V4522H[records.2009$V4522H < 8], records.2010$V4522H[records.2010$V4522H < 8], 
                    records.2011$V4522H[records.2011$V4522H < 8], records.2012$V4522H[records.2012$V4522H < 8], 
                    records.2013$V4522H[records.2013$V4522H < 8], records.2014$V4522H[records.2014$V4522H < 8]) 
BF_GF_OFFENDER <- BF_GF_OFFENDER[!is.na(BF_GF_OFFENDER)]

# 0 = No, 1 = Yes
IPV <- ifelse((SPOUSE_OFFENDER > 0) | (EX_OFFENDER > 0) | (BF_GF_OFFENDER > 0), 1, 0)
