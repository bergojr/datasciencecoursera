# Questão 1

library(dplyr)
dadoscasas <- read.csv("Fss06hid.csv")
namesdadoscasas <- names(dadoscasas) 
stripednamesdadoscasas <- strsplit(namesdadoscasas,"wgtp")
stripednamesdadoscasas[[123]]

# Questão 2
library(dplyr)

removevirgula <- function(x){gsub(",","",x)}

dadosGDP <- read.csv("GDPdata.csv")

valoresGDP <- dadosGDP$X.3[5:194] %>%
        removevirgula %>%
        as.numeric %>%
        mean %>%
        print


# Questão 3

grep("United$",dadosGDP$X.2)
grep("*United",dadosGDP$X.2)
grep("^United",dadosGDP$X.2)
grep("^United",dadosGDP$X.2)


# Questão 4

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURL,"FEDSTATS.csv")
dadosedu <- read.csv("FEDSTATS.csv")

paisesGPD <- dadosGDP$X[5:194]
paisesEDU <- dadosedu$CountryCode
listacorrespondente <- which(paisesEDU %in% paisesGPD)
corteedu <- dadosedu[listacorrespondente,"Special.Notes"] 
#junhofiscalyear <- grep([Jj]une, corteedu)
junhofiscalyear <- grep("^Fiscal year end: June 30",corteedu)

corteedu2 <- dadosedu[junhofiscalyear,"Special.Notes"]
length(junhofiscalyear)


# Questão 5
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
anosampletimes <- year(sampleTimes)
anos <- which(anosampletimes == 2012)
anoselecionados <- sampleTimes[anos]
dias <- wday(anoselecionados) 
numdias <- which(dias ==2)
print(c(length(anos), " , ", length(numdias)))
