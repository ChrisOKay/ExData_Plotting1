library(readr)
household <- read_csv2("household_power_consumption.txt", na = "?",
                       col_type= cols(
                           Date = col_character(),
                           Time = col_time(format = ""),
                           Global_active_power = col_number(),
                           Global_reactive_power = col_number(),
                           Voltage = col_number(),
                           Global_intensity = col_number(),
                           Sub_metering_1 = col_number(),
                           Sub_metering_2 = col_number(),
                           Sub_metering_3 = col_number()
                       ))

household <- household[household$Date == "1/2/2007" | household$Date == "2/2/2007",]

png("plot1.png")

hist(household$Global_active_power/1000, col="red",
     main ="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.off()