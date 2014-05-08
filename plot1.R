# Read data from file
data <- read.table("household_power_consumption.txt",
                   header=TRUE,sep=";",na.strings="?")

# Make Date variable to become R Date
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

# Extract only usefull dates
needed <- data$Date == "2007-02-02" | data$Date == "2007-02-01"
data <- data[needed,]

# Plot 1
png(file=".\\figure\\plot1.png",
    width=480,height=480, units = "px", bg="transparent")
hist(data$Global_active_power,col="red", 
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()