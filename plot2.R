# Read data from file
data <- read.table("household_power_consumption.txt",
                   header=TRUE,sep=";",na.strings="?")

# Make Date variable to become R Date
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

# Extract only usefull dates
needed <- data$Date == "2007-02-02" | data$Date == "2007-02-01"
data <- data[needed,]

# Plot 2
png(file=".\\figure\\plot2.png",
    width=480,height=480, units = "px", bg="transparent")
x <- paste(data$Date,data$Time,sep=" ")
x <- strptime(x,format="%Y-%m-%d %H:%M:%S")
plot(x,data$Global_active_power, xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")
dev.off()