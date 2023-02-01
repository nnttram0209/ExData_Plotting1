setwd("C:/Users/ASUS/Documents/ExData_Plotting1/exdata_data_NEI_data")
SCC <- readRDS("Source_Classification_Code.rds")
summarySCC <- readRDS("summarySCC_PM25.rds")
str(SCC)

#Create a vector which contains only SCC codes related to "coal"
i <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
SCC_Coal <- SCC$SCC[i]

#Subset Emissions, year data for SCCs related to coal combustion
plot4_dt <- subset(summarySCC, SCC %in% SCC_Coal, select = c(Emissions, year))

library(dplyr)
plot4 <- plot4_dt %>%
     group_by(year) %>%
     summarize(Total_Emis_Coal = sum(Emissions))

g <-ggplot(plot4, aes(year, Total_Emis_Coal)) 

g + geom_point() + geom_line() + labs(title = "Total Emissions from coal combustion-related sources") + labs(y = "Total emissions (in tons)", x = "Year")

dev.copy(png, "plot4.png")
dev.off()
