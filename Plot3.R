#Extract file data and selecting the data only for 1/2/2007 and 2/2/2007 for plotting
data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data_new <-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])

#Transform date to Date format and create new variable with Date and Time joined
data_new$Date <- as.Date(data_new$Date,"%d/%m/%Y")
data_new<-cbind(data_new, "DateTime" = as.POSIXct(paste(data_new$Date, data_new$Time)))

#Save to PNG
png('Plot3.png', width = 480, height = 480 )

#Plotting Code for plot3
with(data_new, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})
lines(data_new$Sub_metering_2 ~ data_new$DateTime, col = 'Red')
lines(data_new$Sub_metering_3 ~ data_new$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()