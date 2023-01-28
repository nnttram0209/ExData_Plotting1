file_path <- "C:/Users/ASUS/Documents/ExData_Plotting1/exdata_data_household_power_consumption/household_power_consumption.txt"
#Check for the object size
object.size(file_path)

#read the whole data
data_original <- read.table(file_path, header = TRUE, sep = ";", dec = ".")

#change the format of Date 
data_original$Date <- as.Date(data_original$Date, format = "%d/%m/%Y")

#subset the data based on the Date between 2007-02-01 and 2007-02-02
dt <- subset(data_original, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

#Create plot 
GAP <- as.numeric(dt$Global_active_power)
hist(GAP, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))
dev.copy(png, "plot1.png", width = 480, height=480)
dev.off()


