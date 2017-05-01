#Extract file data and selecting the data only for 1/2/2007 and 2/2/2007 for plotting
data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data_new <-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])

#Transform date to Date format and create new variable with Date and Time joined
data_new$Date <- as.Date(data_new$Date,"%d/%m/%Y")

data_new<-cbind(data_new, "DateTime" = as.POSIXct(paste(data_new$Date, data_new$Time)))

#Save to PNG
png('Plot1.png', width = 480, height = 480 )

#Plotting Code for plot1
hist(as.numeric(data_new$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()