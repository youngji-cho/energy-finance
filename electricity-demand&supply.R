library(xlsx)
library(lubridate)
elec<-read.xlsx2(file="electricity_supply.xlsx",sheetIndex = 1)
names(elec)<-c("기간","설비용량","공급능력","최대전력","공급예비력","공급예비율","기준일시")
elec<-elec[1:100, ]

elec$기간<-ymd(elec$기간)
elec$공급예비력<-as.integer(elec$공급예비력)
elec$공급예비율<-as.integer(elec$공급예비율)

plot(x=elec$기간,y=elec$예비력,main="최근 100일 전력수급현황(16년 8월 20기준)",xlab="기간",ylab="공급예비력",type="l",family="AppleGothic")
