# plot2.R -----------------------------------------------------------------
# This R Script produces a scatter plot of household global minute-averaged
# active power (in kilowatt) over a period of 2 days (02/01/2007 - 02/02/2007).
# -------------------------------------------------------------------------

# load data
source("loadData.R")

# initialize graphics file
png(
        filename = "plot2.png",
        width = 480,
        height = 480,
        units = "px",
        bg = "transparent"
)

plot(
        data$Time,
        data$Global_active_power,
        type = "l",
        xlab = "",
        ylab = "Global Active Power (kilowatts)"
)

dev.off()
