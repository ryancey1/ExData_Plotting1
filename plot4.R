# plot4.R -----------------------------------------------------------------
# This R script produces a 2 x 2 plot consisting of the plot2.R and plot3.R
# outputs, as well as a line plot demonstrating Voltage use over two days, and a
# line plot displaying household global minute-averaged reactive power (in
# kilowatt) over the same two days.
#  ------------------------------------------------------------------------

# load data
source("loadData.R")

# initialize graphics file
png(
        filename = "plot4.png",
        width = 480,
        height = 480,
        units = "px",
        bg = "transparent"
)

# set parameters for layout
par(mfrow = c(2, 2))

## upper-left ----------------------
plot(
        data$Time,
        data$Global_active_power,
        type = "l",
        xlab = "",
        ylab = "Global Active Power"
)

## upper-right ----------------------
plot(
        data$Time,
        data$Voltage,
        xlab = "datetime",
        ylab = "Voltage",
        type = "l"
)

## lower-left ----------------------
plot(
        data$Time,
        data$Sub_metering_1,
        type = "n",
        xlab = "",
        ylab = "Energy sub metering"
)

points(
        data$Time,
        data$Sub_metering_1,
        col = "black",
        type = "l"
)

points(
        data$Time,
        data$Sub_metering_2,
        col = "red",
        type = "l"
)

points(
        data$Time,
        data$Sub_metering_3,
        col = "blue",
        type = "l"
)

legend(
        "topright",
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty = 1,
        col = c("black", "red", "blue"),
        bty = "n"
)

## lower-right ----------------------
plot(
        data$Time,
        data$Global_reactive_power,
        xlab = "datetime",
        ylab = "Global_reactive_power",
        type = "l"
)

dev.off()
