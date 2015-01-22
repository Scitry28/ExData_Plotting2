## Set the working directory
setwd ("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2")
## Read the data 
NEI <- readRDS("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2/summarySCC_PM25.rds")
SCC <- readRDS("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2/Source_Classification_Code.rds")

length(NEI$Emissions)
length(NEI$year)

## Build the subsets needed for the plot
baltimore <- subset(NEI, fips == "24510")
tot.PM25yr <- tapply(baltimore$Emissions,  baltimore$year, sum)
## Prepare the plot file


png("plot2.png")
plot(names(tot.PM25yr), tot.PM25yr, type = "l", xlab="Year", ylab= expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
     main=expression("Total for Baltimore City" ~ PM[2.5] ~ "Emissions by Year"), col = "blue")
dev.off()

## The data indicates a sharp decline between 1999 and 2002. A sharp increase from from 2002 to 2005. 
## Sharp decrease occurred from 2005 to 2008.