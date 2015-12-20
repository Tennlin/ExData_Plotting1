po <- read.table("household_power_consumption.txt", header=TRUE,sep = ";",stringsAsFactors = T,na.strings = "?")
newpo <- po # remian original data 
newDate <- as.Date(po$Date, "%d/%m/%Y")
newpo$Date <- newDate
newDatepo <- subset(newpo, Date >= "2007-02-01" & Date <= "2007-02-02")
Date_time <- paste(newDatepo$Date, newDatepo$Time)
temp_combine <- strptime(Date_time, format = "%Y-%m-%d %H:%M:%S")
newDatepo$Date_time_combine <- temp_combine
png(filename = "plot2.png", width = 480, height = 480)
Sys.setlocale("LC_TIME", "English")
plot(newDatepo$Date_time_combine, newDatepo$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power(kilowatts)")
dev.off()
