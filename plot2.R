#  Plot2
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
ds.small$Global_active_power<-as.numeric(ds.small$Global_active_power)

# plot
##Sys.setlocale("LC_TIME", "C")
par(mar=c(5,5,5,5))
plot(x=ds.small$DateTime, y=ds.small$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", cex.lab=0.75, cex.axis=0.75)
dev.copy( png,        
          width     = 480,
          height    = 480,
          units     = "px",          
          "plot2.png"
)
dev.off()
