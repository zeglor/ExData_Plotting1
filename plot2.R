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

png(
    "plot2.png",
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

dev.off()
