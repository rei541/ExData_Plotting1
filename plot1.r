
#read in the dataset
my_data <- read.delim(file="household_power_consumption.txt", header=TRUE, sep=";")

#filter data to the correct timepoints
my_data2<-filter(my_data,Date == "1/2/2007" | Date == "2/2/2007")

#open the png graphics device
png(filename="plot1.png", width = 480, height = 480)

#create the base histogram
hist(x=as.numeric(as.character(my_data2$Global_active_power)),
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red",
     ylim=c(0,1200),
     breaks=12
)

#change the x axis
axis(side=1, at=c(2,4,6), tick=TRUE)


#turn off the graphics device
dev.off()








