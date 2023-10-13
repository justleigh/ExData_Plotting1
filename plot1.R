data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", skip=66636, nrows=2880)
colnames(data) <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
data$date <- as.Date(data$date, format="%d/%m/%Y")
data <- na.omit(data)
# Compute the energy consumed by other electrical equipment
data$other_active_power <- (data$global_active_power * 1000 / 60) - data$sub_metering_1 - data$sub_metering_2 - data$sub_metering_3
# Create the histogram for visualization
hist(data$global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency")
# Open PNG device
png(filename="plot1.png", width=480, height=480)
hist(data$global_active_power, 
       +      col="red", 
       +      main="Global Active Power", 
       +      xlab="Global Active Power (kilowatts)", 
       +      ylab="Frequency")
dev.off()