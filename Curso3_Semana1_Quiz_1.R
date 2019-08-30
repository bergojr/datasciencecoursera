

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "./pums.csv")
dateDownloaded <- date()
print(dateDownloaded)

pumsdata <- read.table("pums.csv", ",", header = TRUE)
head(pumsdata)

valorCasas <- pumsdata$VAL
valorCasasSemNa <- valorCasas[!is.na(valorCasas)]
valorCasasacimamilhao <- valorCasasSemNa == 24
print(sum(valorCasasacimamilhao))

print(pumsdata$FES)


 
fileURLxlsx <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURLxlsx, destfile = "./gov_NGAP3.xlsx", method = "curl")
downloadedData <- date()

indColunas <- 7:15
indLinhas <- 18:23
dat <- read.xlsx("gov_NGAP3.xlsx", sheetIndex = 1 , colIndex = indColunas, rowIndex = indLinhas, header = TRUE)
sum(dat$Zip*dat$Ext,na.rm=T)

fileURLxml <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileURLxml, useInternal = TRUE)

rootNode <- xmlRoot(doc)
zipCodes <- xpathSApply(rootNode,"//zipcode",xmlValue)

selectedZipCodes <- zipCodes == 21231
sum(selectedZipCodes)

fileURLcsv <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURLcsv, destfile = "./fss06pid.csv")
dateDownloaded <- date()
DT <- fread("./fss06pid.csv")

mean(DT$pwgtp15,by=DT$SEX)
system.time(mean(DT$pwgtp15,by=DT$SEX))

sapply(split(DT$pwgtp15,DT$SEX),mean)
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

# {rowMeans(DT)[DT$SEX==1] rowMeans(DT)[DT$SEX==2]}
# system.time(rowMeans(DT)[DT$SEX==1] rowMeans(DT)[DT$SEX==2])

system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT[DT$SEX==1,]$pwgtp15), mean(DT[DT$SEX==2,]$pwgtp15))

