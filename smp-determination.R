library(xlsx)
smp.determination<-read.xlsx2(file="smp_determination.xlsx",sheetIndex = 1,
                              colClasses = c(기간="character",LNG="numeric",유류="numeric",무연탄="numeric",유연탄="numeric", 원자력="numeric",총계="numeric"))
smp.determination[is.na(smp.determination)]<-0
smp.peak<-data.frame(기간=smp.determination$기간,LNG비중=smp.determination$LNG/smp.determination$총계,
                       유류비중=smp.determination$유류/smp.determination$총계,
                       첨두비중=(smp.determination$LNG+smp.determination$유류)/smp.determination$총계)
