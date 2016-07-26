setwd("~/Dropbox/Programming/신재생에너지 시장분석")
library(xlsx)
library(dplyr)

total_generation<-read.xlsx2(file="total_generation.xlsx",header=FALSE,sheetIndex = 1,startRow = 3)
names(total_generation)<-c("기간","지역","원자력","기력(유연탄)","기력(무연탄)","기력(유류)","기력(가스)","복합화력(유류)",
                           "복합화력(가스)","내연력(유류)","내연력(가스)","양수","기타","합계")
renewable_generation<-read.xlsx(file="renewable-generation .xlsx",sheetIndex = 1)
names(renewable_generation)<-c("기간","지역","태양광","바이오(가스)","바이오(LFG)","바이오-기타","풍력","일반수력","소수력",
                               "연료전지","해양에너지","폐기물(부생)","폐기물소각","합계")
renewable_sorted<-select(renewable_generation,c기간)
