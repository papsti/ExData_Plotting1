## plot2.R
## Author: Irena Papst
## Plot a timeseries of global active power

## Get function to read and format the data
source("read_data.R")

## Read data
data <- read_data()

## Initialize png device
png(filename = "plot2.png")

## Draw timeseries
with(data,
     plot(datetime, global_active_power,
          xlab ="",
          ylab = "Global Active Power (kilowatts)",
          type = "l"))

## Turn graphics device off
dev.off()