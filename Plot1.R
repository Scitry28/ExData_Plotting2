## Set the working directory
setwd ("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2")
## Read the data 
NEI <- readRDS("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2/summarySCC_PM25.rds")
SCC <- readRDS("~/Classfiles/Exploratory Data Analysis/ExData_Plotting2/Source_Classification_Code.rds")

length(NEI$Emissions)
length(NEI$year)

## Prepare the plot file

tot.PM25yr <- tapply(NEI$Emissions,  NEI$year, sum)
png("plot1.png")
plot(names(tot.PM25yr), tot.PM25yr, type="l", xlab = "Year", ylab = expression
     ("Total" ~ PM[2.5] ~"Emissions (tons)"), main = expression("Total US" ~ 
     PM[2.5] ~ "Emissions by Year"), col="Purple") 
dev.off()