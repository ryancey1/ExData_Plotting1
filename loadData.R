if(!any(.packages() == "lubridate")) {
        ## Check if lubridate is installed.
        if (!"lubridate" %in% installed.packages()) {
                suppressMessages(suppressWarnings(install.packages("lubridate")))
                suppressPackageStartupMessages(suppressWarnings(library(lubridate, verbose = FALSE)))
        }
        
        ## If installed, loads lubridate.
        else {
                suppressPackageStartupMessages(suppressWarnings(library(lubridate, verbose = FALSE)))
        }
}

data <- NULL
if (!dir.exists("data")) {
        dir.create("data")
}

dataset = "./data/household_power_consumption.txt"
if (!file.exists(dataset)) {
        url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        zip = "./exdata_data_household_power_consumption.zip"
        download.file(url, destfile = zip)
        unzip(zip, exdir = "./data/")
}

## read in first few rows to gather column classes
data <- read.table(
        dataset,
        header = TRUE,
        sep = ";",
        na.strings = "?",
        nrows = 10
)
colClasses <- sapply(data, class)

## read in full table with optimized read.table call
data <- read.table(
        dataset,
        header = TRUE,
        sep = ";",
        na.strings = "?",
        nrows = 3E6,
        comment.char = "",
        colClasses = colClasses
)

data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

# extract dates 2007-02-01 and 2007-02-02
dates <- data$Date == "2007-02-01" | data$Date == "2007-02-02"
data <- data[dates, ]

# clean up environment
rm(list = ls(pattern = "[^data]"))
