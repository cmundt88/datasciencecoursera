pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    id_len <- length(id)
    dat <- data.frame()

    for (i in 1:id_len) {
        file_name <- formatC(id[i], width = 3, format = "d", flag = "0")
        file_name <- paste(file_name, ".csv", sep = "")
        file_add <- file.path(directory, file_name)
        dat <- rbind(dat, read.csv(file_add))
    }

    mean(dat[[pollutant]], na.rm = TRUE)
        
}