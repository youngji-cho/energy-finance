setwd("~/Dropbox/Programming/R/data")
library(xlsx)
library(dplyr)
library(KoNLP)

power.plant<-read.xlsx2("power-plant.xlsx",sheetIndex = 1)
level<-levels(power.plant$연료원)[2:length(levels(power.plant$연료원))]
first<-grep(".",power.plant$연료원)

section<-function(keyword){
  val1<-grep(keyword,power.plant$연료원)
  val2<-which(first==val1)
  val3<-val2+1
  
  sectioned1<-power.plant[first[val2]:first[val3],]
  sectioned2<-select(sectioned1,발전소명:총설비용량)
  sectioned3<-sectioned2[1:(length(sectioned2$발전소명)-3),]
  sectioned4<-arrange(sectioned3,desc(총설비용량))
  
  return(sectioned4)
  }

disslike.shap<-function(x){
  num<-grep(x$발전소명,pattern="#")
  x$발전소명<-as.character(x$발전소명)
  x$설비용량<-as.numeric(as.character(x$설비용량))
  x$총설비용량<-as.numeric(as.character(x$총설비용량))
  
  x.no<-x[-(num),]
  x.yes<-x[num,]
  
  y.1<-x.yes[order(x.yes$발전소명),]
  y.1$발전소명<-gsub(pattern="[0-9]|#",replacement="" ,y.1$발전소명)
  y.2<-aggregate(cbind(설비용량,대수,총설비용량)~발전소명, data = y.1, sum)
  
  ans<-rbind.data.frame(x.no,y.2)
  final<-arrange(ans,desc(총설비용량))
  return(final)
}
