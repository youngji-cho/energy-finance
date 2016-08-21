setwd("~/Dropbox/Programming/R/data")
library(xlsx)
library(lubridate)
library(ggplot2)
library(dplyr)

elec.original<-read.xlsx(file="electricity_supply.xlsx",sheetIndex = 1)
names(elec.original)<-c("기간","설비용량","공급능력","최대전력","공급예비력","공급예비율","기준일시")

trim<-function(x){
  x.1<-gsub(pattern = ",",replacement = "",x)
  x.2<-as.integer(x.1)
  return(x.2*10)
}  #변수들을 조금 손실해주자 
elec<-elec.original #origianl data는 남겨둔다. 변수를 손질하는 중에 오류가 날 수 있다. 
elec$기간<-ymd(elec$기간)
elec$설비용량<-trim(elec$설비용량)
elec$공급능력<-trim(elec$공급능력)
elec$최대전력<-trim(elec$최대전력)
elec$공급예비력<-trim(elec$공급예비력)
elec$공급예비율<-as.integer(as.character(elec$공급예비율))

start.date<-ymd(start.date)
end.date<-ymd(end.date) #날짜를 설정해주자
elec<-filter(elec,start.date<기간<end.date)
term<-paste0("(",start.date,"~",end.date,")")

reserve.graph<-ggplot(elec,aes(x=기간,y=공급예비력,colour=공급예비력))+
  geom_point(stat = "identity")+
  geom_hline(yintercept=5000,colour="red",linetype="dashed", size=1)+
  theme_bw(base_family = "AppleGothic")+
  ylab("공급예비력(Mw)")+
  xlab(paste("기간",term))+
  ggtitle(paste("공급예비력",term)) #공급예비력 계산 

capacity.graph<-ggplot(elec,aes(x=기간,y=공급예비율,group=1))+
  geom_line(stat = "identity")+
  geom_hline(yintercept=c(5,15,22),colour="red",linetype="dashed", size=1)+
  theme_bw(base_family = "AppleGothic")+
  ylab("발전예비율(%)")+
  xlab(paste("기간",term))+
  ggtitle(paste("전력수급현황",term)) #공급예비율 계산 
