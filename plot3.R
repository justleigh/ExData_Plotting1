# define the file path
file_path <- "household_power_consumption.txt"

# Read the dataset
data <- fread("household_power_consumption.txt", stringsAsFactors=FALSE)

# Convert the Date column to a Date type and Time column to a POSIXct type
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Convert the Date column to a Date type and Time column to a POSIXct type
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Subset the data for the desired dates
subset_data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# Plot
with(data_filtered, {
  plot(DateTime, Sub_metering_1, type="l", col="black", 
    ylim=c(0, max(Sub_metering_1, Sub_metering_2, Sub_metering_3)),
    xaxt="n",  # suppresses the default x-axis
    xlab="", ylab="Energy sub metering", main="Energy consumption from 1/2/2007 to 2/2/2007")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  axis(1, at=c(min(DateTime), mean(DateTime), max(DateTime)), 
    labels=c("Thu", "Fri", "Sat"))
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    col=c("black", "red", "blue"), lty=1, cex=0.8)
})
