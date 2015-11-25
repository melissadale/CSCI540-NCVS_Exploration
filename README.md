# CSCI540: NCVS Exploration
This is a project for CSCI540: Advanced Database at Montana State University. We use data science applications in statistical R to explore the National Crime Victimization Survey. http://www.icpsr.umich.edu/icpsrweb/NACJD/NCVS/  

##Obtaining and Setting Up Dataset 
1. Create a "Data" directory in your project directory
2. Create a folder inside of "Data" directory for each year (2009-2014 at the time of this implementation) 
3. Download the tsv file (listed as Excel/TSV file on the site), which can be found at the commented links in the R code, and navigate to the file that ends in ".tsv", placing it in the approriate year directory (there should be 5 in total for each year)
4. You may now run the R code provided. There is also an Rstudio workspace included in download that may also help you get started. 

##Files in this Repo
**Data_Manager.R**
This script generates the R-Data files from the TSV files loaded in the "Obtaining and Setting Up Dataset" section above. 


**Exploratory_Analysis.R**
This script loads R-Data files and performs analysis on the data.  
