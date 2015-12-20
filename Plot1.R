po <- read.table("household_power_consumption.txt", header=TRUE,sep = ";",stringsAsFactors = T,na.strings = "?")
newpo <- po # remian original data 
newDate <- as.Date(po$Date, "%d/%m/%Y")
newpo$Date <- newDate
newDatepo <- subset(newpo, Date >= "2007-02-01" & Date <= "2007-02-02")
png(filename = "plot1.png", width = 480, height = 480)
hist(newDatepo$Global_active_power,xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()
