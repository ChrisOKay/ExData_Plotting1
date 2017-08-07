library(readr)
household <- read_csv2("household_power_consumption.txt", na = "?",
                       col_type= cols(
                           Date = col_character(),
                           Time = col_character(),
                           Global_active_power = col_number(),
                           Global_reactive_power = col_number(),
                           Voltage = col_number(),
                           Global_intensity = col_number(),
                           Sub_metering_1 = col_number(),
                           Sub_metering_2 = col_number(),
                           Sub_metering_3 = col_number()
                       ))

household <- household[household$Date == "1/2/2007" | household$Date == "2/2/2007",]

png("plot3.png")


fullTime <- as.POSIXct(paste(household$Date, household$Time), format="%d/%m/%Y %H:%M:%S")

plot(fullTime, household$Sub_metering_1/1000, type="n",
     ylab = "Energy sub metering",
     xlab = "")

lines(fullTime, household$Sub_metering_1/1000, col="black")
lines(fullTime, household$Sub_metering_2/1000, col="red")
lines(fullTime, household$Sub_metering_3/1000, col="blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty=c(1,1,1))

dev.off()
