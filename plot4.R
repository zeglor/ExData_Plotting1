setwd("F:/programming/R/coursera_r/exploratory_analysis/ExData_Plotting1/")

Sys.setlocale("LC_TIME", "English United States")
f <- read.table(
        "data/household_power_consumption.txt", 
        sep=";",
        nrows=-1,
        na.strings = "?",
        header = TRUE
)

f$Date <- as.Date(strptime(f$Date, format = '%d/%m/%Y'))
fsub <- subset(f, Date >= '2007-02-01' & Date <= '2007-02-02')

fsub$Datetime <- strptime(paste(fsub$Date, fsub$Time), format = '%Y-%m-%d %H:%M:%S')

par(mfrow = c(2,2))

png(
    "plot4.png",
    width = 480,
    height = 480
    )

plot(
    fsub$Datetime, 
    fsub$Global_active_power,
    type="l",
    ylab = "Global Active Power (kilowatts)",
    xlab = ""
)

plot(
    fsub$Datetime, 
    fsub$Voltage,
    type="l",
    ylab = "Voltage",
    xlab = ""
)


plot(
    fsub$Datetime, 
    fsub$Sub_metering_1,
    type="l",
    ylab = "Energy sub metering",
    xlab = "",
    col = "black"
)

lines(
    fsub$Datetime,
    fsub$Sub_metering_2,
    col = "red"
    )

lines(
    fsub$Datetime,
    fsub$Sub_metering_3,
    col = "blue"
)

legend(
    "topright", 
    c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
    lty = c(1,1,1),
    col = c("black", "red", "blue"),
    #y.intersp = 0.85,
    cex = 0.8
)

plot(
    fsub$Datetime, 
    fsub$Global_reactive_power,
    type="l",
    ylab = "Global_reactive_power",
    xlab = "datetime"
)

dev.off()
