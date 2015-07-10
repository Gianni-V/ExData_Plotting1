library("dplyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.2/Resources/library")
Sys.setlocale("LC_TIME", "C")
data <- read.csv(file = "household_power_consumption.txt", na.strings = "?", header = T, sep = ";")
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data <- mutate(data, datetime=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

png(filename = "plot3.png", width = 480, height = 480)
with(data, {
    plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    points(datetime, Sub_metering_2, type = "l", col ="red")
    points(datetime, Sub_metering_3, type = "l", col ="blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
})
dev.off()