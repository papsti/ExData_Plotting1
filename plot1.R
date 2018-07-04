## plot1.R
## Author: Irena Papst
## Plot a histogram of global active power

## Get function to read and format the data
source("read_data.R")

## Read data
data <- read_data()

## Initialize png device
png(filename = "plot1.png")

## Draw histogram
hist(data$global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")

## Turn graphics device off
dev.off()
