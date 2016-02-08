## Download data to your working directory from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## Activate applicable libraries
library(dplyr)
library(lubridate)

## Load data for Feb 1, 2007 and Feb 2, 2007 and add date/time column
power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE) %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
power$datetime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

## Create line graph of weekday vs sub_metering 1, 2, 3
png(file = "plot3.png")
with(power, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
with(power, lines(datetime, Sub_metering_2, col="red"))
with(power, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"))
dev.off()