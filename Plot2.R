# plot2.R
library(datasets)

# 读取数据
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7)))

# 转换日期和时间
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# 创建 plot2.png
png("plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis(1, at=c(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-02"), as.POSIXct("2007-02-03")), labels=c("Thu", "Fri", "Sat"))
dev.off()

