#  Plot4
#    REQ: Input dataset should be in current working directory
#
#    NOTE: days of week will be displayed according to your local
#          if you want to see them in English (Thu, Fri, Sat) - just
#          uncomment line with two ## signs

#   read and prepare data
ds.orig<-read.csv2(file="household_power_consumption.txt", stringsAsFactors=FALSE)

ds.small<-ds.orig[ds.orig$Date == "1/2/2007" | ds.orig$Date == "2/2/2007",]

#   correct data types      
ds.small$DateTime<-as.POSIXct(paste(ds.small$Date, ds.small$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")     
ds.small$Sub_metering_1<-as.numeric(ds.small$Sub_metering_1)
ds.small$Sub_metering_2<-as.numeric(ds.small$Sub_metering_2)
ds.small$Sub_metering_3<-as.numeric(ds.small$Sub_metering_3)
ds.small$Global_active_power<-as.numeric(ds.small$Global_active_power)
ds.small$Voltage<-as.numeric(ds.small$Voltage)
ds.small$Global_reactive_power<-as.numeric(ds.small$Global_reactive_power)

# plot
##Sys.setlocale("LC_TIME", "C")
par(mar=c(4,4,4,1))
# draw 4 (2 X 2) graphs
par(mfrow= c(2, 2))
# (1,1) from plot2
plot(x=ds.small$DateTime, y=ds.small$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", cex.lab=0.75, cex.axis=0.75)

# (1,2) new here - Voltage
plot(x=ds.small$DateTime, y=ds.small$Voltage, type="l", ylab="Voltage", xlab="datetime", cex.lab=0.75, cex.axis=0.75)

# (2,1) from Plot3
plot(x=ds.small$DateTime, y=ds.small$Sub_metering_1, type="l", 
     ylab="Energy sub metering", xlab="", cex.lab=0.75, cex.axis=0.75)

lines(x=ds.small$DateTime, y=ds.small$Sub_metering_2, col="red")
lines(x=ds.small$DateTime, y=ds.small$Sub_metering_3, col="blue")
legend(x="topright",  c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), 
       lwd=c(2.5,2.5,2.5),col=c("black","red","blue"), cex=0.8
       ,  bty = "n")

# (2,2) new here Global reactive power
plot(x=ds.small$DateTime, y=ds.small$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", cex.lab=0.75, cex.axis=0.75)

dev.copy( png,        
          width     = 480,
          height    = 480,
          units     = "px",          
          "plot4.png"
)
dev.off()
par(mfrow= c(1,1))