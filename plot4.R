# Read the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings="?")

# Convert the Date column to Date format in R and filter the rows for the dates 2007-02-01 and 2007-02-02
data$date <- as.Date(data$Date, format="%d/%m/%Y")

# Convert Date and Time to POSIXct
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Filter data for the two-day period
data_filtered <- subset(data, DateTime >= as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S") & 
                          DateTime <= as.POSIXct("2007-02-02 23:59:59", format="%Y-%m-%d %H:%M:%S"))

# 3. Set up an empty 2x2 plotting space
par(mfrow = c(2,2))

# 4. Plotting
# Global active power
plot(data_filtered$DateTime, data_filtered$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "", xaxt="n")
axis(1, at = c(as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 23:59:59", format="%Y-%m-%d %H:%M:%S")),
     labels = c("Thu", "Fri", "Sat"), cex.axis = 0.7)

# Voltage
plot(data_filtered$DateTime, data_filtered$Voltage, type = "l", 
     ylab = "Voltage", xlab = "", xaxt="n")
axis(1, at = c(as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 23:59:59", format="%Y-%m-%d %H:%M:%S")),
     labels = c("Thu", "Fri", "Sat"), cex.axis = 0.7)

# Sub-metering
plot(data_filtered$DateTime, data_filtered$Sub_metering_1, type = "l", col="black", 
     ylab = "Energy sub-metering", xlab = "", xaxt="n", ylim=c(min(data_filtered$Sub_metering_1, data_filtered$Sub_metering_2, data_filtered$Sub_metering_3), max(data_filtered$Sub_metering_1, data_filtered$Sub_metering_2, data_filtered$Sub_metering_3)))
lines(data_filtered$DateTime, data_filtered$Sub_metering_2, col="red")
lines(data_filtered$DateTime, data_filtered$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
axis(1, at = c(as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 23:59:59", format="%Y-%m-%d %H:%M:%S")),
     labels = c("Thu", "Fri", "Sat"), cex.axis = 0.7)

# Global Reactive Power
plot(data_filtered$DateTime, data_filtered$Global_reactive_power, type = "l", 
     ylab = "Global Reactive Power", xlab = "", xaxt="n")
axis(1, at = c(as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 23:59:59", format="%Y-%m-%d %H:%M:%S")),
     labels = c("Thu", "Fri", "Sat"), cex.axis = 0.7)

# Open PNG device
png(filename="plot4.png", width=480, height=480)
# Global active power
plot(data_filtered$DateTime, data_filtered$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "", xaxt="n")
axis(1, at = c(as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 23:59:59", format="%Y-%m-%d %H:%M:%S")),
     labels = c("Thu", "Fri", "Sat"), cex.axis = 0.7)

# Voltage
plot(data_filtered$DateTime, data_filtered$Voltage, type = "l", 
     ylab = "Voltage", xlab = "", xaxt="n")
axis(1, at = c(as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 23:59:59", format="%Y-%m-%d %H:%M:%S")),
     labels = c("Thu", "Fri", "Sat"), cex.axis = 0.7)

# Sub-metering
plot(data_filtered$DateTime, data_filtered$Sub_metering_1, type = "l", col="black", 
     ylab = "Energy sub-metering", xlab = "", xaxt="n", ylim=c(min(data_filtered$Sub_metering_1, data_filtered$Sub_metering_2, data_filtered$Sub_metering_3), max(data_filtered$Sub_metering_1, data_filtered$Sub_metering_2, data_filtered$Sub_metering_3)))
lines(data_filtered$DateTime, data_filtered$Sub_metering_2, col="red")
lines(data_filtered$DateTime, data_filtered$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
axis(1, at = c(as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 23:59:59", format="%Y-%m-%d %H:%M:%S")),
     labels = c("Thu", "Fri", "Sat"), cex.axis = 0.7)

# Global Reactive Power
plot(data_filtered$DateTime, data_filtered$Global_reactive_power, type = "l", 
     ylab = "Global Reactive Power", xlab = "", xaxt="n")
axis(1, at = c(as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 00:00:00", format="%Y-%m-%d %H:%M:%S"), 
               as.POSIXct("2007-02-02 23:59:59", format="%Y-%m-%d %H:%M:%S")),
     labels = c("Thu", "Fri", "Sat"), cex.axis = 0.7)
dev.off()
