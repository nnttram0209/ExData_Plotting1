setwd("C:/Users/ASUS/Documents/ExData_Plotting1/exdata_data_NEI_data")
SCC <- readRDS("Source_Classification_Code.rds")
summarySCC <- readRDS("summarySCC_PM25.rds")
str(SCC)


#Subset Emissions, year data for SCCs related to motor vehicle in Baltimore
plot5_dt <- subset(summarySCC,
                   fips == "24510" & type == "ON-ROAD",
                   select = c(Emissions, year))

library(dplyr)
plot5 <- plot5_dt %>%
     group_by(year) %>%
     summarize(Total_Emis_Coal = sum(Emissions))

#Plotting
head(plot5)

library(ggplot2)
g <-ggplot(plot5, aes(year, Total_Emis_Coal)) 

g + 
     geom_point() + 
     geom_line() + 
     labs(title = "Total Emissions from motor vehicles in Baltimore") + 
     labs(y = "Total emissions (in tons)", x = "Year") 

dev.copy(png, "plot5.png")
dev.off()
