#Plots plot2.png, course project 1
powert <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?") 
#read initial data

powert$Date <- as.Date(powert$Date, format="%d/%m/%Y") 
#convert to date format

powert <- powert[powert$Date >= as.Date("2007-02-01") & powert$Date<=as.Date("2007-02-02"),] 
#subset from only these two dates

powert$Date <- as.POSIXlt(paste(as.Date(powert$Date, format="%d/%m/%Y"), powert$Time, sep=" "))


png(plot2.png, height=480, width=480) 
#size

plot(powert$Date, powert$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

     #plot the graph

dev.copy(png, file="plot2.png")
dev.off() #turn off graphic device