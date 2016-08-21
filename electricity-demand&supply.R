setwd("~/Dropbox/Programming/R/data")
library(xlsx)
library(lubridate)
library(ggplot2)

elec<-read.xlsx(file="electricity_supply.xlsx",sheetIndex = 1)
names(elec)<-c("기간","설비용량","공급능력","최대전력","공급예비력","공급예비율","기준일시")
elec<-elec[1:100, ]

elec$기간<-ymd(elec$기간)

elec$설비용량<-gsub(pattern = ",",replacement = "",elec$설비용량)
elec$설비용량<-as.integer(elec$설비용량)
elec$설비용량<-elec$설비용량*10

elec$공급능력<-gsub(pattern = ",",replacement = "",elec$공급능력)
elec$공급능력<-as.integer(elec$공급능력)
elec$공급능력<-elec$공급능력*10

elec$최대전력<-gsub(pattern = ",",replacement = "",elec$최대전력)
elec$최대전력<-as.integer(elec$최대전력)
elec$최대전력<-elec$최대전력*10

elec$공급예비력<-gsub(pattern = ",",replacement = "",elec$공급예비력)
elec$공급예비력<-as.integer(elec$공급예비력)
elec$공급예비력<-elec$공급예비력*10

elec$공급예비율<-as.integer(elec$공급예비율) 

reserve.graph<-ggplot(elec,aes(x=기간,y=공급예비력,colour=공급예비력))+
  geom_point(stat = "identity")+
  geom_hline(yintercept=5000,colour="red",linetype="dashed", size=1)+
  theme_bw(base_family = "AppleGothic")+
  ylab("공급예비력(Mw)")+
  xlab("기간(최근 100일)")+
  ggtitle("최근 100일(16.5.13~8.20) 전력수급현황")

capacity.graph<-ggplot(elec,aes(x=기간,y=공급예비력))+
  geom_line(stat = "identity")+
  theme_bw(base_family = "AppleGothic")+
  ylab("가용설비용량(Mw)")+
  xlab("기간(최근 100일)")+
  ggtitle("최근 100일(16.5.13~8.20) 가용발전설비현황")
