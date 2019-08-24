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
        cr <- as.numeric(vector()) 
        
        # selecionando quais serão as estações lidas
        
        Complete_stations <- complete_station_data(directory)
        set.selectedstations <- Complete_stations$nobs > threshold
        selectedstations <- Complete_stations [set.selectedstations, ]
        set.filestoread <- selectedstations$id
        
        if(any(set.selectedstations)){
                # selecionando os aquivos que serão consultados
                
                allfiles <- list.files(directory,full.names = TRUE)
                filestoread <- allfiles[set.filestoread]
                
                # calculando a correlacao em cada dataset selecionado
                
                for (i in 1:length(filestoread)){
                        station.data <- read.csv(filestoread[i])
                        valid.station.data <- complete.cases(station.data)
                        complete.station.data <- as.data.frame(station.data[valid.station.data,])
                        X <- complete.station.data$nitrate
                        Y <- complete.station.data$sulfate
                        cr[i] <- cor(X,Y)
                }
                cr           # Vetor de correlações que é retornado em caso de haver estações que atendam ao limite
                
        }
        cr  #vetor de correlações vazio
        
}

