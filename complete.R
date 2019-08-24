## Date,"sulfate","nitrate","ID"
#list.files("C:/dados/coursera/Coursera_DS/specdata",full.names = TRUE)
# filestoread <- list.files("C:/dados/coursera/Coursera_DS/specdata",full.names = TRUE)
#"sulfate","nitrate","ID"

complete <- function(directory, id = 1:332){
        filestoread <- list.files(directory,full.names = TRUE)
        validstations <- vector()
        validmeasurements <- vector()
        
        for (station in id) {
                rawobs <- read.csv(filestoread[station])
                validobs <- complete.cases(rawobs)
                completeobs <- rawobs[validobs, ]
                nobs = nrow(completeobs)
                validstations <- c(validstations,station)
                validmeasurements <- c(validmeasurements,nobs)
        }
        
        stationsmeasurements <-  as.data.frame(cbind(validstations, validmeasurements))
        colnames(stationsmeasurements) <- c("id","nobs")
        stationsmeasurements
}