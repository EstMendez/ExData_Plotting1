plot3 <- function() {
        power <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
        power <- power[66637:69517, ]
        power$Date <- as.character(power$Date)
        power$Time <- as.character(power$Time)
        power$Time <- paste(power$Date, power$Time)
        power$Time <- strptime(power$Time, "%d/%m/%Y %H:%M:%S")
        png("plot3.png")
        with(power, plot(Time, Sub_metering_1, ylab = "Energy sub Metering", type="s"))
        with(power, points(Time, Sub_metering_2, col= "red", type = "s"))
        with(power, points(Time, Sub_metering_3, col= "blue", type="s"))
        legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
}