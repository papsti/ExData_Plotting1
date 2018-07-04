## plot4.R
## Author: Irena Papst
## Create array of various plots

## Get function to read and format the data
source("read_data.R")

## Read data
data <- read_data()

## Initialize png device
png(filename = "plot4.png")

## Set up array of plots
par(mfrow=c(2,2))

## PLOT 1

with(data,
     plot(datetime, global_active_power,
          xlab ="",
          ylab = "Global Active Power",
          type = "l"))

## PLOT 2

with(data,
     plot(datetime, voltage,
          ylab = "Voltage",
          type = "l"))

## PLOT 3

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
       lty = 1,
       bty = 'n')

## PLOT 4

with(data,
     plot(datetime, global_reactive_power,
          ylab = "Global_reactive_power",
          type = "l"))

## Turn graphics device off
dev.off()