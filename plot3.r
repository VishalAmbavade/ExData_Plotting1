library(dplyr)

df <- read.table("household_power_consumption.txt", sep = ';', na.strings="?", header = T)

df$Date <- as.Date(df$Date, format = '%d/%m/%Y')

df2 <- df %>%
  filter(Date == '2007-02-01' | Date == '2007-02-02')

datetime <- paste(as.Date(df2$Date), df2$Time)
df2$Datetime <- as.POSIXct(datetime)

png('plot3.png', width = 480, height = 480)

with(df2, plot(Datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(df2, lines(Datetime, Sub_metering_1, col = "black"))
with(df2, lines(Datetime, Sub_metering_2, col = "red"))
with(df2, lines(Datetime, Sub_metering_3, col = 'blue'))
legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
