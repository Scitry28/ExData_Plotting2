## Set the working directory
setwd ("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2")

## Load Libraries needed to generate the plots
library(ggplot2)
library(plyr)

## Read the data 
NEI <- readRDS("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2/summarySCC_PM25.rds")
SCC <- readRDS("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2/Source_Classification_Code.rds")


subsetNEI <- NEI[NEI$fips == "24510" | NEI$fips == "06037",]

motorSources <- SCC[grepl("*Vehicles", scc$EI.Sector),]
motorNEI <- subsetNEI[subsetNEI$SCC %in% motorSources$SCC,]

emissionsByYear <- ddply(motorNEI, c("year", "fips"), summarise, total = sum(Emissions))

emissionsByYear$city <- ifelse(emissionsByYear$fips == "24510", "Baltimore", "Los Angeles")




##qplot(year, Emissions, data=tmveYR.county, geom="line", color=county) + ggtitle(expression("Motor Vehicle Emission Levels" ~ PM[2.5] ~ "  from 1999 to 2008 in Los Angeles County, CA and Baltimore, MD")) + xlab("Year") + ylab(expression("Levels of" ~ PM[2.5] ~ " Emissions"))
##dev.off(

png("Plot6.png")
qplot(x      = year,
      xlab   = "Year",
      y      = total,
      ylab   = "Total Emissions",
      data   = emissionsByYear,
      geom   = "line",
      color  = city) + ggtitle(expression("                    Motor Vehicle Emission Levels from\n     1999 to 2008 in Los Angeles County, CA and Baltimore, MD")) 
dev.off()