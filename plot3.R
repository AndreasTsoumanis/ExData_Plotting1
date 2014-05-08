# Read data from file
data <- read.table("household_power_consumption.txt",
                   header=TRUE,sep=";",na.strings="?")

# Make Date variable to become R Date
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

# Extract only usefull dates
needed <- data$Date == "2007-02-02" | data$Date == "2007-02-01"
data <- data[needed,]

# Plot 3
x <- paste(data$Date,data$Time,sep=" ")
x <- strptime(x,format="%Y-%m-%d %H:%M:%S")
png(file=".\\figure\\plot3.png",
    width=480,height=480, units = "px", bg="transparent")
plot(x,data$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering",
     type = "n")
points(x,data$Sub_metering_1, xlab = "",
       ylab = "Energy sub metering",
       type = "l")
points(x,data$Sub_metering_2, xlab = "",
       ylab = "Energy sub metering",
       type = "l", col = "red")
points(x,data$Sub_metering_3, xlab = "",
       ylab = "Energy sub metering",
       type = "l", col = "blue")
legend("topright",
       pch = "_",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"))   
dev.off()
