## Set the working directory
setwd ("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2")

## Load Libraries needed to generate the plots
library(ggplot2)
library(plyr)

## Read the data 
NEI <- readRDS("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2/summarySCC_PM25.rds")
SCC <- readRDS("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2/Source_Classification_Code.rds")

baltimore <- NEI[NEI["fips"] == "24510",]

emissionssumyr <- ddply(baltimore, "year", summarize, total = sum(Emissions))

png('Plot5.png')
plot(emissionssumyr, type = "l", xlab = "Year", 
        main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", 
        ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()
