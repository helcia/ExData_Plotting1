library(data.table)
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile="./data/household_power_consumption.zip")
dateDownloaded<-date()
dateDownloaded
unzip("household_power_consumption.zip")
powerdata<-read.csv("./data/household_power_consumption.csv",header = TRUE, na.strings="?")

powerdata$Date<-as.Date(powerdata$Date, format="%d/%m/%Y")
y<-powerdata

subpowera<-subset(y,y$Date <"2007-2-3")
subpower<-subset(subpowera,subpowera$Date > "2007-1-31")
str(subpower)
summary(subpower)

datahist<-as.data.frame(subpower)
par(mar=c(4,4,2,2))
hist(datahist$Global_active_power,col="red",main = "Global Active Power",xlab="Global Active Power (kilowatts)",ylim=c(0,1200))

png(filename = "plot1.png", width = 480, height = 480)
dev.copy(png,file="plot1.png")
dev.off()
