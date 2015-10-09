plot4 <- function() {
        power <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
        power <- power[66637:69517, ]
        power$Date <- as.character(power$Date)
        power$Time <- as.character(power$Time)
        power$Time <- paste(power$Date, power$Time)
        power$Time <- strptime(power$Time, "%d/%m/%Y %H:%M:%S")
        png("plot4.png")
        par(mfrow = c(2,2))
        with(power, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power", xlab=""))
        with(power, plot(Time, Voltage, type = "l", ylab = "Voltage", xlab=""))
        with(power, plot(Time, Sub_metering_1, ylab = "Energy sub Metering", type="s", xlab=""))
        with(power, points(Time, Sub_metering_2, col= "red", type = "s"))
        with(power, points(Time, Sub_metering_3, col= "blue", type="s"))
        legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        with(power, plot(Time, Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab=""))
        dev.off()
}