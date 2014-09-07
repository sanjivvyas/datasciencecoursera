##Class: Exploratory Data Analysis
##Author: Sanjiv Vyas
##Date: 09/07/2014
## File: plot2.R
## Desc: Examine how household energy usage varies over a 2-day period in February, 2007
## Desc: Plot2 is a line diagram showing usage over the days

plot2 <- function() { 
     filename <- "household_power_consumption.txt" 
     df <- read.table(filename, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?") 
     df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S") 
     df$Date <- as.Date(df$Date, "%d/%m/%Y") 
     # only use data from the dates 2007-02-01 and 2007-02-02 
     dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d") 
     df <- subset(df, Date %in% dates) 
     
     png("plot2.png", width=480, height=480)
     plot(df$Time, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
     dev.off() 
 } 
