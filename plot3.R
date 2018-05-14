
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

#plot 1
#hist(sub_data$Global_active_power,col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#plot 2
#plot(x = sub_data$date_time,y= sub_data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#plot 3
plot(x = sub_data$date_time,y= sub_data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(x=sub_data$date_time,y= sub_data$Sub_metering_2,type = "l", col = "red")
lines(x=sub_data$date_time,y= sub_data$Sub_metering_3,type = "l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),y.intersp = 1)
