
#Plot1 code
fileName <- file("household_power_consumption.txt") 

#Choosing working directory and file
data<-read.table(file.choose())


data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#Generating plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Saving png file 
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

