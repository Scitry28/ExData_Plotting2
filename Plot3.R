## Set the working directory
setwd ("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2")

## Load Libraries needed to generate the plots
library(ggplot2)
library(plyr)

## Read the data 
NEI <- readRDS("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2/summarySCC_PM25.rds")
SCC <- readRDS("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2/Source_Classification_Code.rds")

length(NEI$Emissions)
length(NEI$year)

## Build the subsets needed for the plot
baltimore <- subset(NEI, fips == "24510")
type.PM25yr <- ddply(baltimore, .(year, type), function(x) sum(x$Emissions))

## Change the column headings
colnames(type.PM25yr)[3] <-"emissions"

## Prepare the plot file


png("plot3.png")
qplot(year, emissions, data=type.PM25yr, color=type, geom ="line") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ 
    "Emmission by source, type and year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))
dev.off()


## Nonpoint (green line): 
## sharply decreased from 1999 to 2002. 
## steady state  from 2002 to ## 2005 at  1,500.
## decrease occurred between 2005 and 2008 below 1,500 


## Point (purple line): 
## slight increase from 1999 to 2002. 
## sharp increase in emissions from 2002 to 2005.
## sharp decrease from  2005 to 2008.

## Onroad (blue line):
## slight decrease from 1999 to 2002.
## steady from 2002 to 2005 and continued this trend from 2005 to 2008. 

## Nonroad (red line): 
## followed the similar path as the onroad values with  slightly higher
## emission values. 
## slightly decreased from 1999 to 2002.
## steady from 2002 to 2005 
## slight decrease from  2005 to 2008.








