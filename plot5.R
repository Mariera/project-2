##change in emissions from motor vehicles

vehicle_SCC<- grepl(pattern = "vehicle",SCC$EI.Sector, ignore.case = TRUE)
vehicleSCC<- SCC[vehicle_SCC,]$SCC


##get the rows of interest from Baltimore data

NEIvehicle_SCC<- NEI[NEI$SCC %in%vehicleSCC,]
NEIvehicleBalt<- subset(NEIvehicle_SCC,fips=="24510")
totalem_NEIvehiclebalt<- aggregate(Emissions~year, NEIvehicleBalt,sum)

##make the plot
png("plot5.png")

g<- ggplot(aes(year, Emissions/10^5), data = totalem_NEIvehiclebalt)
g+geom_bar(stat = "identity", fill="grey", width = 0.70)+
  guides(fill=FALSE)+
  labs(x="year",y=expression("Total PM"[2.5]*"Emission(10^5tons)"))+
  labs(title = expression("PM"[2.5]*"Motor Source Emissions inBaltimore from 1999-2008"))


dev.off()
