


data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
# Set date format
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")
# Filter data
data_n<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")
# Convert string to numeric format
GAP<-suppressWarnings(as.numeric(data_n[,"Global_active_power"]))
# Make and save plot
png("plot1.png")
hist(GAP, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
