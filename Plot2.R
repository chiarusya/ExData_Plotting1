#Extract file data and selecting the data only for 1/2/2007 and 2/2/2007 for plotting
data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data_new <-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])

#Transform date to Date format and create new variable with Date and Time joined
data_new$Date <- as.Date(data_new$Date,"%d/%m/%Y")
data_new<-cbind(data_new, "DateTime" = as.POSIXct(paste(data_new$Date, data_new$Time)))

#Save to PNG
png('Plot2.png', width = 480, height = 480 )

#Plotting Code for plot2
plot(data_new$Global_active_power ~ data_new$DateTime, type="l", xlab= "", ylab="Global Active Power (kilowatts)")

dev.off()