
library(data.table)
library(dplyr)

######### Download data, unzip it, and retrieve tables from main folder

#hide or unhide the download file and unzip commands as needed, files download and unzip to working directory.

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","exdata%2Fdata%2Fhousehold_power_consumption.zip")
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")

# Read in data
data <- tbl_df(fread("household_power_consumption.txt",na.strings="?"))

data$date_time <- as.POSIXct(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S ")

data$Date <- as.Date(data$Date,"%d/%m/%Y")
#data$Time <- strptime(data$Time,format = "%H:%M:%S")

sub_data <- filter(data,Date == "2007-02-01" | Date == "2007-02-02")

png("plot1.png",width = 480,height = 480)
hist(sub_data$Global_active_power,col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()