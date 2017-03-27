library(ggplot2)
library(xlsx)
library(lubridate)
library(zoo)
setwd("~/Dropbox/Programming/R/data")

korea.interest<-read.table(file="Korea-interest-rate.csv",sep=",",skip=4,stringsAsFactors = FALSE)
names(korea.interest)<-c("기준월년","무담보콜금리","담보콜금리", "CD유통수익률.91일","CP 유통수익률.91일",
                         "국민주택채권.1종","국고채.1년","국고채.3년","국고채.5년","국고채.10년","국고채.20년","국고채.30년",
                         "통안증권.91일분", "통안증권.1년","통안증권.2년","산금채.1년", "산금채.3년","회사채.AA","회사채.BBB") 
korea.interest$기준월년<-as.yearmon(korea.interest$기준월년,format = "%Y/%m")
korea.interest$기준월년<-as.Date.yearmon(korea.interest$기준월년)

korea.interest20<-korea.interest[1:240,] #20년간 데이터만 보자 
twenty.yrs.graph<-ggplot(korea.interest20,aes(x=기준월년))+
  geom_line(aes(y=무담보콜금리,colour="1.무담보콜금리"))+
  geom_line(aes(y=CD유통수익률.91일,colour="2.CD유통수익률(91일)"))+
  geom_line(aes(y=국민주택채권.1종,colour="3.국민주택채권(1종)"))+
  geom_line(aes(y=통안증권.91일분,colour="4.통안증권(91일분)"))+
  geom_line(aes(y=국고채.5년,colour="5.국고채(5년)"))+
  geom_line(aes(y=산금채.3년,colour="6.산금채(3년)"))+
  geom_line(aes(y=회사채.AA,colour="7.회사채(AA-)"))+
  theme_bw(base_family = "AppleGothic")+ 
  xlab("기준일")+
  ylab("금리(%)")+
  ggtitle("20년간 주요 금리 변화")+
  scale_y_continuous(breaks=seq(0,40, 0.5))+ 
  scale_x_date(date_breaks = "1 year")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1),legend.title=element_blank())

korea.interest10<-korea.interest[1:120,]
ten.yrs.graph<-ggplot(korea.interest10,aes(x=기준월년))+
  geom_line(aes(y=무담보콜금리,colour="1.무담보콜금리"))+
  geom_line(aes(y=CD유통수익률.91일,colour="2.CD유통수익률(91일)"))+
  geom_line(aes(y=국민주택채권.1종,colour="3.국민주택채권(1종)"))+
  geom_line(aes(y=통안증권.91일분,colour="4.통안증권(91일분)"))+
  geom_line(aes(y=국고채.5년,colour="5.국고채(5년)"))+
  geom_line(aes(y=산금채.3년,colour="6.산금채(3년)"))+
  geom_line(aes(y=회사채.AA,colour="7.회사채(AA-)"))+
  geom_line(aes(y=회사채.BBB,colour="8.회사채(BBB+)"))+
  theme_bw(base_family = "AppleGothic")+ 
  xlab("기준일")+
  ylab("금리(%)")+
  ggtitle("10년간 주요 금리 변화")+
  scale_y_continuous(breaks=seq(0,40, 0.5))+ 
  scale_x_date(date_breaks = "6 month")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1),legend.title=element_blank())

korea.interest5<-korea.interest<-korea.interest[1:60,]
five.yrs.graph<-ggplot(korea.interest5,aes(x=기준월년))+
  geom_line(aes(y=무담보콜금리,colour="1.무담보콜금리"))+
  geom_line(aes(y=CD유통수익률.91일,colour="2.CD유통수익률(91일)"))+
  geom_line(aes(y=국민주택채권.1종,colour="3.국민주택채권(1종)"))+
  geom_line(aes(y=통안증권.91일분,colour="4.통안증권(91일분)"))+
  geom_line(aes(y=국고채.5년,colour="5.국고채(5년)"))+
  geom_line(aes(y=산금채.1년,colour="6.산금채(1년)"))+
  geom_line(aes(y=회사채.AA,colour="7.회사채(AA-)"))+
  theme_bw(base_family = "AppleGothic")+ 
  xlab("기준일")+
  ylab("금리(%)")+
  ggtitle("5년간 주요 금리 변화")+
  scale_y_continuous(breaks=seq(0,40, 0.5))+ 
  scale_x_date(date_breaks = "3 month")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1),legend.title=element_blank())

call.interest.graph<-ggplot(korea.interest,aes(x=기준월년))+
  geom_line(aes(y=무담보콜금리,colour="무담보콜금리"))+
  geom_line(aes(y=담보콜금리,colour="담보콜금리"))+
  theme_bw(base_family = "AppleGothic")+ 
  xlab("기준일")+
  ylab("금리(%)")+
  ggtitle("콜금리")+
  scale_y_continuous(breaks=seq(0,40, 0.5))+ 
  scale_x_date(date_breaks = "1 year")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1),legend.title=element_blank())+
  scale_colour_manual(values = c("무담보콜금리"=2,"담보콜금리"=3))

corporate.bond.graph<-ggplot(korea.interest,aes(x=기준월년))+
  geom_line(aes(y=산금채.1년,colour="산금채.1년"))+
  geom_line(aes(y=산금채.3년,colour="산금채.3년"))+
  geom_line(aes(y=회사채.AA,colour="회사채.AA-"))+
  geom_line(aes(y=회사채.BBB,colour="회사채.BBB+"))+
  theme_bw(base_family = "AppleGothic")+ 
  xlab("기준일")+
  ylab("금리(%)")+
  ggtitle("산금채 및 회사채 금리")+
  scale_y_continuous(breaks=seq(0,40, 0.5))+ 
  scale_x_date(date_breaks = "1 year")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1),legend.title=element_blank())+
  scale_colour_manual(values = c("산금채.1년"=2,"산금채.3년"=3,"회사채.AA-"=4,"회사채.BBB+"=5))


treasury.interest.graph<-ggplot(korea.interest,aes(x=기준월년))+
  geom_line(aes(y=국고채.1년,colour="국고채.01년"))+
  geom_line(aes(y=국고채.3년,colour="국고채.03년"))+
  geom_line(aes(y=국고채.5년,colour="국고채.05년"))+
  geom_line(aes(y=국고채.10년,colour="국고채.10년"))+
  geom_line(aes(y=국고채.20년,colour="국고채.20년"))+
  geom_line(aes(y=국고채.30년,colour="국고채.30년"))+
  theme_bw(base_family = "AppleGothic")+ 
  xlab("기준일")+
  ylab("금리(%)")+
  ggtitle("국고채 금리")+
  scale_y_continuous(breaks=seq(0,40, 0.5))+ 
  scale_x_date(date_breaks = "1 year")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1),legend.title=element_blank())+
  scale_colour_manual(values = c("국고채.01년"=1,"국고채.03년"=2,"국고채.05년"=3,
                                 "국고채.10년"=4,"국고채.20년"=5,"국고채.30년"=6))

stock.index<-read.csv(file="stock.price.csv",stringsAsFactors = FALSE)
names(stock.index)<-c("날짜","현재지수","대비","등락률","시가지수","고가지수","거래량(천주)-외국주 미포함","거래량(천주)-외국주포함",
                      "거래대금(원)-외국주미포함","거래대금(원)-외국주포함","상장시가총액(원)-외국주미포함","상장시가총액(원)-외국주포함")
