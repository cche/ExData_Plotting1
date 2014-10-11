# Created a file with the data for 1/2/2007 and 2/2/2007 on the terminal.
# first get the header line
#     $ head -n 1 household_power_consumption.txt > housepower.csv
# Get the data for the specified days
#     $ grep -e "^[12]/2/2007" household_power_consumption.txt >> housepower.csv

png(filename = "plot1.png", width=480, height=480)
hp <- read.csv("../housepower.csv", sep=";", na.strings="?")
hist(hp$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()