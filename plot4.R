data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
# Set date format
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")
# Filter data
data_n<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")
# Date-time format
date_time<-strptime(paste(sdata$Date,sdata$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )

# Convert string to numeric format
GAP<-as.numeric(data_n[,"Global_active_power"])
sub1<-as.numeric(data_n[,"Sub_metering_1"])
sub2<-as.numeric(data_n[,"Sub_metering_2"])
sub3<-as.numeric(data_n[,"Sub_metering_3"])
GRP <- as.numeric(sdata[,"Global_reactive_power"])
Volt <- as.numeric(sdata[,"Voltage"])

# Make and save plots
png("plot4.png")
par(mfrow = c(2,2))

# Plot 1
plot(date_time,GAP,type = "l", xlab = " ",ylab = "Global Active Power (kilowatts)")

# Plot 2
plot(date_time,Volt,type = "l",xlab = "datetime",ylab = "Voltage")

# Plot 3
plot(date_time,sub1,col = "black",type = "l", xlab = " ", ylab = "Energy sub metering")
lines(date_time, sub2, col = "red")
lines(date_time, sub3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))

# Plot 4
plot(date_time,GRP,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()