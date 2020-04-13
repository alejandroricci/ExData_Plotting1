setwd("D:/Workspace/R/Coursera 2020/04_Exploratory Data Analysis/week_1/git/ExData_Plotting1/data")

library(data.table)

data <- fread("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#Filter data to keep just the days im going to use
filtered_data <- data[Date %in% c("1/2/2007", "2/2/2007")]

write.table(filtered_data, file = "filtered_household_power_consumption.csv", col.names = T, row.names = F, sep = ";", quote = T, na = "?")
