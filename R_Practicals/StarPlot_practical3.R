StarDataTransformed.table=read.delim("StarDataTransformed.txt")
View(StarDataTransformed.table)
attach(StarDataTransformed.table)
plot( LogTemperature, LogLuminosity, xlim = c(4.6,3.2), pch = 10)
with  (StarDataTransformed.table,  text  (  LogTemperature,  LogLuminosity,  labels  =  Name, pos = 4, cex = 0.5))
StarDataClustering = data.frame (Name, LogLuminosity, LogTemperature)
starclust = hclust (dist (StarDataClustering[-1]), method = "centroid")
plot(starclust, labels = Name, cex = 0.5, hang = -2)
# Creating Frequency discribution 
K=10
IS=(max(LogTemperature)-min(LogTemperature))/(K-1)
breaks= seq (3.482,4.726, by = IS)
maxLL=min(LogTemperature)+K*IS
logtemp.cut=cut(LogTemperature,breaks,right=FALSE)
logtemp.freq=table(logtemp.cut)
cbind(logtemp.freq)
# Create a histrogram using above
hist(LogTemperature,breaks)

# K = 6, calculate mid values 
K=6
i= 1 : K
midvalues=round((breaks[i]+breaks[i+1])/2,2)
#Create barplot 
barplot(logtemp.freq, space = c(1,1), names.arg = midvalues)
plot(density(LogTemperature,adjust=0.5))
summary(LogTemperature)
var(LotTemperature)
sd(LogTemperature)