# Esta função calcula a média de observações de estações de monitoramento do ar. 
# As medições de um estação estão organizadas em um arquivo extensão .csv
# Cada linha de um arquivo é uma medição no tempo e dispõe de quatro colunas date,"sulfate","nitrate","ID"
# A função recebe diretório (directory), poluente (pollutant), estações a serem observadas (id):
# Diretório onde estão as amostras, nesse caso: C:/dados/coursera/Coursera_DS/specdata
# Para checar no prompt os arquivos que compõe esse diretório, usar
#       filestoread<- list.files("C:/dados/coursera/Coursera_DS/specdata",full.names = TRUE)

## Date,"sulfate","nitrate","ID"
#list.files("C:/dados/coursera/Coursera_DS/specdata",full.names = TRUE)


corr <- function(directory, threshold =0 ){
        filestoread <- list.files(directory,full.names = TRUE)
        numfiles <- 1:length(filestoread)
        nitrates <- vector()
        sulfates <- vector()

        for (files in numfiles) {
                measurement <- read.csv(filestoread[files])
                usefulldata <- complete.cases(measurement)
                pollutdatavalid <- measurement[usefulldata, ]
                nitrates <- c(nitrates, pollutdatavalid$nitrate)
                sulfates <- c(sulfates, pollutdatavalid$sulfate)
        }
        pairofdata <- cbind(sulfates, nitrates)
        pairofdata
}