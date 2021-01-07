# load data
source("loadData.R")

png(
        filename = "plot3.png",
        width = 480,
        height = 480,
        units = "px",
        bg = "transparent"
)

plot(
        data$Time,
        data$Sub_metering_1,
        type = "n",
        xlab = "",
        ylab = "Energy sub metering"
)

points(data$Time,
       data$Sub_metering_1,
       col = "black",
       type = "l")

points(data$Time,
       data$Sub_metering_2,
       col = "red",
       type = "l")

points(data$Time,
       data$Sub_metering_3,
       col = "blue",
       type = "l")

legend(
        "topright",
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty = 1,
        col = c("black", "red", "blue")
)

dev.off()
