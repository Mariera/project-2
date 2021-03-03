##comparison between motor vehicle emissions Baltimore City and Los Angeles
##county..which has a greater change over time

##subset NEIvehicleBAlti from plot5.R

NEIvehicleBalti<- subset(NEIvehicle_SCC, fips=="24510")
NEIvehicleBalti$city<- "Baltimore City"
NEIvehicle_LA<- subset(NEIvehicle_SCC, fips=="06037")
NEIvehicle_LA$city<- "Los Angeles County"
NEI_LA_Balti<- rbind(NEIvehicleBalti,NEIvehicle_LA)


##make the plot
png("plot6.png")

ggplot(NEI_LA_Balti, aes(x=year, y=Emissions, fill=city))+
  geom_bar(aes(fill=year),stat = "identity")+
  facet_grid(.~city)+
  guides(fill=FALSE)+ theme_light()+
  labs(x="year",y=expression("Total PM"[2.5]*"Emission(kilo-tons)"))+
  labs(title=expression("PM"[2.5]*"Motor Vehicle Source Emissions in Baltimore & L
                          A, 1999-2008"))

dev.off()
