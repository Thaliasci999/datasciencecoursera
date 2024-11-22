# plot4.R
library(datasets)

# 读取数据
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7)))

# 转换日期和时间
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# 创建 plot4.png
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# 绘制第一个图
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", xaxt = "n")
axis(1, at=c(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-02"), as.POSIXct("2007-02-03")), labels=c("Thu", "Fri", "Sat"))

# 绘制第二个图
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(1, at=c(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-02"), as.POSIXct("2007-02-03")), labels=c("Thu", "Fri", "Sat"))

# 绘制第三个图
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
axis(1, at=c(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-02"), as.POSIXct("2007-02-03")), labels=c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

# 绘制第四个图
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power", xaxt = "n")
axis(1, at=c(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-02"), as.POSIXct("2007-02-03")), labels=c("Thu", "Fri", "Sat"))

dev.off()
