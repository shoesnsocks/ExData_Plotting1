## Download data to your working directory from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## Activate applicable libraries
library(dplyr)
library(lubridate)

## Load data for Feb 1, 2007 and Feb 2, 2007
power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?") %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

## Create histogram for Global Active Power
png(file = "plot1.png")
hist(power$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()



