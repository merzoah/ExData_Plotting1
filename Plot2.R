
fileName <- file("household_power_consumption.txt") # define a fileName for full data file
## Getting full dataset
data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


# ## Subsetting the data from 2007-02-01 to 2007-02-02
data <- read.table(text = grep("^[1,2]/2/2007", readLines(fileName), value = TRUE), 
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   sep = ";", header = TRUE)

## Converting dates and time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") 
DateTime <- paste(as.Date(data$Date), data$Time) 
data$DateTime <- as.POSIXct(DateTime)

# Generating Plot2
plot(data$Global_active_power ~ data$DateTime, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

# Open PNG device
#png(file = "Plot2.png", width = 480, height = 480, units = "px")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
