
#Questao 1

dados <- read.table("getdata_data_ss06hid.csv", ",", header = TRUE)
head(dados)
library(dplyr)
agricultureLogical <- dados$ACR==3 & dados$AGS == 6
which(agricultureLogical)

#Questao 2

dadosJPEG = readJPEG("jeff.jpg", native =  TRUE)
quantile(dadosJPEG , c(0.3, 0.8))

#Questao 3

dadosGDP = read.csv("getdata_data_GDP.csv", "," , header = TRUE,stringsAsFactors = FALSE)
dadosEducaco = read.csv("getdata_data_EDSTATS_Country.csv", "," , header = TRUE,stringsAsFactors = FALSE)
dadosGDPFiltrados <- dadosGDP[5:194,]
dadosGDPselecionados <- select(dadosGDPFiltrados,X,Gross.domestic.product.2012,X.2,X.3)
#dadosGDPselecionados <- select(dadosGDP,X,Gross.domestic.product.2012,X.2,X.3)
names(dadosGDPselecionados)<- c("CountryCode", "GrossRank","Country","GDP")
mergedData = merge.data.frame(dadosGDPselecionados,dadosEducaco,by.x="CountryCode",by.y="CountryCode")
mergedData <- mutate(mergedData,GDPnum = as.numeric(mergedData$GrossRank))
mergedDataOrdered <- arrange(mergedData, desc(GDPnum) )
print(mergedDataOrdered[13,c("CountryCode","Country")])


# Questão 4

dadoGDP_Edu <- tbl_df(mergedDataOrdered)
by_income.group <- group_by(dadoGDP_Edu,Income.Group)

summarize(by_income.group,mean(GDPnum))

# Questão 5

bestGDP <- filter(by_income.group, GDPnum <= 38)
summarize(bestGDP,n())


