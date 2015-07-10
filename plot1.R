library("dplyr")
# I needed to switch to standard locale
Sys.setlocale("LC_TIME", "C")
data <- read.csv(file = "household_power_consumption.txt", na.strings = "?", header = T, sep = ";")
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
# dplyr was complaining about POSIXlt so I used as.POSIXct
data <- mutate(data, datetime=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main="Global Active Power", col = "red")
dev.off()