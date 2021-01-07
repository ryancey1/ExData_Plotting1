# plot1.R -----------------------------------------------------------------
# This R Script produces a histogram of household global minute-averaged active
# power (in kilowatts).
# -------------------------------------------------------------------------

# load data
source("loadData.R")

# initialize graphics file
png(
        filename = "plot1.png",
        width = 480,
        height = 480,
        units = "px",
        bg = "transparent"
)

hist(
        data$Global_active_power,
        col = "red",
        xlab = "Global Active Power (kilowatts)",
        main = "Global Active Power"
)

dev.off()
