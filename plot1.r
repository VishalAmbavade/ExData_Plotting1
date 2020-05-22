library(dplyr)

setwd("D:\\Programming\\John Hopkins\\John_Hopkins_Data_Science\\4. Exploratory Data Analysis\\Week 1\\")

df <- read.table("household_power_consumption.txt", sep = ';', na.strings="?", header = T)

df$Date <- as.Date(df$Date, format = '%d/%m/%Y')

df2 <- df %>%
  filter(Date == '2007-02-01' | Date == '2007-02-02')

df2$Time <- format(strptime(df2$Time, "%H:%M:%S"),"%H:%M:%S")

df2$Global_active_power <- as.numeric(df2$Global_active_power)

png("plot1.png", width = 480, height = 480)

hist(df2$Global_active_power, col = 'red',  xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

dev.off()

