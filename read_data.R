## read_data.R
## Author: Irena Papst
## Define a function to read the household electric power consumption
## data and return a tidy data frame ready for plotting

read_data <- function(){
  ## Set start and end dates for which to extract observations
  start_date <- "1/2/2007"
  end_date <- "2/2/2007"
  
  ## Get line numbers to read from file using start and end dates
  ## Note: -E flag used for extended regex to avoid need to escape
  ## the (, |, and ) characters
  filename <- "data/household_power_consumption.txt"
  cmd <- paste0('grep -nE "^(', start_date, '|', end_date,
                ')" ', filename, ' ',
                '|cut -f 1 -d :')
  lines <- as.numeric(system(cmd, intern = TRUE))
  skip <- min(lines)-1 ## offset by 1 to compensate for presence
    ## of column header line
  # nrows <- as.integer(max(lines)-min(lines))
  nrows <- length(lines)
  
  ## Get column names and format nicely
  colnames <- tolower(names(read.table(filename, header = TRUE,
                                       nrows = 1, sep = ";")))
  
  ## Read data  
  data <- read.table("data/household_power_consumption.txt",
                     header = FALSE, sep = ";",
                     na.strings = "?",
                     col.names = colnames,
                     colClasses = c(rep("character",2),
                                    rep("numeric", 7)),
                     skip = skip,
                     nrows = nrows)
  
  ## Add column with date and time as one entry
  datetime <- as.POSIXct(paste(data$date, data$time),
                         format="%d/%m/%Y %H:%M:%S")
  cbind(datetime, data)
}