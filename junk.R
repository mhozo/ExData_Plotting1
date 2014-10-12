##setwd("ExData_Plotting1")


powerp <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 100)
which(powerp["Date"] == "16/12/2006")

powerq <- fread("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
setkey(powerq,"Date")
which(powerq["Date"] == "16/12/2006")
subset(powerq, Date == "16/12/2006")

##really proud of for (col in names(powerp)) {print(class(powerp[,col]))}
##everythign is numeric except date and time are factor for some reason
##as.Date("16/12/2006", "%d/%m/%Y")

x <- paste(powerp[,"Date"], powerp[,"Time"])
strptime(x, "%d/%m/%Y %H:%M:%S")
merge(powerp, strptime(x, "%d/%m/%Y %H:%M:%S"))

powerr <- subset(powerq, (Date == "1/2/2007" | Date == "1/1/2007"))
#powerq <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?", nrows=1000, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

hist(powerr[])
## --------------------

powerq <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?", nrows=2100000, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
powerr <- subset(powerq, (Date == "1/2/2007" | Date == "1/1/2007"))
#y <- paste(powerr[,"Date"], powerr[,"Time"])
#strptime(y, "%d/%m/%Y %H:%M:%S")
#powers <- merge(powerr, strptime(y, "%d/%m/%Y %H:%M:%S"))
hist(powerr[,"Global_active_power"], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", width = 480)
dev.copy(png, file="plot1.png")

png(plot1.png, height=480, width=480) 
dev.off()


powert <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?") #read initial data
powert$Date <- as.Date(powert$Date, format="%d/%m/%Y") #convert to date format
powert <- powert[powert$Date >= as.Date("2007-02-01") & powert$Date<=as.Date("2007-02-02"),] #subset from only these two dates
png(plot1.png, height=480, width=480) #size
hist(powert$Global_active_power, breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red") #plot the histogram
dev.off() #turn off graphic device
