# Read the data from the input text file
# Subset the data by filtering data for two days

setwd ("~/DataScience/ExData_Plotting/ExData_Plotting1")

dataFile <- "household_power_consumption.txt"

data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)

dataSubSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Obtain Global Active Power Data
globalActivePower <- as.numeric(dataSubSet$Global_active_power)

# Read date/time in the format 'd/m/y h:m:s'
datetime <- paste(dataSubSet$Date, dataSubSet$Time, sep=" ")

datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# Plot the graph and save the graph to file plot2.png
png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()