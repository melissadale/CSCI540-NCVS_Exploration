#setwd("C:/users/Melissa/Documents/CSCI540-NCVS_Exploration/")

#Output: rdata files for each year in 2009 - 2014 
#   with specified variables from the NCVS 

#To use or modify:
#   vi: this variable is the list containing "variables investigating", 
#   if you want to generate rdata files with different variables
#   ONLY MODIFY this list, the script will handle the rest


#Notes: Memory allocation was problematic at times, 
#   work arounds: frequently use garbage collector - gc(),
#   clear the workspace after each year (except for vi list),
#   increase the memory.limit

memory.limit(size=12003) 

################################################################
####   reading in the Data for 2009, 2010, 2011, 
####   2012, 2013, 2014
################################################################
#V1000's for address variables, 
#V2000's for household variables, 
#V3000's for person variables, 
#V4000's for incident variables

#Variables Investigating 
#===================
#AGE (V3013), SEX(V3017), ARMED FORCE(V3019), EDUCATION(V3020), 
#RACE(V3023A), SPOUSE(V3063), 
#Household Income(v2026), Members Under 12(v2072)
#Employment Status(V4479)
gc()
vi <- c('V3013', 'V3017', 'V3019', 'V3020', 'V3023A', 'V3063', 
        'V2026', 'V2072', 'V4479', 'V4513', 'V4514', 'V4522H')

################################################################
###2009: http://www.icpsr.umich.edu/icpsrweb/NACJD/studies/28543
#=======
#ncsv.address.2009 <- read.delim('Data/2009/28543-0001-Data.tsv')
ncsv.household.2009 <- read.delim('Data/2009/28543-0002-Data.tsv')
ncsv.person.2009 <- read.delim('Data/2009/28543-0003-Data.tsv')
ncsv.incident.2009 <- read.delim('Data/2009/28543-0004-Data.tsv')
#ncsv.level.2009 <- read.delim('Data/2009/28543-0005-Data.tsv')

#link together, unique identifier across records on IDHH and YEARQ
#Create Unique Identifiers
ncsv.household.2009$key <- ncsv.household.2009$IDHH + ncsv.household.2009$YEARQ
ncsv.person.2009$key <- ncsv.person.2009$IDHH + ncsv.person.2009$YEARQ
ncsv.incident.2009$key <- ncsv.incident.2009$IDHH + ncsv.incident.2009$YEARQ

#Put it all together into one Dataframe
total.2009 <- merge(x = ncsv.household.2009, y = ncsv.person.2009,
                    by = "key", all = TRUE)
total.2009 <- merge(x = total.2009, y = ncsv.incident.2009,
                    by = "key", all = TRUE)
#Prune extra columns away
records.2009 <- subset(total.2009, select = vi)
#Save to RData File
save(records.2009,file="Data/r2009.Rda")
rm(list=setdiff(ls(), "vi"))

################################################################
#2010:http://www.icpsr.umich.edu/icpsrweb/NACJD/studies/31202
#ncsv.address.2010 <- read.delim('Data/2010/31202-0001-Data.tsv')
ncsv.household.2010 <- read.delim('Data/2010/31202-0002-Data.tsv')
ncsv.person.2010 <- read.delim('Data/2010/31202-0003-Data.tsv')
ncsv.incident.2010 <- read.delim('Data/2010/31202-0004-Data.tsv')
#ncsv.level.2010 <- read.delim('Data/2010/31202-0005-Data.tsv')

#link together, unique identifier across records on IDHH and YEARQ
#Create Unique Identifiers
ncsv.household.2010$key <- ncsv.household.2010$IDHH + ncsv.household.2010$YEARQ
ncsv.person.2010$key <- ncsv.person.2010$IDHH + ncsv.person.2010$YEARQ
ncsv.incident.2010$key <- ncsv.incident.2010$IDHH + ncsv.incident.2010$YEARQ

#Put it all together into one Dataframe
total.2010 <- merge(x = ncsv.household.2010, y = ncsv.person.2010,
                    by = "key", all = TRUE)
total.2010 <- merge(x = total.2010, y = ncsv.incident.2010,
                    by = "key", all = TRUE)

#Prune extra columns away
records.2010 <- subset(total.2010, select = vi)

save(records.2010,file="Data/r2010.Rda")
rm(list=setdiff(ls(), "vi"))

################################################################
#2011: http://www.icpsr.umich.edu/icpsrweb/NACJD/studies/34276
#ncsv.address.2011 <- read.delim('Data/2011/34061-0001-Data.tsv')
ncsv.household.2011 <- read.delim('Data/2011/34061-0002-Data.tsv')
ncsv.person.2011 <- read.delim('Data/2011/34061-0003-Data.tsv')
ncsv.incident.2011 <- read.delim('Data/2011/34061-0004-Data.tsv')
#ncsv.level.2011 <- read.delim('Data/2011/34061-0005-Data.tsv')

#link together, unique identifier across records on IDHH and YEARQ
#Create Unique Identifiers
ncsv.household.2011$key <- ncsv.household.2011$IDHH + ncsv.household.2011$YEARQ
ncsv.person.2011$key <- ncsv.person.2011$IDHH + ncsv.person.2011$YEARQ
ncsv.incident.2011$key <- ncsv.incident.2011$IDHH + ncsv.incident.2011$YEARQ

#Put it all together into one Dataframe
total.2011 <- merge(x = ncsv.household.2011, y = ncsv.person.2011,
                    by = "key", all = TRUE)
total.2011 <- merge(x = total.2011, y = ncsv.incident.2011,
                    by = "key", all = TRUE)

#Prune extra columns away
records.2011 <- subset(total.2011, select = vi)

save(records.2011,file="Data/r2011.Rda")
rm(list=setdiff(ls(), "vi"))

################################################################
#2012: http://www.icpsr.umich.edu/icpsrweb/NACJD/studies/34650
#ncsv.address.2012 <- read.delim('Data/2012/34650-0001-Data.tsv')
ncsv.household.2012 <- read.delim('Data/2012/34650-0002-Data.tsv')
ncsv.person.2012 <- read.delim('Data/2012/34650-0003-Data.tsv')
ncsv.incident.2012 <- read.delim('Data/2012/34650-0004-Data.tsv')
#ncsv.level.2012 <- read.delim('Data/2012/34650-0005-Data.tsv')
gc()

#link together, unique identifier across records on IDHH and YEARQ
#Create Unique Identifiers
ncsv.household.2012$key <- ncsv.household.2012$IDHH + ncsv.household.2012$YEARQ
ncsv.person.2012$key <- ncsv.person.2012$IDHH + ncsv.person.2012$YEARQ
ncsv.incident.2012$key <- ncsv.incident.2012$IDHH + ncsv.incident.2012$YEARQ

#Put it all together into one Dataframe
#increase the memory limit with command: memory.limit(size=12003)
gc()
total.2012 <- merge(x = ncsv.household.2012, y = ncsv.person.2012,
                    by = "key", all = TRUE)
total.2012 <- merge(x = total.2012, y = ncsv.incident.2012,
                    by = "key", all = TRUE)

records.2012 <- subset(total.2012, select = vi)
save(records.2012 ,file="Data/r2012.Rda")
rm(list=setdiff(ls(), "vi"))

################################################################
#2013: http://www.icpsr.umich.edu/icpsrweb/NACJD/studies/35164
#ncsv.address.2013 <- read.delim('Data/2013/35164-0001-Data.tsv')
ncsv.household.2013 <- read.delim('Data/2013/35164-0002-Data.tsv')
ncsv.person.2013 <- read.delim('Data/2013/35164-0003-Data.tsv')
ncsv.incident.2013 <- read.delim('Data/2013/35164-0004-Data.tsv')
#ncsv.level.2013 <- read.delim('Data/2013/35164-0005-Data.tsv')
gc()

#link together, unique identifier across records on IDHH and YEARQ
#Create Unique Identifiers
ncsv.household.2013$key <- ncsv.household.2013$IDHH + ncsv.household.2013$YEARQ
ncsv.person.2013$key <- ncsv.person.2013$IDHH + ncsv.person.2013$YEARQ
ncsv.incident.2013$key <- ncsv.incident.2013$IDHH + ncsv.incident.2013$YEARQ

#Put it all together into one Dataframe
#increase the memory limit with command: memory.limit(size=12003)
gc()
total.2013 <- merge(x = ncsv.household.2013, y = ncsv.person.2013,
                    by = "key", all = TRUE)
total.2013 <- merge(x = total.2013, y = ncsv.incident.2013,
                    by = "key", all = TRUE)

#Prune extra columns away
records.2013 <- subset(total.2013, select = vi)
save(records.2013 ,file="Data/r2013.Rda")
rm(list=setdiff(ls(), "vi"))

################################################################
#2014: http://www.icpsr.umich.edu/icpsrweb/NACJD/studies/36142
#ncsv.address.2014 <- read.delim('Data/2014/36142-0001-Data.tsv')
ncsv.household.2014 <- read.delim('Data/2014/36142-0002-Data.tsv')
ncsv.person.2014 <- read.delim('Data/2014/36142-0003-Data.tsv')
ncsv.incident.2014 <- read.delim('Data/2014/36142-0004-Data.tsv')
#ncsv.level.2014 <- read.delim('Data/2014/36142-0005-Data.tsv')
gc()

#link together, unique identifier across records on IDHH and YEARQ
#Create Unique Identifiers
ncsv.household.2014$key <- ncsv.household.2014$IDHH + ncsv.household.2014$YEARQ
ncsv.person.2014$key <- ncsv.person.2014$IDHH + ncsv.person.2014$YEARQ
ncsv.incident.2014$key <- ncsv.incident.2014$IDHH + ncsv.incident.2014$YEARQ

#Put it all together into one Dataframe
#increase the memory limit with command: memory.limit(size=12003)
gc()
total.2014 <- merge(x = ncsv.household.2014, y = ncsv.person.2014,
                    by = "key", all = TRUE)
gc()
total.2014 <- merge(x = total.2014, y = ncsv.incident.2014,
                    by = "key", all = TRUE)

#Prune extra columns away
records.2014 <- subset(total.2014, select = vi)
save(records.2014 ,file="Data/r2014.Rda")
rm(list=setdiff(ls(), "vi"))
