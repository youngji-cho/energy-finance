setwd("~/Dropbox/Programming/R/data")
library(tm)
library(KoNLP)
power.plant<-read.xlsx2("power-plant.xlsx",sheetIndex = 1)
level<-levels(power.plant$연료원)[2:length(levels(power.plant$연료원))]
first<-grep(".",power.plant$연료원)
