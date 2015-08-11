corr <- function(directory = "specdata", threshhold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    
    dat <- data.frame()
    sul_to_nit <- vector('numeric')
    
    for (i in 1:332) {
        file_name <- formatC(i, width = 3, format = "d", flag = "0")
        file_name <- paste(file_name, ".csv", sep = "")
        file_and_path <- file.path(directory, file_name)
        dat <- na.omit(read.csv(file_and_path))
        nobs <- nrow(dat)
        
        if (nobs > threshhold) {
            sul_to_nit <- c(sul_to_nit, cor(dat[, 2], dat[, 3]))
        }
    }

    return(sul_to_nit)

}