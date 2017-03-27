library(lubridate)
library(rjson)

api_url<-"http://apis.data.go.kr/1611000/BldRgstService/getBrRecapTitleInfo"
ServiceKey<-"8PZnRzZb4yXsXJQVBDX74xuf8kHhF4cmY5XnEO9apteNWtahGwpA9%2FjrthHB0tX7GBlm9zN1A%2F0rKCx3wGe27g%3D%3D"

sigunguCd<-11680 #시군구 코드(필수) 
bjdongCd<-10300 #법정동 코드(필수) 
bun<-0012 # 번
ji<-0000 #지
platGbCd<-0 #대지구분
numOfRows<-100

address_url<-paste0("?sigunguCd=",sigunguCd,"&bjdongCd=",bjdongCd)
final_url<-paste0(api_url,address_url,"&ServiceKey=",ServiceKey)
GET(final_url)

"&platGbCd=",platGbCd,"&bjdongCd=",bjdongCd,"&bun=",bun,"&ji=",ji,"&numOfRows=",numOfRows
startDate<-vector(mode="character",length=1), #검색시작일 
endDate<-vector(mode="character",length=1), # 검색종료일 
numOfRows<-100, # 리스트 수
pageNo<-, # 페이지 번호 


# 아직은 모든 변수를 수기로 입력해야 하는 단점이 있습니다. 
# 행정정보 시스템의 법정동 코드 시스템과 연계가 필요합니다. 




