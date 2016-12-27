
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
plot3<-function()
{
  G<-prepare()
plot(G$Date,G$Sub_metering_1,col="grey",type="l",ylab="Energy sub metering",xlab="")
lines(G$Date,G$Sub_metering_2,col="blue")
lines(G$Date,G$Sub_metering_2,col="red")
lines(G$Date,G$Sub_metering_3,col="blue")
legend("topright", inset=.05, cex = 1, title="Legend", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), horiz=FALSE, lty=c(1,1), lwd=c(3,3),col=c(8,2,4), bg="white")
}