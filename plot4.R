##change in emissions from coal combustion-related sources from 1999-2008
##Across the United States.


NEI<- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("source_Classification_Code.rds")

##assuming that coal combustion related are those that contain the substring
##coal

combs_SCC<- grepl(pattern = "comb", SCC$SCC.Level.One, ignore.case = TRUE)
coal_SCC<- grepl(pattern = "coal",SCC$SCC.Level.Four, ignore.case = TRUE)

##extracting SCC

combs_SCCS<- SCC[combs_SCC & coal_SCC,]$SCC
coalcombsvaluesNEI<- NEI[NEI$SCC %in% combs_SCCS,]
Totalem_coalcombs<- aggregate(Emissions~year, coalcombsvaluesNEI, sum)


##make the plot
png("plot4.png")


g<- ggplot(aes(year, Emissions/10^5), data = coalcombsvaluesNEI)
g+geom_bar(stat = "identity", fill="grey", width = 0.70)+
  guides(fill=FALSE)+
  labs(x="year",y=expression("Total PM"[2.5]*"Emission(10^5 tons)"))+
  labs(title = expression("PM"[2.5]*"Coal Combustion Source Emissions Across US from 1999-2008"))
dev.off()











