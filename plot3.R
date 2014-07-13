library(data.table)
library(ggplot2)
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile="./data/household_power_consumption.zip")
dateDownloaded<-date()
dateDownloaded
unzip("household_power_consumption.zip")

powerdata<-read.csv("./data/household_power_consumption.csv",header = TRUE, na.strings="?")

powerdata$Date<-as.Date(powerdata$Date, format="%d/%m/%Y")
#y<-powerdata

subpowera<-subset(powerdata,powerdata$Date <"2007-2-3")
subpower<-subset(subpowera,subpowera$Date > "2007-1-31")

dataplot3<-as.data.frame(subpower)

dateTime <- strptime( paste(dataplot3$Date,dataplot3$Time), format="%Y-%m-%d %H:%M:%S")
dataplot3$datetime<-dateTime

par(mfrow=c(1,1),mar=c(3,4,2,2))
plot(dataplot3$datetime, dataplot3$Sub_metering_1, type="l", ylab="Energy sub metering",)
lines(dataplot3$datetime, dataplot3$Sub_metering_2, type="l", col=2)
lines(dataplot3$datetime, dataplot3$Sub_metering_3, type="l", col=4)
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1,)

png(filename = "plot3.png", width = 480, height = 480)
dev.off()


