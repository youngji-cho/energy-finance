library(zoo)
library(xlsx)

##SMP그래프 
smp.price<-read.xlsx2(file="smp-price.xlsx",sheetIndex = 1,startRow = 2,colClasses = c("character","numeric","numeric","numeric"))
names(smp.price)<-c("기간","육지","해양","SMP","BLMP")
smp.price$기간<-as.yearmon(smp.price$기간,"%Y/%m")
smp.price$기간<-as.Date(smp.price$기간)

#SMP결정계수 
smp.determination<-read.xlsx2(file="smp_determination.xlsx",sheetIndex = 1,
                              colClasses = c(기간="character",LNG="numeric",유류="numeric",무연탄="numeric",유연탄="numeric", 원자력="numeric",총계="numeric"))
smp.determination$기간<-as.yearmon(smp.determination$기간,"%Y/%m")
smp.determination$기간<-as.Date(smp.determination$기간)
smp.determination[is.na(smp.determination)]<-0
smp.peak<-data.frame(기간=smp.determination$기간,LNG비중=smp.determination$LNG/smp.determination$총계,
                       유류비중=smp.determination$유류/smp.determination$총계,
                       첨두비중=(smp.determination$LNG+smp.determination$유류)/smp.determination$총계)
##연료비
fuel.cost<-read.xlsx2(file="fuel_cost.xlsx",sheetIndex = 1)
fuel.cost$기간<-as.Date(as.yearmon(gsub("/","-",fuel.cost$기간)))
for(i in 2:6){
  fuel.cost[,i]<-gsub(",","",fuel.cost[,i])
}
fuel.cost<-fuel.cost[2:length(fuel.cost[,1]),]

##공급예비율 
elec.original<-read.xlsx(file="electricity_supply.xlsx",sheetIndex = 1)
names(elec.original)<-c("기간","설비용량","공급능력","최대전력","공급예비력","공급예비율","기준일시")

trim<-function(x){
  x.1<-gsub(pattern = ",",replacement = "",x)
  x.2<-as.integer(x.1)
  return(x.2*10)
}  #변수들을 조금 손실해주자 
elec<-elec.original[2:length(elec.original[,1]),] #origianl data는 남겨둔다. 변수를 손질하는 중에 오류가 날 수 있다. 
elec$기간<-as.Date(as.yearmon(gsub("/","-",elec$기간)))
elec$설비용량<-trim(elec$설비용량)
elec$공급능력<-trim(elec$공급능력)
elec$최대전력<-trim(elec$최대전력)
elec$공급예비력<-trim(elec$공급예비력)
elec$공급예비율<-as.integer(as.character(elec$공급예비율))

# 모든 데이터를 합한다. 
elec.data<-merge(smp.price,smp.peak,by="기간")
elec.data<-merge(elec.data,fuel.cost,by="기간")
elec.data<-merge(elec.data,elec,by="기간")
elec.data<-elec.data[3:length(elec.data[,1]),] # 불연속적 데이터 제거,03~16년까지 데이터를 한번에 볼 수 있다. 
elec.data<-elec.data[,c("기간","SMP","LNG비중","유류비중","첨두비중","유류","LNG","공급예비율")]
elec.data$첨두비중<-elec.data$첨두비중*100

#SMP회귀분석
smp.peak<-lm(SMP~첨두비중,data=elec.data)
smp.price<-lm(SMP~LNG,data= elec.data)
smp.supply<-lm(SMP~공급예비율,data=elec.data)

smp.fit<-lm(SMP~첨두비중+LNG+공급예비율,data=elec.data)
summary(smp.fit)
