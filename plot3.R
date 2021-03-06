# Read the  data from the input text file
# Subset the data by filtering data for two days

setwd ("~/DataScience/ExData_Plotting/ExData_Plotting1")

dataFile <- "household_power_consumption.txt"

data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)

dataSubSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Read date/time in the format 'd/m/y h:m:s'
datetime <- paste(dataSubSet$Date, dataSubSet$Time, sep=" ")
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# Obtain the submetering data
subMetering1 <- as.numeric(dataSubSet$Sub_metering_1)
subMetering2 <- as.numeric(dataSubSet$Sub_metering_2)
subMetering3 <- as.numeric(dataSubSet$Sub_metering_3)

# Plot the graph and save the graph to file plot3.png
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")

lines(datetime, subMetering2, type="l", col="red")

lines(datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))

dev.off()