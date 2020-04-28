
#read in the dataset
my_data <- read.delim(file="household_power_consumption.txt", header=TRUE, sep=";")


#filter data to the correct timepoints
my_data1<-filter(my_data,Date == "1/2/2007")
my_data2<-filter(my_data,Date == "2/2/2007")


#sort by time
my_data1a<-arrange(my_data1, Time)
my_data2a<-arrange(my_data2, Time)


#add a sequental variable
my_data1a$n<-seq(1,nrow(my_data1a))
my_data2a$n<-seq(1441,2880)


#add the two dates together
my_data3<-rbind(my_data1a, my_data2a)


#open the png graphics device
png(filename="plot4.png", width = 480, height = 480)


#adjust the settings to display 4 plots
par(mfrow=c(2,2))


#create the first plot
plot(x=my_data3$n, y=as.numeric(as.character(my_data3$Global_active_power)), xaxt = "n",
     type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
axis(side=1, at=c(0,1441,2881), tick=TRUE, labels=c("Thurs", "Fri","Sat"))


#create the second plot
plot(x=my_data3$n, y=as.numeric(as.character(my_data3$Voltage)), xaxt = "n",
     type="l",
     xlab="datetime", ylab="Voltage")
axis(side=1, at=c(0,1441,2881), tick=TRUE, labels=c("Thurs", "Fri","Sat"))


#create the third plot
plot(x=my_data3$n, y=as.numeric(as.character(my_data3$Sub_metering_1)), xaxt = "n",
     type="l",
     xlab="", ylab="Energy sub metering")
lines(x=my_data3$n, y=as.numeric(as.character(my_data3$Sub_metering_2)),
      type="l",
      col="red")
lines(x=my_data3$n, y=as.numeric(as.character(my_data3$Sub_metering_3)),
      type="l",
      col="blue")
axis(side=1, at=c(0,1441,2881), tick=TRUE, labels=c("Thurs", "Fri","Sat"))
legend("topright", col=c("black","red","blue"), lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#create the fourth plot
plot(x=my_data3$n, y=as.numeric(as.character(my_data3$Global_reactive_power)), xaxt = "n",
     type="l",
     xlab="datetime", ylab="Global_reactive_power")
axis(side=1, at=c(0,1441,2881), tick=TRUE, labels=c("Thurs", "Fri","Sat"))


#turn off the graphics device
dev.off()