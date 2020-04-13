setwd("D:/Workspace/R/Coursera 2020/04_Exploratory Data Analysis/week_1/git/ExData_Plotting1")

library(data.table)

data <- fread("data/filtered_household_power_consumption.csv", header = T, sep = ";", na.strings = "?")

#Add a column for Date and Time as a Date variable
data[, Date_Time := sprintf("%s %s", Date, Time)]
data[, Date_Time_formatted := strptime(Date_Time, format = "%d/%m/%Y %H:%M:%S")]

#Make the plot
Sys.setlocale(category = "LC_ALL", locale = "english") #this is to make sure the dates are shown in english

png("plot3.png", width = 480, height = 480)
#1
with(data, plot(Date_Time_formatted, Sub_metering_1,
                type = "l",
                col = "black",
                xlab = "",
                ylab = "Energy sub metering"))
#2
with(data, lines(Date_Time_formatted, Sub_metering_2,
                 type = "l",
                 col = "red",
                 xlab = "",
                 ylab = "Energy sub metering"))
#3
with(data, lines(Date_Time_formatted, Sub_metering_3,
                 type = "l",
                 col = "blue",
                 xlab = "",
                 ylab = "Energy sub metering"))
#Legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
