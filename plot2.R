library(readr)

epc <- read_delim("household_power_consumption.txt",
                  delim = ";",
                  col_types = cols(Date = col_date(format = "%d/%m/%Y"), Time = col_time(format = "%H:%M:%S")),
                  na = "?")

p1dat <- subset( epc , Date == "2007-02-01" | Date == "2007-02-02" )

png(filename = "plot2.png")

plot(as.POSIXct(paste(p1dat$Date, p1dat$Time), format="%Y-%m-%d %H:%M:%S"),
     p1dat$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()