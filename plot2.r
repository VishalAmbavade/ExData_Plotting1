library(dplyr)

df <- read.table("household_power_consumption.txt", sep = ';', na.strings="?", header = T)

df$Date <- as.Date(df$Date, format = '%d/%m/%Y')

df2 <- df %>%
  filter(Date == '2007-02-01' | Date == '2007-02-02')

datetime <- paste(as.Date(df2$Date), df2$Time)
df2$Datetime <- as.POSIXct(datetime)

png('plot2.png', width = 480, height = 480)
plot(df2$Datetime, df2$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
