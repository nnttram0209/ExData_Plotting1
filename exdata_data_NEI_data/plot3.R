setwd("C:/Users/ASUS/Documents/ExData_Plotting1/exdata_data_NEI_data")
SCC <- readRDS("Source_Classification_Code.rds")
summarySCC <- readRDS("summarySCC_PM25.rds")

#Subset Emissions, type and year data for Baltimore City only
Bal_City <- subset(summarySCC, fips == "24510", select = Emissions:year)

#Create a table which summarize the total of Emissions for each pair of type & year
library(dplyr)
plotBC <- Bal_City %>%
     group_by(type, year) %>%
     summarize(Total_Emis_BC = sum(Emissions))


#Plotting
library(ggplot2)
qplot(year, Total_Emis_BC, data = plotBC, geom = c("point", "line"), col = type, 
      main = "Total Emissions in Baltimore City from 1999-2008 for each type of sources", 
      ylab = "Total Emissions (in tons)")
     

dev.copy(png, "plot3.png")
dev.off()