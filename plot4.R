# Created a file with the data for 1/2/2007 and 2/2/2007 on the terminal.
# first get the header line
#     $ head -n 1 household_power_consumption.txt > housepower.csv
# Get the data for the specified days
#     $ grep -e "^[12]/2/2007" household_power_consumption.txt >> housepower.csv
hp <- read.csv("../housepower.csv", sep=";", na.strings="?")
hp$dt<-strptime(paste(hp$Date, hp$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4c.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(hp$dt, hp$Global_active_power, ylab = "Global Active Power", xlab = "", type="l")

plot(hp$dt, hp$Voltage, ylab = "Voltage", xlab = "datetime", type="l")

plot(hp$dt, hp$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(hp$dt, hp$Sub_metering_2, type="l", col="red")
lines(hp$dt, hp$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1), adj=0, bty="n", col=c("black", "red", "blue"))

plot(hp$dt, hp$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
