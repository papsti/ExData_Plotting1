## plot3.R
## Author: Irena Papst
## Plot timeseries of energy consumption split by submeter

## Get function to read and format the data
source("read_data.R")

## Read data
data <- read_data()

## Initialize png device
png(filename = "plot3.png")

## Set colour vector (to automatically update legend)
cols <- c("black", "red", "blue")

## Draw timeseries for each submeter
with(data,
     plot(datetime, sub_metering_1,
          xlab ="",
          ylab = "Energy sub metering",
          type = "l"))

with(data,
     points(datetime, sub_metering_2,
            type = "l", col = cols[2]))

with(data,
     points(datetime, sub_metering_3,
            type = "l", col = cols[3]))


## Add legend
library(Hmisc)
legend <- capitalize(names(data)[8:10])
legend("topright",
       legend = legend,
       col = cols,
       lty = 1)

## Turn graphics device off
dev.off()