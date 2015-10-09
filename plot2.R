plot2 <- function() {
        power <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
        power <- power[66637:69517, ]
        power$Date <- as.character(power$Date)
        power$Time <- as.character(power$Time)
        power$Time <- paste(power$Date, power$Time)
        power$Time <- strptime(power$Time, "%d/%m/%Y %H:%M:%S")
        png("plot2.png")
        par(mar=c(3,4,4,2))
        with(power, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))
        dev.off()
}