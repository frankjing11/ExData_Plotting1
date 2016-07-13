####################Plot 4#########################################

#read the original dataset
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

#select time period from 2007-02-01 to 2007-02-02
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#create a new datetime variable with date and time
data2 <-cbind(data1,strptime(paste(data1$Date, data1$Time, sep=" "),"%d/%m/%Y %H:%M:%S"))
colnames(data2)[10] <- "Datetime"

# open device
png(filename = './plot4.png', width = 480, height = 480, units='px')

# Create plot
par(mfrow = c(2, 2))
plot(data2$Datetime, data2$Global_active_power, xlab = '', 
     ylab = 'Global Active Power (kilowatt)', type = 'l')

plot(data2$Datetime, data2$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')

plot(data2$Datetime, data2$Sub_metering_1, xlab = '', 
     ylab = 'Energy sub metering', type = 'n')
lines(data2$Datetime, data2$Sub_metering_1, type = 'l')
lines(data2$Datetime, data2$Sub_metering_2, col = 'red', type = 'l')
lines(data2$Datetime, data2$Sub_metering_3, col = 'blue', type = 'l')
legend("topright", bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , lty=1, col=c("black","red","blue"))

plot(data2$Datetime, data2$Global_reactive_power, 
     xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')

# close device
dev.off()