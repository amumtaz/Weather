library(gdata)
library(lattice)
library(graphics)

system.time(
  rawData <- read.xls("/Users/amumtaz/Documents/Programming/Datascience/Weather/Data/isbWeather9615.xls")
)

  mydates <- as.Date(rawData$PKT)

mytemp <- rawData$MaxTemperatureC
#mytemp <- rawData$Min.TemperatureC
print(length(mytemp))
x <- mydates
y <- mytemp
mt <- rawData$Min.TemperatureC
mn <- rawData$Mean.TemperatureC  

z <- rawData$X.Events
p <- rawData$X.Mean.Sea.Level.PressurehPa

xlabel <- "Timeline"
ylabel <- "Temp C"
heading <- "Islamabad Temperature"

myplot <- plot(x,y,type="l", lwd=1, col="lightblue",axes=TRUE,
               xlab=xlabel, ylab=ylabel, main=heading) #ylim=c(0,ylimit)
grid(nx = 3, ny = 3, col = "lightgray", lty = "dotted")
lines(lowess(x,y), col="blue", lwd=1)
lines(lowess(x,mt), col="green", lwd=1)
lines(lowess(x,mn), col="red", lwd=3)


if(z == "Rain") 
  {
    lines(lowess(x,z), col="red", lwd=3,0)
  }



#  for(n in mytemp) 
#  {
#    class(n)
#    n <- is.integer(n)
#    print(n)
#    if(n > 30) {
#      print("high")
#    } else {
#      print("Low")      
#    }
#  }

max(mytemp, na.rm=TRUE)
min(mytemp, na.rm=TRUE)

