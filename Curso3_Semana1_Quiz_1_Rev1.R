

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

system.time({
        DT <- fread("./fss06pid.csv")
        mean(DT$pwgtp15,by=DT$SEX)
        #elapsed time
        # usuário   sistema decorrido 
        # 0.07      0.02      0.04 
})

system.time({
        DT <- fread("./fss06pid.csv")
        sapply(split(DT$pwgtp15,DT$SEX),mean)
        # Elapsed time
        #usuário   sistema decorrido 
        #0.11      0.00      0.06
})


system.time({
        DT <- fread("./fss06pid.csv")
        
        rowMeans(DT)[DT$SEX==1] 
        rowMeans(DT)[DT$SEX==2]
        # Elapsed time
        # Error in rowMeans(DT) : 'x' must be numeric
        # Timing stopped at: 1.91 2.55 6.79
})


system.time({
        DT <- fread("./fss06pid.csv")
        tapply(DT$pwgtp15,DT$SEX,mean)
        # Elapsed time
        # usuário   sistema decorrido 
        # 0.07      0.01      0.06
})


system.time({
        DT <- fread("./fss06pid.csv")
        
        DT[,mean(pwgtp15),by=SEX]
        # Elapsed time
        # usuário   sistema decorrido 
        # 0.06      0.03      0.06
})


system.time({
        DT <- fread("./fss06pid.csv")
        
        mean(DT[DT$SEX==1,]$pwgtp15) 
        mean(DT[DT$SEX==2,]$pwgtp15)
        # Elapsed time
        # usuário   sistema decorrido 
        # 0.09      0.08      0.13 
})



