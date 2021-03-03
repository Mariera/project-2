##Have the total emissions declined in the Baltimore city,Maryland (fips="24510")
##from 1999 to 2008?

##load the NEI & SCC data frames into r

NEI<- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("source_Classification_Code.rds")

##subset data from fips="24510"

baltNEI<- subset(NEI,fips=="24510")

##aggregate them by summing the emissions per year

emissions_baltNEI<- aggregate(Emissions~year, baltNEI,sum)
emissions_baltNEI

##make the plot


png("plot2.png")

barplot((emissions_baltNEI$Emissions)/10^6,
        names.arg = emissions_baltNEI$year,xlab = "year",
        ylab = "PM2.5 Emissions(10^6 tons)",
        main = "Total PM2.5 Emissions From All Baltimore City sources",
        col = "magenta"
        )
##switch off gdevice

dev.off()





