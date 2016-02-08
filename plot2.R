## Download data to your working directory from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## Activate applicable libraries
library(dplyr)
library(lubridate)

## Load data for Feb 1, 2007 and Feb 2, 2007 and add date/time column
power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE) %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
power$datetime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

## Create line graph of weekday vs global active power
png(file = "plot2.png")
with(power, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()