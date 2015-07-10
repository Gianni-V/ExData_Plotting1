library("dplyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.2/Resources/library")
Sys.setlocale("LC_TIME", "C")
data <- read.csv(file = "household_power_consumption.txt", na.strings = "?", header = T, sep = ";")
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data <- mutate(data, datetime=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

png(filename = "plot2.png", width = 480, height = 480)
with(data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()