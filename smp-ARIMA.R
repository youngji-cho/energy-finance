library(tseries)
library(zoo)
library(xlsx)
library(forecast)

##SMP가격 
smp.price<-read.xlsx2(file="smp-price.xlsx",sheetIndex = 1,startRow = 2,colClasses = c("character","numeric","numeric","numeric"))
names(smp.price)<-c("기간","육지","해양","SMP","BLMP")
smp.price$기간<-as.yearmon(smp.price$기간,"%Y/%m")
smp.price$기간<-as.Date(smp.price$기간)

ts.smp<-ts(data=smp.price$SMP,frequency=12, start=c(2001,4))

##로그에 차분까지 해서 stationary한지 살펴보자 
par(mfrow=c(2,2))
plot(ts.smp)
plot(diff(ts.smp),type="l")
plot(log(ts.smp),type="l")
plot(diff(log(ts.smp)),type="l") 

##ADF test/ 단위근 검증을 통해서 stationary 여부를 알아보고 바로 auto_arima를 통해서 분석하자.  
smp.adf<-adf.test(diff(log(ts.smp)), alternative="stationary")
smp.arima<-auto.arima(diff(log(ts.smp)))
summary(smp.arima)
tsdiag(smp.arima)

##SMP 예측 
smp.fit <- arima(diff(log(ts.smp)), order= c(1, 0, 1), seasonal = list(order = c(0, 1, 1),period = 12))
smp.pred <- predict(smp.fit, n.ahead = 12)
pred.data<-ts.smp[1]+2.718^smp.pred$pred
par(mfrow=c(1,1))
plot(pred.data,xlab="predicted season",ylab="exptected SMP",main="SMP prediction")

