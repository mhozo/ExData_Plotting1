#Plots plot3.png, course project 1
powert <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?") 
#read initial data

powert$Date <- as.Date(powert$Date, format="%d/%m/%Y") 
#convert to date format

powert <- powert[powert$Date >= as.Date("2007-02-01") & powert$Date<=as.Date("2007-02-02"),] 
#subset from only these two dates

powert$Date <- as.POSIXlt(paste(as.Date(powert$Date, format="%d/%m/%Y"), powert$Time, sep=" "))


png(plot3.png, height=480, width=480) 
#size

plot(powert$Date, powert$Sub_metering_1, type="n", lwd=1, 
      ylim=c(0, max(c(powert$Sub_metering_1, powert$Sub_metering_2, powert$Sub_metering_3))),
      xlab="", ylab="Energy sub metering")

lines(powert$Date, powert$Sub_metering_1, col="black")
lines(powert$Date, powert$Sub_metering_2, col="red")
lines(powert$Date, powert$Sub_metering_3, col="blue")

legend("topright", lwd=1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot the graph

dev.copy(png, file="plot3.png")
dev.off() #turn off graphic device