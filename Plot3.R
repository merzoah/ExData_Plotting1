
#Choosing working directory and file
data<-read.table(file.choose())
data <- read.table("household_power_consumption.txt", header=T, sep=';', 
                   na.strings="?",nrows=2075259, check.names=F, 
                   stringsAsFactors=F, comment.char="", quote='\"')

# Selecting adequate lines
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

# Joining day and time to create a new posix date
data$posix <- as.POSIXct(strptime(paste(data$Date, data$Time, sep = " "),
                                format = "%Y-%m-%d %H:%M:%S"))

# Convert column that we will use to correct class
data$Global_active_power<- as.numeric(data$Global_active_power)

#Generating plot 3
png(file = "plot3.png", width = 480, height = 480, units = "px")

with(data,
     plot(posix,
          Sub_metering_1,
          type = "l",
          xlab = "",
          ylab = "Energy sub metering"))
with(data,
     points(posix,
            type = "l",
            Sub_metering_2,
            col = "red"))

with(data,
     points(posix,
            type = "l",
            Sub_metering_3,
            col = "blue"))

legend("topright", col = c("black", "blue", "red"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty = 1)
dev.off()  # Close the png file device
