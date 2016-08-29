# Read the entire data from the input text file
# Filter the data for only two days

setwd ("~/DataScience/ExData_Plotting/ExData_Plotting1")

dataFile <- "household_power_consumption.txt"

data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)

dataSubSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Obtain data for Global Active Power
globalActivePower <- as.numeric(dataSubSet$Global_active_power)

# Plot the graph and save the graph to file plot1.png
png("plot1.png", width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()