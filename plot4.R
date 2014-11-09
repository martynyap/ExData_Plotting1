data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
mydata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(mydata$Global_active_power)
globalReactivePower <- as.numeric(mydata$Global_reactive_power)
voltage <- as.numeric(mydata$Voltage)
mysub1 <- as.numeric(mydata$Sub_metering_1)
mysub2 <- as.numeric(mydata$Sub_metering_2)
mysub3 <- as.numeric(mydata$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, mysub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, mysub2, type="l", col="red")
lines(datetime, mysub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()