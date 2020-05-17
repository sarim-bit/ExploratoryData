
# data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
# # Set date format
# data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")
# # Filter data
# data_n<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")
# Date-time format
date_time<-strptime(paste(sdata$Date,sdata$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )
# Convert string to numeric format
GAP<-as.numeric(data_n[,"Global_active_power"])
# Make and save plot
png("plot2.png")
plot(date_time,GAP,type = "l",main = "Global Active Power", xlab = " ",ylab = "Global Active Power (kilowatts)")
dev.off()