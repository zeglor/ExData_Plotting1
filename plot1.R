setwd("F:/programming/R/coursera_r/exploratory_analysis/ExData_Plotting1/")

f <- read.table(
        "data/household_power_consumption.txt", 
        sep=";",
        nrows=-1,
        na.strings = "?",
        header = TRUE
)

f$Date <- as.Date(strptime(f$Date, format = '%d/%m/%Y'))
fsub <- subset(f, Date >= '2007-02-01' & Date <= '2007-02-02')

png(
    "plot1.png",
    width = 480,
    height = 480
    )

hist(
    fsub$Global_active_power,
    main = "Global Active Power",
    xlab="Global Active Power (kilowatts)",
    ylab = "Frequency",
    col="red")

dev.off()
