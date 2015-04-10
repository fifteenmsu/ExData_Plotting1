#  Plot1
#    REQ: Input dataset should be in current working directory

#   read and prepare data
ds.orig<-read.csv2(file="household_power_consumption.txt", stringsAsFactors=FALSE)

ds.small<-ds.orig[ds.orig$Date == "1/2/2007" | ds.orig$Date == "2/2/2007",]

#   correct data types      
ds.small$Global_active_power<-as.numeric(ds.small$Global_active_power)

# plot
par(mar=c(5,5,5,5))
hist(ds.small$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", cex.lab=0.75, cex.axis=0.75)
dev.copy( png,        
        width     = 480,
        height    = 480,
        units     = "px",
        "plot1.png"
)
dev.off()

