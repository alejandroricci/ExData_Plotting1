setwd("D:/Workspace/R/Coursera 2020/04_Exploratory Data Analysis/week_1/git/ExData_Plotting1")

library(data.table)

data <- fread("data/filtered_household_power_consumption.csv", header = T, sep = ";", na.strings = "?")

#Add a column for Date and Time as a Date variable
data[, Date_Time := sprintf("%s %s", Date, Time)]
data[, Date_Time_formatted := strptime(Date_Time, format = "%d/%m/%Y %H:%M:%S")]

#Make the plot
Sys.setlocale(category = "LC_ALL", locale = "english") #this is to make sure the dates are shown in english

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) #make the final plot out of 2x2 subplots
with(data, {
    ################-
    #### PLOT 1 ####
    ################-
    plot(Date_Time_formatted, Global_active_power,
         type = "l",
         xlab = "",
         ylab = "Global Active Power")
    ################-
    #### PLOT 2 ####
    ################-
    plot(Date_Time_formatted, Voltage,
         type = "l",
         xlab = "datetime",
         ylab = "Voltage")
    ################-
    #### PLOT 3 ####
    ################-
    plot(Date_Time_formatted, Sub_metering_1,
         type = "l",
         col = "black",
         xlab = "",
         ylab = "Energy sub metering")
    lines(Date_Time_formatted, Sub_metering_2,
          type = "l",
          col = "red",
          xlab = "",
          ylab = "Energy sub metering")
    lines(Date_Time_formatted, Sub_metering_3,
          type = "l",
          col = "blue",
          xlab = "",
          ylab = "Energy sub metering")
    #Legend
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           bty = "n")
    ################-
    #### PLOT 4 ####
    ################-
    plot(Date_Time_formatted, Global_reactive_power,
         type = "l",
         xlab = "datetime",
         ylab = "Global_reactive_power")
})
dev.off()
