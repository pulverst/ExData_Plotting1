#Plotting Assignment 1 for Exploratory Data Analysis
#
#Script to create plot 2
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
png("plot2.png", width=480, height=480)

plot(epc_sub$dateTime, epc_sub$Global_active_power, "l",xlab="",
    ylab="Global Active Power (kilowatts)")

dev.off()

