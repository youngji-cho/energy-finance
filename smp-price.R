library(xlsx) 
library(dplyr)
library(zoo)

smp.price<-read.xlsx2(file="smp.price.xlsx",sheetIndex = 1,startRow = 3,colClasses = c("character","numeric","numeric","numeric"))
names(smp.price)<-c("month","onshore","offshore","BLMP")
x<-grep("2010/01",smp.price$month)
smp.price$month<-as.yearmon(smp.price$month,"%Y/%m")

smp.mean<-mean(smp.price$onshore,na.rm = TRUE)
smp.median<-median(smp.price$onshore,na.rm=TRUE)
smp.var<-var(smp.price$onshore,na.rm = TRUE)
smp.sd<-sd(smp.price$onshore,na.rm = TRUE)

smp.price<-smp.price[1:x,]
plot(x=smp.price$month,y=smp.price$onshore,xlab="월",ylab="SMP단가",type="l",lwd=3)
