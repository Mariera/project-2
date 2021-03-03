##check if the files exist if not create,
##then download the data frames and unzip the files

if(!(file.exists("summarySCC_PM25.rds")&&
   file.exists("source_Classification_Code.rds"))) {
     
     
     dataFile<- "NEI_data.zip"
     if(!file.exists(dataFile)){
       
       dataURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
       download.file(url =dataURL,destfile = dataFile, method = "curl")
     }
     
     unzip(dataFile)
}

##load the NEI & SCC data frames into r

NEI<- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("source_Classification_Code.rds")

##convert "fips","pollutant","type","year" to factor

fact.col<- c("fips","type","Pollutant","year","SCC")

##check for NA's

colSums(is.na(NEI))

##aggregate the data

emission_total<- aggregate(Emissions~year, NEI,sum)
emission_total

##make the plot
png("plot1.png")
  
barplot((emission_total$Emissions)/10^6,names.arg =emission_total$year,xlab = "Year",
        ylab = "PM2.5 Emissions(10^6 tons)",main =  "PM2.5 Emissions from All US Sources", col = "red")

##switch off the gdevice.
dev.off()



