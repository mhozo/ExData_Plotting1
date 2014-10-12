#Plots plot1.png, course project 1
powert <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?") 
#read initial data

powert$Date <- as.Date(powert$Date, format="%d/%m/%Y") 
#convert to date format

powert <- powert[powert$Date >= as.Date("2007-02-01") & powert$Date<=as.Date("2007-02-02"),] 
#subset from only these two dates

png(plot1.png, height=480, width=480) 
#size

hist(powert$Global_active_power, breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red") 
#plot the histogram

dev.off() #turn off graphic device