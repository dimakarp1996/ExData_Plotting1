prepare<-function()
{
  URL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  dir<-paste(getwd(),"/a.zip",sep="")#get url
   download.file(URL,dir)#upload file
   unzip(dir)#unzip file
   G<-read.table("household_power_consumption.txt",sep=";",dec=".",header=TRUE)#read table
   G<-subset(G,(G$Date=="1/2/2007"|G$Date=="2/2/2007")) #subset dy date
   G$Date<-paste(as.character(G$Date),as.character(G$Time),sep=":")#fdate&time as 1 string
  G$Date<-strptime(G$Date,format="%d/%m/%Y:%H:%M:%S")               
   G$Global_active_power<-as.numeric(G$Global_active_power)
   #replace DATE&TIME with just 1 variable
   #G
   G
}
plot1<-function()
{
  G<-prepare()
  hist(G$Global_active_power,breaks=seq(0,6000,500),col="red",xlab = "Global Active Power(kilowatts)",main="Global Active Power",ylim=c(0,1200))
  
}