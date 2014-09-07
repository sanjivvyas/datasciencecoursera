##Class: Exploratory Data Analysis
##Author: Sanjiv Vyas
##Date: 09/07/2014
## File: plot1.R
## Desc: Examine how household energy usage varies over a 2-day period in February, 2007
## Desc: Plot1 is a hisogram of Global Active Power in KW
##1.Date: Date in format dd/mm/yyyy 
##2.Time: time in format hh:mm:ss 
##3.Global_active_power: household global minute-averaged active power (in kilowatt) 
##4.Global_reactive_power: household global minute-averaged reactive power (in kilowatt) 
##5.Voltage: minute-averaged voltage (in volt) 
##6.Global_intensity: household global minute-averaged current intensity (in ampere) 
##7.Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot ##plates are not electric but gas powered). 
##8.Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator ##and a light. 
##9.Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

plot1 <- function() { 
       filename <- "household_power_consumption.txt" 
       df <- read.table(filename, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?") 
       df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S") 
       df$Date <- as.Date(df$Date, "%d/%m/%Y") 
       # Filtered dates 2007-02-01 and 2007-02-02 
       dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d") 
       df <- subset(df, Date %in% dates) 
       
       png("plot1.png", width=480, height=480) 
          
         hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red") 
            
         dev.off() 
} 