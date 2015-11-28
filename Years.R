setwd("C:/users/Melissa/Documents/CSCI540-NCVS_Exploration/")
#read in data
load("Data/r2009.Rda")
load("Data/r2010.Rda")
load("Data/r2011.Rda")
load("Data/r2012.Rda")
load("Data/r2013.Rda")
load("Data/r2014.Rda")

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
total <- rbind(records.2009, records.2010, records.2011, records.2012, records.2013, records.2014)

#Pull IPV to their own record
IPV.Records <- subset(total, total$IPV == 1)
IPV.2009 <- subset(records.2009, records.2009$IPV == 1)
IPV.2010 <- subset(records.2010, records.2010$IPV == 1)
IPV.2011 <- subset(records.2011, records.2011$IPV == 1)
IPV.2012 <- subset(records.2012, records.2012$IPV == 1)
IPV.2013 <- subset(records.2013, records.2013$IPV == 1)
IPV.2014 <- subset(records.2014, records.2014$IPV == 1)


### PLOT SOME DISTRIBUTIONS OF DATASET
library(ggplot2)
library(grid)
library(gridExtra)


###############AGES
ggplot(IPV.Records, aes(x=AGE)) + 
  geom_histogram(breaks=seq(12, 90, by =2), 
                 aes(fill=..count..)) +
  labs(title="Histogram of IPV Ages")
  
p9 <- list(ggplot(IPV.2009, aes(x=AGE)) + 
  geom_histogram(breaks=seq(12, 90, by =2), 
                 aes(fill=..count..)) +
  labs(title="Ages 2009"))
p10 <- list(ggplot(IPV.2010, aes(x=AGE)) + 
  geom_histogram(breaks=seq(12, 90, by =2), 
                 aes(fill=..count..)) +
  labs(title="Ages 2010"))
p11 <- list(ggplot(IPV.2011, aes(x=AGE)) + 
  geom_histogram(breaks=seq(12, 90, by =2), 
                 aes(fill=..count..)) +
  labs(title="Ages 2011"))
p12 <- list(ggplot(IPV.2012, aes(x=AGE)) + 
  geom_histogram(breaks=seq(12, 90, by =2), 
                 aes(fill=..count..)) +
  labs(title="Ages 2012"))
p13 <- list(ggplot(IPV.2013, aes(x=AGE)) + 
  geom_histogram(breaks=seq(12, 90, by =2), 
                 aes(fill=..count..)) +
  labs(title="Ages 2013"))
p14 <- list(ggplot(IPV.2014, aes(x=AGE)) + 
  geom_histogram(breaks=seq(12, 90, by =2), 
                 aes(fill=..count..)) +
  labs(title="Ages 2014"))

do.call(grid.arrange, c(p9, p10,p11,p12,p13,p14, 
                        list(ncol=2)))

###############INCOME breaks=seq(1, 14, by = 0.8),
ggplot(IPV.Records, aes(x=INCOME)) + 
  geom_histogram(aes(fill=..count..), breaks=seq(1, 15)) + 
  scale_fill_gradient("Count", low = "mediumorchid1", high = "darkorchid4") +
  labs(title="Histogram of IPV Income Levels") 

p9 <- list(ggplot(IPV.2009, aes(x=INCOME)) + 
             geom_histogram(aes(fill=..count..), breaks=seq(1, 15)) + 
             scale_fill_gradient("Count", low = "mediumorchid1", high = "darkorchid4") +
             labs(title="Ages 2009"))
p10 <- list(ggplot(IPV.2010, aes(x=INCOME)) + 
              geom_histogram(aes(fill=..count..), breaks=seq(1, 15)) + 
              scale_fill_gradient("Count", low = "mediumorchid1", high = "darkorchid4") +
              labs(title="Ages 2010"))
p11 <- list(ggplot(IPV.2011, aes(x=INCOME)) + 
              geom_histogram(aes(fill=..count..), breaks=seq(1, 15)) + 
              scale_fill_gradient("Count", low = "mediumorchid1", high = "darkorchid4") +
              labs(title="Ages 2011"))
p12 <- list(ggplot(IPV.2012, aes(x=INCOME)) + 
              geom_histogram(aes(fill=..count..), breaks=seq(1, 15)) + 
              scale_fill_gradient("Count", low = "mediumorchid1", high = "darkorchid4") +
              labs(title="Ages 2012"))
p13 <- list(ggplot(IPV.2013, aes(x=INCOME)) + 
              geom_histogram(aes(fill=..count..), breaks=seq(1, 15)) + 
              scale_fill_gradient("Count", low = "mediumorchid1", high = "darkorchid4") +
              labs(title="Ages 2013"))
p14 <- list(ggplot(IPV.2014, aes(x=INCOME)) + 
              geom_histogram(aes(fill=..count..), breaks=seq(1, 15)) + 
              scale_fill_gradient("Count", low = "mediumorchid1", high = "darkorchid4") +
              labs(title="Ages 2014"))

do.call(grid.arrange, c(p9, p10,p11,p12,p13,p14, 
                        list(ncol=2)))


