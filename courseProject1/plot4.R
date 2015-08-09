
plot4 <- function() {
  
  #loading and subseting the data
  filePath <- "household_power_consumption.txt"
  data <- read.table(filePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  twoDays <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  timeInterval <- strptime(paste(twoDays$Date, twoDays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  
  globalActivePower <- as.numeric(twoDays$Global_active_power)
  globalReactivePower <- as.numeric(twoDays$Global_reactive_power)
  voltage <- as.numeric(twoDays$Voltage)
  
  subMet1 <- as.numeric(twoDays$Sub_metering_1)
  subMet2 <- as.numeric(twoDays$Sub_metering_2)
  subMet3 <- as.numeric(twoDays$Sub_metering_3)
  
  
  png("plot4.png", width=480, height=480)
  par(mfrow = c(2, 2)) 
  
  #Graph1
  plot(timeInterval, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
  
  #Graph2
  plot(timeInterval, voltage, type="l", xlab="datetime", ylab="Voltage")
  
  #Graph3
  plot(timeInterval, subMet1, type="l", ylab="Energy Submetering", xlab="")
  #labeling
  lines(timeInterval, subMet2, type="l", col="red")
  lines(timeInterval, subMet3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
  
  #Graph4
  plot(timeInterval, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
  
}