# Read the data from the input text file
# Subset data by filtering data for two days

setwd ("~/DataScience/ExData_Plotting/ExData_Plotting1")

dataFile <- "household_power_consumption.txt"

data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)
dataSubSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Read date/time in the format 'd/m/y h:m:s'
datetime <- paste(dataSubSet$Date, dataSubSet$Time, sep=" ")
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# Obtain the Global Active Power data
globalActivePower <- as.numeric(dataSubSet$Global_active_power)

# Obtain the Energy submetering data
subMetering1 <- as.numeric(dataSubSet$Sub_metering_1)
subMetering2 <- as.numeric(dataSubSet$Sub_metering_2)
subMetering3 <- as.numeric(dataSubSet$Sub_metering_3)

# Obtain the Voltage data
voltage <- as.numeric(dataSubSet$Voltage)

# Obtain the Global Reactive Power data
globalReactivePower <- as.numeric(dataSubSet$Global_reactive_power)

# Plot the 4 graphs in 2x2 format and save the output to file plot4.png
png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, subMetering1, type="l", ylab="Energy Sub metering", xlab="")

lines(datetime, subMetering2, type="l", col="red")

lines(datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()