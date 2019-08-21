## Date,"sulfate","nitrate","ID"

pollutantmean <- function(directory, pollutant, id ="002"){
        filetoread <- paste0(directory, as.character(id), ".csv")
        filetoread
        pollutdata <- read.csv(filetoread)
        pollutdata
        #pollutselect <- pollutdata[pollutant, id]
}