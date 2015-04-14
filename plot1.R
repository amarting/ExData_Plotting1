filename <- "household_power_consumption.txt"
data <- read.table(filename,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")


subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"


Data <- data[subset,]


Data$Date <- as.Date(Data$Date, format="%d/%m/%y")
Data$Time <- strptime(Data$Time, format="%H:%M:%S")

png(filename= 'plot1.png', width=480, height=480)
hist(Data$Global_active_power, col='#ff2500', xlab='Global Active power(Kilowatts', main='Global Active Power')
dev.off()
