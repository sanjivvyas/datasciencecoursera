plot1 <- function() { 
       filename <- "household_power_consumption.txt" 
       df <- read.table(filename, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?") 
       df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S") 
       df$Date <- as.Date(df$Date, "%d/%m/%Y") 
       # only use data from the dates 2007-02-01 and 2007-02-02 
       dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d") 
       df <- subset(df, Date %in% dates) 
       
       png("plot1.png", width=400, height=400) 
          
         hist(df$Global_active_power, 
                main="Global Active Power", 
                xlab="Global Active Power (kilowatts)", 
                ylab="Frequency", 
                col="red") 
            
         dev.off() 
      
} 
