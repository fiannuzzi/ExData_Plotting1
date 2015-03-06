# Exploratory Data Analysis - Assignment week 1

# 1) Read data
# File assumed to be in working directory
filename <- "household_power_consumption.txt"
fulldata <- read.csv(filename, sep=";")
# Work with the data from Feb 1, 2007 to Feb 2, 2007
res <- fulldata$Date == "1/2/2007" | fulldata$Date == "2/2/2007"
data <- fulldata[res,]

# 2) Plot data and save output
png(file="plot1.png", width = 480, height = 480, units = "px")
par(mfrow=c(1,1))
with(data, hist(as.numeric(as.character(Global_active_power)), 
                main = "Global Active Power", col = "red",
                xlab = "Global Active Power (kilowatts)"))
dev.off()

