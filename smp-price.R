library(zoo)
smp.price<-read.xlsx2(file="smp-price.xlsx",sheetIndex = 1,startRow = 3,colClasses = c("character","numeric","numeric","numeric"))
names(smp.price)<-c("month","onshore","offshore","BLMP")
x<-grep("2006/01",smp.price$month)
smp.price$month<-as.yearmon(smp.price$month,"%Y/%m")
smp.price$month<-as.Date(smp.price$month)

smp.mean<-mean(smp.price$onshore,na.rm = TRUE)
smp.median<-median(smp.price$onshore,na.rm=TRUE)
smp.var<-var(smp.price$onshore,na.rm = TRUE)
smp.sd<-sd(smp.price$onshore,na.rm = TRUE)

smp.price<-smp.price[1:x,]
smp.graph<-ggplot(smp.price,aes(x=month,y=BLMP))+
  geom_line(stat="identity")+
  theme_bw(base_family = "AppleGothic")+
  ylab("SMP 가격")+
  xlab("기준년월")+
  ggtitle("SMP가격 ")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1),
        legend.title=element_blank())+
  geom_hline(aes(yintercept=elec.compare$value[1], colour=elec.compare$name[1]),show.legend=TRUE)+
  geom_hline(aes(yintercept=elec.compare$value[2], colour=elec.compare$name[2]),show.legend=TRUE)+
  geom_hline(aes(yintercept=elec.compare$value[3], colour=elec.compare$name[3]),show.legend=TRUE) 
  
levels(elec.compare$name[1]) 
elec.compare$name<-levels(1:9)

elec.compare<-x
  x<-elec.compare
  elec.compare$name<-as.character(elec.compare$name)
  geom_hline(aes(yintercept=elec.compare$value[1], colour="red",linetype=elec.compare$name[1]),show.legend=TRUE)+
  geom_hline(aes(yintercept=elec.compare$value[2], colour="green",linetype=elec.compare$name[2]),show.legend=TRUE)+
  geom_hline(aes(yintercept=elec.compare$value[3], colour="blue", linetype=elec.compare$name[3]),show.legend=TRUE) +
  geom_hline(aes(yintercept=elec.compare$value[2], colour="green"), ,show.legend=TRUE)+
  geom_hline(aes(yintercept=elec.compare$value[3], colour="blue", linetype=elec.compare$name[3]),show.legend=TRUE)+
  geom_hline(aes(yintercept=elec.compare$value[1],linetype=elec.compare$name[1]), colour="red",show.legend=TRUE)+
  geom_hline(aes(yintercept=elec.compare$value[2],linetype=elec.compare$name[2]), colour= "red",show.legend=TRUE)+
  geom_hline(aes(yintercept=elec.compare$value[3],linetype=elec.compare$name[3]), colour= "red",show.legend=TRUE) 
  
  
  smp.graphtgeom_hline(aes(yintercept=c(elec.compare$value[1],elec.compare$value[2],elec.compare$value[3])
                 linetype=c(paste(elec.compare$name[1]),paste(elec.compare$name[2])paste(elec.compare$name[3])))
                 show.legend = c(TRUE,TRUE,TRUE))+
  scale_fill_discrete(breaks=c(paste(elec.compare$name[1]),paste(elec.compare$name[2]),paste(elec.compare$name[3]))+
  guides(fill=guide_legend(title="단계별 가정용 누진전기요금"))
  
