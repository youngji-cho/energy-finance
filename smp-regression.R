library(ggplot2)
library(zoo)
library(xlsx)
library(dplyr)

smp.price<-read.xlsx2(file="smp-price.xlsx",sheetIndex = 1,startRow = 2,colClasses = c("character","numeric","numeric","numeric"))
names(smp.price)<-c("기간","육지SMP","해상SMP","BLMP")
x<-grep("2010/01",smp.price$기간)
smp.price$기간<-as.yearmon(smp.price$기간,"%Y/%m")
smp.price$기간<-as.Date(smp.price$기간)
smp.price<-smp.price[1:x,1:3]
arrange(oil.price,기간)

oil.price<-read.csv(file="oil-price.csv",skip = 1)
names(oil.price)<-c("기간","두바이유","브렌트유","텍사스유")
oil.price$기간<-as.yearmon(oil.price$기간,"%Y.%m")
oil.price$기간<-as.Date(oil.price$기간)
oil.price<-arrange(oil.price,desc(기간))

elec.supply<-read.xlsx(file="elec_supply.xlsx",sheetIndex = 1,startRow =3)
elec.supply<-elec.supply[,1:6]
names(elec.supply)<-c("기간","설비용량","공급능력","최대전력","공급예비력","공급예비율")
x<-grep("2010/01",elec.supply$기간)
elec.supply$기간<-as.yearmon(elec.supply$기간,"%Y/%m")
elec.supply$기간<-as.Date(elec.supply$기간)
elec.supply$공급예비력<-gsub(",","",elec.supply$공급예비력)
elec.supply$공급예비력<-as.numeric(elec.supply$공급예비력)*10
elec.supply$설비용량<-gsub(",","",elec.supply$설비용량)
elec.supply$설비용량<-as.numeric(elec.supply$설비용량)*10

smp.reg<-merge(smp.price,oil.price,by.y="기간")
smp.reg<-merge(smp.reg,elec.supply,by.y="기간")

oil.smp.lm<-lm(육지SMP~두바이유,smp.reg)
supply.smp.lm<-lm(육지SMP~공급예비력,smp.reg)

oil.smp.point.graph<-ggplot(data = smp.reg,aes(x=두바이유,y=육지SMP))+
  geom_point()+
  theme_bw(base_family = "AppleGothic")+
  ylab("SMP 가격(원/kwh)")+
  xlab("국제유가")+
  stat_smooth(method=lm, level=0.95)+
  geom_abline(slope= oil.smp.lm$coefficients[2],intercept =oil.smp.lm$coefficients[1])+
  ggtitle("유가와 SMP의 관계")

supply.smp.point.graph<-ggplot(data=smp.reg,aes(x=공급예비력,y=육지SMP))+
  geom_point()+
  theme_bw(base_family = "AppleGothic")+
  ylab("SMP 가격(원/kwh)")+
  xlab("공급예비력(Mw)")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  stat_smooth(method=lm, level=0.95)+
  geom_abline(slope= supply.smp.lm$coefficients[2],intercept =supply.smp.lm$coefficients[1])+
  ggtitle("공급예비력과 SMP의 관계")

 


