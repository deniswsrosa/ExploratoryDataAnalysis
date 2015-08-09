
plot2 <- function() {

  #loading and subseting the data
  filePath  <- "household_power_consumption.txt"
  data <- read.table(filePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  
  twoDays <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  timeInterval <- strptime(paste(twoDays$Date, twoDays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  globalActivePower <- as.numeric(twoDays$Global_active_power)
  
  png("plot2.png", width=480, height=480)
  plot(timeInterval, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
  
}