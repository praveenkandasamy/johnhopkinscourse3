#q3
#dowload the NGAP data
ngapdata <- getdata_2Fdata_2FDATA_gov_NGAP # assign var name
dat <- ngapdata[17:22, 7:15] #subset the data i need
colnames(dat) <- dat[1,] # set first line as heading
dat = dat[-1,] #delete the first line as its now the heading

dat$Zip <- as.numeric(dat$Zip) #convert to numeric
dat$Ext <- as.numeric(dat$Ext) #convert to numeric

sum(dat$Zip*dat$Ext, na.rm=T) #function in the question

#q4
# install XML package + read XML file,
# set the XML sample webpage as a variable, download the file to documents
# XML parse command and then find root node
# exploring that content, subsetting 
install.packages("XML")
library(XML)

fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileurl, destfile = "./baltimoreresdata.xml")
doc <- xmlTreeParse("./baltimoreresdata.xml" , useInternalNodes = TRUE)
rootnode <- xmlRoot(doc)
names(rootnode)


#q5
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileurl, destfile = "./americancommunitySurvey.csv")
DT <- read.csv("./americancommunitySurvey.csv")

install.packages("data.table")
library(data.table)

mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]

