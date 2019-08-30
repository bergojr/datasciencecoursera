

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "./pums.csv")
dateDownloaded <- date()
print(dateDownloaded)

pumsdata <- read.table("pums.csv", ",", header = TRUE)
head(pumsdata)

valorCasas <- pumsdata$VAL