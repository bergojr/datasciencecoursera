fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, destfile = "./curso3_semana2_quiz1.csv")
dateDownloaded <- date()
print(dateDownloaded)

library(sqldf)
acs <- read.table("curso3_semana2_quiz1.csv", ",", header = TRUE)
sqldf("select * from acs")
unique(acs$AGEP)
sqldf("select distinct AGEP from acs")
sqldf("select unique * from acs")
sqldf("select AGEP where unique from acs")
sqldf("select distinct pwgtp1 from acs")

