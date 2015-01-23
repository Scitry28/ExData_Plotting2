## Set the working directory
setwd ("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2")

## Load Libraries needed to generate the plots
library(ggplot2)

## Read the data 
NEI <- readRDS("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2/summarySCC_PM25.rds")
SCC <- readRDS("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2/Source_Classification_Code.rds")


## Build the subsets needed for the plot selecting only coal combustion

SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

## Merge the datasets

merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)

## Change the column headings
colnames(merge.sum) <- c('Year', 'Emissions')


## Prepare the plot file 

png("plot4.png")

ggplot(merge.sum, aes(Year, Emissions)) +
      geom_line() + geom_point() +
       labs(title = "Total Emissions from Coal Combustion-Related\n Sources from 1999 to 2008",
         x = "Year", y = "Total Emissions")


dev.off()


