#Execícios 11 a 20 do quiz Week 1 - R Programing

dados <- read.csv("c:/coursera/coursera_DS/R_programing/hw1_data.csv")
names(dados)
head(dados)

dados[c(1,2),]

numlinha <- nrow(dados) # Número de linhas de uma tabela
numcoluna <- ncol(dados) # Número de colunas de uma tabela

dados[c(152,153),]

dados[47,]

ozonio <- dados[1:numlinha,1]

bad_ozonio <- is.na(ozonio) # cria os vetores onde não há informação sobre o ozônio

ozonio_completo <- ozonio[!bad_ozonio]# cria vetor com as informações completas sobre o ozonio

length(ozonio) - length(ozonio_completo) # calcula quantos dados estão faltando

mean(ozonio_completo) # média dos valores completos de ozônio

amostras_validas <- complete.cases(dados) # verifica linhas onde todos os dados estao presentes

dados_completos<-dados[amostras_validas, ] # obtem novo data set sem valores faltando

dados_completos_maio<- dados_completos[dados_completos$Ozone>31 & dados_completos$Month == 5, ]

dados_temperatura_junho<-dados_completos[dados_completos$Month == 6, 4] # dados da temperaura em junho

media_temperatura_junho<- mean(dados_temperatura_junho)
media_temperatura_junho

dtj <- dados[dados$Month == 6, 4]
mean(dtj)


#Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90

filtro = dados$Ozone>31 & dados$Temp>90
doztemp <- dados[filtro,2 ]
baddoztemp <- is.na(doztemp)
doztemplimpo<-doztemp[!baddoztemp]
mean(doztemplimpo)
