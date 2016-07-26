library(XML)
library(httr)
library(httpuv)
library(jsonlite)
library(dplyr)

powersupply<-"https://openapi.kpx.or.kr/openapi/sukub5mMaxDatetime/getSukub5mMaxDatetime?ServiceKey=8PZnRzZb4yXsXJQVBDX74xuf8kHhF4cmY5XnEO9apteNWtahGwpA9%2FjrthHB0tX7GBlm9zN1A%2F0rKCx3wGe27g%3D%3D"
powersupply.today<-"https://openapi.kpx.or.kr/openapi/sukub5mToday/getSukub5mToday?ServiceKey=8PZnRzZb4yXsXJQVBDX74xuf8kHhF4cmY5XnEO9apteNWtahGwpA9%2FjrthHB0tX7GBlm9zN1A%2F0rKCx3wGe27g%3D%3D"
smp<-"https://openapi.kpx.or.kr/openapi/smp1hToday/getSmp1hToday?areaCd=1&serviceKey=8PZnRzZb4yXsXJQVBDX74xuf8kHhF4cmY5XnEO9apteNWtahGwpA9%2FjrthHB0tX7GBlm9zN1A%2F0rKCx3wGe27g%3D%3D"
powersupply.forecast<-"https://openapi.kpx.or.kr/openapi/forecast1dMaxBaseDate/getForecast1dMaxBaseDate?serviceKey=8PZnRzZb4yXsXJQVBDX74xuf8kHhF4cmY5XnEO9apteNWtahGwpA9%2FjrthHB0tX7GBlm9zN1A%2F0rKCx3wGe27g%3D%3D"

req.powersupply<-GET(powersupply)
req.powersupply.today<-GET(powersupply.today)
req.smp<-GET(smp)
req.powersupply.forcast<-GET(powersupply.forecast)

xml.powersupply<-xmlTreeParse(req.powersupply)
xml.powersupply.today<-xmlTreeParse(req.powersupply.today)
xml.smp<-xmlTreeParse(req.smp)
xml.powersupply.forecast<-xmlTreeParse(req.powersupply.forcast)

root.powersupply<-xmlRoot(xml.powersupply)
root.powersupply.today<-xmlRoot(xml.powersupply.today)
root.smp<-xmlRoot(xml.smp)
root.powersupply.forcast<-xmlRoot(xml.powersupply.forecast)
