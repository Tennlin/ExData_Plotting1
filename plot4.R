po <- read.table("household_power_consumption.txt", header=TRUE,sep = ";",stringsAsFactors = T,na.strings = "?")
newpo <- po # remian original data 
newDate <- as.Date(po$Date, "%d/%m/%Y")
newpo$Date <- newDate
newDatepo <- subset(newpo, Date >= "2007-02-01" & Date <= "2007-02-02")
Date_time <- paste(newDatepo$Date, newDatepo$Time)
temp_combine <- strptime(Date_time, format = "%Y-%m-%d %H:%M:%S")
newDatepo$Date_time_combine <- temp_combine
png(filename = "plot4.png", width = 480, height = 480)
Sys.setlocale("LC_TIME", "English")
par(mfrow = c(2, 2))
#topleft
plot(newDatepo$Date_time_combine, newDatepo$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")
#topright
plot(newDatepo$Date_time_combine, newDatepo$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#downleft
plot(c(newDatepo$Date_time_combine,newDatepo$Date_time_combine,newDatepo$Date_time_combine),c(newDatepo$Sub_metering_1,newDatepo$Sub_metering_2,newDatepo$Sub_metering_3),type = "n", ylab = "Energy sub metering", xlab="")
lines(newDatepo$Date_time_combine, newDatepo$Sub_metering_1, col="black")
lines(newDatepo$Date_time_combine, newDatepo$Sub_metering_2, col="red")
lines(newDatepo$Date_time_combine, newDatepo$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, box.lwd = 0, cex = .5)
#legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, box.lwd=0, col=c("black", "red", "blue"))
#downright
plot(newDatepo$Date_time_combine, newDatepo$Global_reactive_power ,type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()


