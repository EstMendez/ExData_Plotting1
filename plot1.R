plot1 <- function() {
        power <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
        power <- power[66637:69517, ]
        power$Date <- as.character(power$Date)
        power$Time <- as.character(power$Time)
        power$Time <- paste(power$Date, power$Time)
        power$Time <- strptime(power$Time, "%d/%m/%Y %H:%M:%S")
        png("plot1.png")
        hist(power$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
}