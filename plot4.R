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

dataplot2<-as.data.frame(subpower)

dateTime <- strptime( paste(dataplot2$Date,dataplot2$Time), format="%Y-%m-%d %H:%M:%S")
dataplot2$datetime<-dateTime


par(mfrow=c(2,2),mar=c(4,4,1,2),oma = c(0, 0, 0, 0))
#top left
plot(dataplot2$datetime, dataplot2$Global_active_power, type="l", xlab = "",ylab="Global Active Power",sub=NULL)

#top right
plot (dataplot2$datetime,dataplot2$Voltage,type="l",main = "" , xlab = "datetime", ylab = "Voltage")

#bottom left
plot(dataplot2$datetime, dataplot2$Sub_metering_1, type="l",xlab = "", ylab="Energy sub metering",)
lines(dataplot2$datetime, dataplot2$Sub_metering_2, type="l", col=2)
lines(dataplot2$datetime, dataplot2$Sub_metering_3, type="l", col=4)
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1,bty="n",cex=0.6)

#bottom right
plot(dataplot2$datetime, dataplot2$Global_reactive_power, type="l", ylab="Global_reactive_power",sub=NULL,xlab = "datetime")


png(filename = "plot4.png", width = 480, height = 480)
dev.off()