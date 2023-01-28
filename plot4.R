file_path <- "C:/Users/ASUS/Documents/ExData_Plotting1/exdata_data_household_power_consumption/household_power_consumption.txt"

#read the whole data
data_original <- read.table(file_path, header = TRUE, sep = ";", dec = ".")

#change the format of Date 
data_original$Date <- as.Date(data_original$Date, format = "%d/%m/%Y")

#subset the data based on the Date between 2007-02-01 and 2007-02-02
dt <- subset(data_original, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

#Create a new variable that combine Date and Time
datetime <- paste(dt$Date, dt$Time)
dt$Datetime <- datetime
dt$Datetime <- as.POSIXct(dt$Datetime, format = "%Y-%m-%d %H:%M:%S") #Change format of Datetime column

#Plotting
par(mfrow = c(2,2))
with(dt, plot(Datetime, Global_active_power, type = "l", xlab ="", ylab = "Global Active Power"))
with(dt, plot(Datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(dt, plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
     lines(dt$Datetime, dt$Sub_metering_2, col = "red")
     lines(dt$Datetime, dt$Sub_metering_3, col = "blue")
     legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2, bty = "n", cex = 0.8,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(dt, plot(Datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power"))

