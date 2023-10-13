# read the data factoring in the "?" for missing values and data separated by ";"
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
# Convert the Date column to Date format in R and filter the rows for the dates 2007-02-01 and 2007-02-02
data$date <- as.Date(data$date, format="%d/%m/%Y")
data_filtered <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
# Plot the grph in base R
with(data_filtered, plot(strptime(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
# Save as png
png("plot2.png", width=480, height=480)
with(data_filtered, plot(strptime(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()