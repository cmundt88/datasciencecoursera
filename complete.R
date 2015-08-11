complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    id_len <- length(id)
    dat <- data.frame("id" = integer(), 
                      "nobs" = character(), stringsAsFactors = FALSE)

    for (i in 1:id_len) {
        file_name <- formatC(id[i], width = 3, format = "d", flag = "0")
        file_name <- paste(file_name, ".csv", sep = "")
        file_and_path <- file.path(directory, file_name)
        nobs <- nrow(na.omit(read.csv(file_and_path)))
        dat[nrow(dat) +1, ] <- c(id[i], nobs)
    }
    
    return(dat)
    
}