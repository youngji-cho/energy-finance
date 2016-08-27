library(dplyr)
ind.eu<-read.csv("retail-electricity-price-indutrial-EU.csv") #nrg_pc_205, 해당 키워드 구글링 해보셈 
household.eu<-read.csv("retail-electricity-price-household-EU.csv")#nrg_pc_204 ,해당 키워드 구글링 해보셈 
period<-levels(ind.eu$TIME)
ind.eu$Value<-as.numeric(as.character(ind.eu$Value))
household.eu$Value<-as.numeric(as.character(household.eu$Value))
when<-"2015S2"#언제 데이터를 볼것인가? 분기별 데이터 조회 가능, 2014S2


ind.eu<-ind.eu[!is.na(ind.eu$Value),] #자료값이 나와있지 않는 자료는 제외한다. 
household.eu<-household.eu[!is.na(household.eu$Value),]

for(i in 1:length(period)){
  x<-subset(ind.eu,ind.eu$TIME==period[i])
  y<-subset(household.eu,household.eu$TIME==period[i])
  assign(paste("ind.eu",period[i], sep="."),x)
  assign(paste("household.eu",period[i], sep="."),y)
}

ind.final.price<-filter(ind.eu.2015S2, TAX=="All taxes and levies included"& CURRENCY=="Euro")
household.final.price<-filter(household.eu.2015S2, TAX=="All taxes and levies included"& CURRENCY=="Euro")

View(ind.final.price)
View(household.final.price) # 맞는지 한번 검사해주자.

eu.ind.grpah<-ggplot(ind.final.price,x=GEO,y=Value)+
  geom_bar(stat=count)+
  theme_bw(base_family = "AppleGothic")+
  ylab("산업용 전력요금 평균판매단가")+
  xlab(paste("EU 국가"))

eu.household.graph<-ggplot(ind.final.price,x=GEO,y=Value)+
  geom_bar(stat=count)+
  theme_bw(base_family = "AppleGothic")+
  ylab("산업용 전력요금 평균판매단가")+
  xlab(paste("EU 국가"))
