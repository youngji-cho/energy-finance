
setwd("~/Dropbox/Programming/R/data")
library(tm)
library(KoNLP)
power.plant<-read.xlsx2("power-plant.xlsx",sheetIndex = 1)
level<-levels(power.plant$연료원)[2:length(levels(power.plant$연료원))]
first<-grep(".",power.plant$연료원)

j<-1
name<-vector(mode="character",length = length(first))
for(i in first)
{
  print(j)
  print(i)
  name[j]<-paste0(power.plant$연료원[i],".",power.plant$발전형식[i])
  j<-j+1
}

for(1 in length(first)){
  subsetted<-power.plant[first[i]:first[i+1],]
  assign(name[i],subsetted)
}

