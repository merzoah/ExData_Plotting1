#Choosing working directory and file
data<-read.table(file.choose())
data <- read.table("household_power_consumption.txt", header=T, sep=';', 
                   na.strings="?",nrows=2075259, check.names=F, 
                   stringsAsFactors=F, comment.char="", quote='\"')

# Selecting adequate lines
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data<-data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

# Joining day and time to create a new posix date
data$posix <- as.POSIXct(strptime(paste(data$Date, data$Time, sep = " "),
                                  format = "%Y-%m-%d %H:%M:%S"))

png(file = "plot2.png", width = 480, height = 480, units = "px")
with(data,
     plot(posix,
          Global_active_power,
          type = "l",
          xlab = "",
          ylab = "Global Active Power (kilowatts)"))
dev.off()  # Close the png file device
