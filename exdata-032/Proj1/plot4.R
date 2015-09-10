## check to see if file already exists and skip download if already there
## if not there, download, and unzip

if (!file.exists("data")) {
    dir.create("data")
}

if (!file.exists("./data/power.zip")) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, destfile = "./data/power.zip", mode = 'wb')
}

if (!file.exists("./data/household_power_consumption.txt")) {
    unzip("./data/power.zip", exdir = "./data")
}

power_data <- read.table("./data/household_power_consumption.txt", header = TRUE, 
                         sep = ";", na.strings = "?")

## get only the dates specified
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

start_date <- as.POSIXct("2007-02-01")
end_date <- as.POSIXct("2007-02-03")
power_feb <- subset(power_data, 
                    (power_data$Date == "2007-02-01" | 
                         power_data$Date == "2007-02-02"))

power_feb$Sub_metering_1 <- as.numeric(power_feb$Sub_metering_1)
power_feb$Sub_metering_2 <- as.numeric(power_feb$Sub_metering_2)
power_feb$Sub_metering_3 <- as.numeric(power_feb$Sub_metering_3)
power_feb$Voltage <- as.numeric(power_feb$Voltage)
power_feb$Global_reactive_power <- as.numeric(power_feb$Global_reactive_power)
power_feb <- transform(power_feb, timestamp=as.POSIXct(paste(Date, Time)), 
                       "%d/%m/%Y %H:%M:%S")

## build plot
png('plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2))
with(power_feb, {
    plot(power_feb$timestamp, power_feb$Global_active_power, type = 'l', 
         xlab = "", ylab = "Global Active Power")
    plot(power_feb$timestamp, power_feb$Voltage, type = 'l', xlab = "datetime", 
         ylab = "Voltage")
    plot(power_feb$timestamp, power_feb$Sub_metering_1, type = "l", xlab = "",
         ylab = "Energy sub metering")
    lines(power_feb$timestamp, power_feb$Sub_metering_2, col = "red")
    lines(power_feb$timestamp, power_feb$Sub_metering_3, col = "blue")
    legend("topright", lty = 1, lwd = 1, bty = "n", cex = .9, col=c("black", 
            "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2",
            "Sub_metering_3"))
    plot(power_feb$timestamp, power_feb$Global_reactive_power, type = 'l', 
         xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()
