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

#Plot
with(dt, plot(Datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()