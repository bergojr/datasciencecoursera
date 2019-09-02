fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, destfile = "./curso3_semana2_quiz1.csv")
dateDownloaded <- date()
print(dateDownloaded)

library(sqldf)
acs <- read.table("curso3_semana2_quiz1.csv", ",", header = TRUE)
sqldf("select * from acs")
a <- unique(acs$AGEP)
b <- sqldf("select distinct AGEP from acs")
x <- sqldf("select unique * from acs")
d <- sqldf("select AGEP where unique from acs")
e <- sqldf("select distinct pwgtp1 from acs")

fileURL <- "http://biostat.jhsph.edu/~jleek/contact.html"
con = url(fileURL)
htmlcode <- readLines(con)
close(con)
nchar(htmlcode[10])
nchar(htmlcode[20])
nchar(htmlcode[30])
nchar(htmlcode[100])


fileURLxls <- "http://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileURLxlsx, destfile = "./nino.xlsx", method = "curl")
downloadedData <- date()


dat <- read.xlsx("nino_xls.xlsx", sheetIndex = 1 , header = TRUE)
sum(dat$Zip*dat$Ext,na.rm=T)