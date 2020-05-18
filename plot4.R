library(readr)

epc <- read_delim("household_power_consumption.txt",
                  delim = ";",
                  col_types = cols(Date = col_date(format = "%d/%m/%Y"), Time = col_time(format = "%H:%M:%S")),
                  na = "?")

p1dat <- subset( epc , Date == "2007-02-01" | Date == "2007-02-02" )

png(filename = "plot4.png")

par(mfrow = c(2,2))

plot(as.POSIXct(paste(p1dat$Date, p1dat$Time), format="%Y-%m-%d %H:%M:%S"),
     p1dat$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

plot(as.POSIXct(paste(p1dat$Date, p1dat$Time), format="%Y-%m-%d %H:%M:%S"),
     p1dat$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")


plot(     as.POSIXct(paste(p1dat$Date, p1dat$Time), format="%Y-%m-%d %H:%M:%S")  ,  p1dat$Sub_metering_1, type = "l",
          col = "black"  ,   xlab = "",   ylab = "Energy sub metering")

lines(as.POSIXct(paste(p1dat$Date, p1dat$Time), format="%Y-%m-%d %H:%M:%S") ,  p1dat$Sub_metering_2, type = "l", col = "green")
lines(as.POSIXct(paste(p1dat$Date, p1dat$Time), format="%Y-%m-%d %H:%M:%S") ,  p1dat$Sub_metering_3, type = "l", col = "blue")

legend("topright",lty = 1 , col = c("black","green","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

plot(as.POSIXct(paste(p1dat$Date, p1dat$Time), format="%Y-%m-%d %H:%M:%S"),
     p1dat$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

