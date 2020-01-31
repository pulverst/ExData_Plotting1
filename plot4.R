#Plotting Assignment 1 for Exploratory Data Analysis
#
#Script to create plot 4
#pulverst, 2020/01/30

#read in the data
epc<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", strip.white=TRUE, blank.lines.skip=TRUE)

#convert date
epc[,1]<-as.Date(epc[,1],"%d/%m/%Y")

#reduce data
epc_sub <- epc[(epc[,1] >= "2007-02-01") & (epc[,1] <= "2007-02-02"),]

#make DateTime col
epc_sub$dateTime <- as.POSIXct(paste(epc_sub$Date, epc_sub$Time), format = "%Y-%m-%d %H:%M:%S")

#start plot
png("plot4.png", width=480, height=480)

#Split 2x2
par(mfrow=c(2,2))

#first plot
plot(epc_sub$dateTime, epc_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#second plot
plot(epc_sub$dateTime, epc_sub$Voltage, type="l", xlab="datetime", ylab="Voltage")

#third plot
plot(epc_sub$dateTime, epc_sub$Sub_metering_1, "l",xlab="",
    ylab="Energy sub metering")
lines(epc_sub$dateTime, epc_sub$Sub_metering_2, col="Red")
lines(epc_sub$dateTime, epc_sub$Sub_metering_3, col="Blue")
legend("topright"
       , col=c("black","red","blue")
       , names(epc_sub)[7:9]
       ,lty=c(1,1), lwd=c(1,1))

#fourth plot
plot(epc_sub$dateTime, epc_sub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

