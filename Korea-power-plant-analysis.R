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
  x.no<-x[-(num),]
  x.yes<-x[num,]
  
  ordered<-x.yes[order(x.yes$발전소명),]
  
  
}
