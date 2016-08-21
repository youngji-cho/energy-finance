setwd("~/Dropbox/Programming/R/data")
library(xlsx)
library(lubridate)
library(ggplot2)

elec<-read.xlsx2(file="electricity_supply.xlsx",sheetIndex = 1)
names(elec)<-c("기간","설비용량","공급능력","최대전력","공급예비력","공급예비율","기준일시")
elec<-elec[1:100, ]

elec$기간<-ymd(elec$기간)
elec$공급예비력<-as.integer(elec$공급예비력)
elec$공급예비율<-as.integer(elec$공급예비율)
elec$공급예비력<-elec$공급예비력*10

graph<-ggplot(elec,aes(x=기간,y=공급예비력))+
  geom_point(stat = "identity")+
  geom_hline(aes(colour="red",size=10),yintercept=1000)+
  theme_bw(base_family = "AppleGothic")+
  ylab("공급예비력(Mw)")+
  xlab("기간(최근 100일)")+
  ggtitle("최근 100일 전력수급현황(16년 8월 20기준)")
