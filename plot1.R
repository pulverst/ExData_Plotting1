#Plotting Assignment 1 for Exploratory Data Analysis
#
#Script to create plot 1
#pulverst, 2020/01/28

#read in the data
epc<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", strip.white=TRUE, blank.lines.skip=TRUE)

#convert date
epc[,1]<-as.Date(epc[,1],"%d/%m/%Y")

#reduce data
epc_sub <- epc[(epc[,1] >= "2007-02-01") & (epc[,1] <= "2007-02-02"),]

#start plot
png("plot1.png", width=480, height=480)

hist(epc_sub$Global_active_power, main="Global Active Power", 
  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()

