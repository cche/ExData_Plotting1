# Created a file with the data for 1/2/2007 and 2/2/2007 on the terminal.
# first get the header line
#     $ head -n 1 household_power_consumption.txt > housepower.csv
# Get the data for the specified days
#     $ grep -e "^[12]/2/2007" household_power_consumption.txt >> housepower.csv

png(filename = "plot3.png", width = 480, height = 480)
hp <- read.csv("../housepower.csv", sep=";", na.strings="?")
hp$dt<-strptime(paste(hp$Date, hp$Time), "%d/%m/%Y %H:%M:%S")
plot(hp$dt, hp$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(hp$dt, hp$Sub_metering_2, type="l", col="red")
lines(hp$dt, hp$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), xjust = 1, col=c("black", "red", "blue"))
dev.off()
