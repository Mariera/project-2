##according to the types which have sen decreases and increases

##load the NEI & SCC data frames into r

NEI<- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("source_Classification_Code.rds")


##make a plot using ggplot

library(ggplot2)
png("plot3.png") 


g<- ggplot(aes(x=year, y=Emissions, fill=type), data = baltNEI)
g+geom_bar(stat = "identity")+facet_grid(.~type)+
  labs(x="year",y=expression("Total PM"[2.5]*" Emission (Tons)"))+
  labs(title = expression("PM"[2.5]*"Emissions, Baltimore City 1999-2008 by Source Type"))+
  guides(fill=FALSE)

dev.off()
