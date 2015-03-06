# Exploratory Data Analysis - Assignment week 1

# 1) Read data
# File assumed to be in working directory
filename <- "household_power_consumption.txt"
fulldata <- read.csv(filename, sep=";")
# Work with the data from Feb 1, 2007 to Feb 2, 2007
res <- fulldata$Date == "1/2/2007" | fulldata$Date == "2/2/2007"
data <- fulldata[res,]

# 2) Manipulate date and time information
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# 3) Plot data and save output
png(file="plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
with(data, {
  # Plot 1 
  plot(datetime, as.numeric(as.character(Global_active_power)), 
       ylab = "Global Active Power (kilowatts)",
       type="l",
       xlab = " ")
  # Plot 2
  plot(datetime, as.numeric(as.character(Voltage)), 
       ylab = "Voltage",
       type="l")
  # Plot 3
  plot(datetime, as.numeric(as.character(Sub_metering_1)), 
       ylab = "Energy sub metering",
       type="l",
       xlab = " ")
  lines(datetime, as.numeric(as.character(Sub_metering_2)),
        col = "red")
  lines(datetime, as.numeric(as.character(Sub_metering_3)),
        col = "blue")
  legend("topright", col=c("black","red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1)
  #Plot 4
  plot(datetime, as.numeric(as.character(Global_reactive_power)), type="l",
       ylab="Global_reactive_power")
  
})
dev.off()