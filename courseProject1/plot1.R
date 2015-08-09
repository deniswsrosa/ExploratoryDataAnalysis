
plot1 <- function() {
  
  filePath <- "household_power_consumption.txt"
  data <- read.table(filePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  interval <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  activePowerInterval <- as.numeric(interval$Global_active_power)
  png("plot1.png", width=480, height=480)
  hist(activePowerInterval, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()  
  
  
}