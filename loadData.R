# loadData.R ------------------------------------------------------------- 
# This helper code is used to reduce code redundancy in all 4 plot.R codes. When
# it is sourced, the script checks for the data set and downloads/extracts it if
# necessary. Then, it subsets only the portion of the data we're interested in
# before formatting it so dates/times can be probed for further analysis.
#  ------------------------------------------------------------------------

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
zip = "./exdata_data_household_power_consumption.zip"

# check if zip has been downloaded/extracted
if (!file.exists(dataset) & !file.exists(zip)) {
        url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, destfile = zip)
        unzip(zip, exdir = "./data/")
} else if (!file.exists(dataset) & file.exists(zip))
        # only extract if zip was already downloaded
        unzip(zip, exdir = "./data/")

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

# extract rows with dates between 2007-02-01 and 2007-02-02
dates <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
data <- data[dates, ]

# format the data in those rows for graphing purposes
data$Time <- paste(data$Date, data$Time, sep = " ")
data$Date <- dmy(data$Date)
data$Time <- dmy_hms(data$Time)

# clean up environment
rm(list = ls(pattern = "[^data]"))
