################################################################
####   reading in the data for 2009, 2010, 2011, 
####   2012, 2013, 2014
################################################################

#2009: http://www.icpsr.umich.edu/icpsrweb/NACJD/studies/28543
ncsv.address.2009 <- read.delim('Data/2009/28543-0001-Data.tsv')
ncsv.household.2009 <- read.delim('Data/2009/28543-0002-Data.tsv')
ncsv.person.2009 <- read.delim('Data/2009/28543-0003-Data.tsv')
ncsv.incident.2009 <- read.delim('Data/2009/28543-0004-Data.tsv')
ncsv.level.2009 <- read.delim('Data/2009/28543-0005-Data.tsv')
gc()

#2010:http://www.icpsr.umich.edu/icpsrweb/NACJD/studies/31202
ncsv.address.2010 <- read.delim('Data/2010/31202-0001-Data.tsv')
ncsv.household.2010 <- read.delim('Data/2010/31202-0002-Data.tsv')
ncsv.person.2010 <- read.delim('Data/2010/31202-0003-Data.tsv')
ncsv.incident.2010 <- read.delim('Data/2010/31202-0004-Data.tsv')
ncsv.level.2010 <- read.delim('Data/2010/31202-0005-Data.tsv')
gc()

#2011: http://www.icpsr.umich.edu/icpsrweb/NACJD/studies/34276
ncsv.address.2011 <- read.delim('Data/2011/34061-0001-Data.tsv')
ncsv.household.2011 <- read.delim('Data/2011/34061-0002-Data.tsv')
ncsv.person.2011 <- read.delim('Data/2011/34061-0003-Data.tsv')
ncsv.incident.2011 <- read.delim('Data/2011/34061-0004-Data.tsv')
ncsv.level.2011 <- read.delim('Data/2011/34061-0005-Data.tsv')
gc()

#2012: http://www.icpsr.umich.edu/icpsrweb/NACJD/studies/34650
ncsv.address.2012 <- read.delim('Data/2012/34650-0001-Data.tsv')
ncsv.household.2012 <- read.delim('Data/2012/34650-0002-Data.tsv')
ncsv.person.2012 <- read.delim('Data/2012/34650-0003-Data.tsv')
ncsv.incident.2012 <- read.delim('Data/2012/34650-0004-Data.tsv')
ncsv.level.2012 <- read.delim('Data/2012/34650-0005-Data.tsv')
gc()

#2013: http://www.icpsr.umich.edu/icpsrweb/NACJD/studies/35164
ncsv.address.2013 <- read.delim('Data/2013/35164-0001-Data.tsv')
ncsv.household.2013 <- read.delim('Data/2013/35164-0002-Data.tsv')
gc()
ncsv.person.2013 <- read.delim('Data/2013/35164-0003-Data.tsv')
gc()
ncsv.incident.2013 <- read.delim('Data/2013/35164-0004-Data.tsv')
gc()
ncsv.level.2013 <- read.delim('Data/2013/35164-0005-Data.tsv')
gc()

#2014: http://www.icpsr.umich.edu/icpsrweb/NACJD/studies/36142
ncsv.address.2014 <- read.delim('Data/2014/36142-0001-Data.tsv')
ncsv.household.2014 <- read.delim('Data/2014/36142-0002-Data.tsv')
ncsv.person.2014 <- read.delim('Data/2014/36142-0003-Data.tsv')
ncsv.incident.2014 <- read.delim('Data/2014/36142-0004-Data.tsv')
ncsv.level.2014 <- read.delim('Data/2014/36142-0005-Data.tsv')
gc()



#V1000's for address variables, 
#V2000's for household variables, 
#V3000's for person variables, 
#V4000's for incident variables

#household income variables, gives codes that must be looked up
#on pg 79 of Codebook
#income level
#01 Less than $5,000
#02 $5,000 to $7,499
#03 $7,500 to $9,999
#04 $10,000 to $12,499
#05 $12,500 to $14,999
#06 $15,000 to $17,499
#07 $17,500 to $19,999
#08 $20,000 to $24,999
#09 $25,000 to $29,999
#10 $30,000 to $34,999
#11 $35,000 to $39,999
#12 $40,000 to $49,999
#13 $50,000 to $74,999
#14 $75,000 and over

ncsv.household$V2026

#connects on IDHH and YEARQ 
