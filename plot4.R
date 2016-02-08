## Download data to your working directory from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## Activate applicable libraries
library(dplyr)
library(lubridate)

## Load data for Feb 1, 2007 and Feb 2, 2007 and add date/time column
power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE) %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
power$datetime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

## Create line graph of weekday vs sub_metering 1, 2, 3
png(file = "plot4.png")
par(mfcol=c(2,2))

# plot 1
with(power, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# plot 2
with(power, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
with(power, lines(datetime, Sub_metering_2, col="red"))
with(power, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"))

# plot 3
with(power, plot(datetime, Voltage, type="l"))

# plot 4
with(power, plot(datetime, Global_reactive_power, type="l"))

dev.off()