library(readr)

epc <- read_delim("household_power_consumption.txt",
                  delim = ";",
                  col_types = cols(Date = col_date(format = "%d/%m/%Y"), Time = col_time(format = "%H:%M:%S")),
                  na = "?")

p1dat <- subset( epc , Date == "2007-02-01" | Date == "2007-02-02" )

png(filename = "plot1.png")

hist(p1dat$Global_active_power, col = "red", xlab = "Global Active Power (in kilowatts)" , main = "Global Active Power")

dev.off()