setwd("C:/Users/ASUS/Documents/ExData_Plotting1/exdata_data_NEI_data")
SCC <- readRDS("Source_Classification_Code.rds")
summarySCC <- readRDS("summarySCC_PM25.rds")
str(SCC)


#Subset Emissions, year data for SCCs related to motor vehicle in Baltimore
plot6_dt <- subset(summarySCC,
                   (fips == "24510" | fips == "06037") & type == "ON-ROAD",
                   select = c(Emissions, fips, year))

library(dplyr)
plot6 <- plot6_dt %>%
     group_by(year, fips) %>%
     summarize(Total_Emis_Coal = sum(Emissions))

#Plotting
library(ggplot2)
g <-ggplot(plot6, aes(year, Total_Emis_Coal, color = fips)) 

g + 
     geom_point() + 
     geom_line() + 
     labs(title = "Total Emissions from motor vehicles in LA and Baltimore") + 
     labs(y = "Total emissions (in tons)", x = "Year") +
     scale_colour_discrete(name = "City", labels = c("LA", "Baltimore"))

dev.copy(png, "plot6.png")
dev.off()