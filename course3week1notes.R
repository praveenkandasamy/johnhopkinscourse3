#Get and set WD
getwd()
setwd("./specdata2/")

#check if files/ dir exists
#create directory
file.exists("001.csv")

#If folder doesnt exist create it
if(!file.exists("data")){
  dir.create("data")
}

#Download online data
download.file(url = "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD",
              destfile = "./data/cameradata.csv")

#open local file
#default read table function goes for tab delimited so comma seperate and indicate there are header data
#potential error to watch out for is quotation marks, resolve this via quote syntax
cameradata <- read.table("./data/cameradata.csv", sep = ",", header = TRUE)
head(cameradata)

#doing the same as above with xlsx
download.file(url = "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD",
              destfile = "./data/cameradataxlfrmt.xlsx")
cameradataexcelformat <- read.table("./data/cameradataxlfrmt.xlsx", header = TRUE)
head(cameradataexcelformat)

# install XML package + read XML file,
# set the XML sample webpage as a variable, download the file to documents
# XML parse command and then find root node
# exploring that content, subsetting 
install.packages("XML")
library(XML)
fileurl <- "http://www.w3schools.com/xml/simple.xml"
download.file(fileurl, destfile = "./simple.xml")
doc <- xmlTreeParse("./simple.xml" , useInternalNodes = TRUE)
rootnode <- xmlRoot(doc)
xmlName(rootnode)
names(rootnode)
rootnode[[1]] # root node
rootnode[[1]][[1]] #root of root node node

xmlSApply(rootnode, xmlValue) # programmatically extract parts of the file)


#Extract content by attributes
#html this time instead opf XML
#checking the baltimore ravens for score info
#not working score, teams are empty, possibly website structure has changed
install.packages("XML")
library(XML)
fileurl <- "https://www.espn.com/nfl/team/_/name/bal/baltimore-ravens"
#download.file(fileurl, destfile = "./baltimoreravens.html")
#doc <- htmlTreeParse("./baltimoreravens.html",useInternal = TRUE )
doc <- htmlTreeParse(fileurl,useInternal = TRUE )
score <- xpathSApply(doc,"//li[@class='score']", xmlValue) # isolate the scores
teams <- xpathSApply(doc,"//li[@class='team-name']", xmlValue) # isolate the teams

# Reading a JSON file (Javascript Object Notation)
# read my git repo
#load jsonlite
install.packages("jsonlite")
library(jsonlite)
jsonDatamyGitinfo <- fromJSON("https://api.github.com/users/praveenkandasamy/repos")
names(jsonDatamyGitinfo) #gives you a dataframe of all the top level variables
names(jsonDatamyGitinfo$owner) # drill into a variable
jsonDatamyGitinfo$owner$login # sub variable of variable

myjson <- toJSON(iris, pretty = TRUE) # make IRIS data look nice
cat(myjson) # view output
iris2 <- fromJSON(myjson) # insert IRIS data into a dataframe
head(iris2) # look at the dataframe heading lines


# data.table - inherits from data.frame
# much faster and efficent than data frame as its written in C
# install and load data,table
# crete DF with 9 observation of rnorm and abc repeating
install.packages("data.table")
library(data.table)
DF = data.frame(x=rnorm(9), y=rep(c("a","b","c"),each=3),z=rnorm(9)) #dataframe
head(DF,n=3)

DT = data.table(x=rnorm(9), y=rep(c("a","b","c"),each=3),z=rnorm(9)) #datatable
head(DF,n=3)

tables() #see all the tables in memory


















