setwd("D:/Workspace/R/Coursera 2020/04_Exploratory Data Analysis/week_1/git/ExData_Plotting1")

library(data.table)

data <- fread("data/filtered_household_power_consumption.csv", header = T, sep = ";", na.strings = "?")

#Add a column for Date and Time as a Date variable
data[, Date_Time := sprintf("%s %s", Date, Time)]
data[, Date_Time_formatted := strptime(Date_Time, format = "%d/%m/%Y %H:%M:%S")]

#Make the plot
Sys.setlocale(category = "LC_ALL", locale = "english") #this is to make sure the dates are shown in english

png("plot2.png", width = 480, height = 480)
with(data, plot(Date_Time_formatted, Global_active_power,
                type = "l",
                xlab = "",
                ylab = "Global Active Power (kilowatts)"))
dev.off()
