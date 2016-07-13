####################Plot 1#########################################

#read the original dataset
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

#select time period from 2007-02-01 to 2007-02-02
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#create a new datetime variable with date and time
data2 <-cbind(data1,strptime(paste(data1$Date, data1$Time, sep=" "),"%d/%m/%Y %H:%M:%S"))
colnames(data2)[10] <- "Datetime"

# open device
png(filename = './plot1.png', width = 480, height = 480, units='px')

# Create plot
hist(data2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close device
dev.off()
