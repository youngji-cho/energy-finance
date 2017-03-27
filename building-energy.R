library(XML)
api.url <-"http://apis.data.go.kr/1611000/BldEngyService/getBeElctyUsgInfo?"#공공데이터 주소 입력 
service.key<-"8PZnRzZb4yXsXJQVBDX74xuf8kHhF4cmY5XnEO9apteNWtahGwpA9%2FjrthHB0tX7GBlm9zN1A%2F0rKCx3wGe27g%3D%3D"#Service. key 값 입력

#특정 데이터를 볼러오기 위한 인수 입력/전부다 필요한 것은 아님
rnum<-vector(mode="numeric",length=8),# 순번
useYm<-vector(mode="character",length=6), #사용년월(필수)
platPlc<-vector(mode="character",length=500), #대지위치(필수)
newPlatPlc<-vector(mode="character",length=400), # 도로명 대지위치
sigunguCd<-vector(mode="character",length=5),#시군구 코드 
bjdongCd<-vector(mode="character",length=5),#법정동 코드(필수) 
platGbCd<-vector(mode="character",length=1), # 대지구분코드(필수) 
bun<-vector(mode="character",length=4), # 번
ji<-vector(mode="character",length=4), #지
naRoadCd<-vector(mode="character",length=4), #새주소도로 코드 
naUgrndCd<-vector(mode="character",length=12), # 새주소 지상지 
naMainBun<-vector(mode="character",length=5), # 새주소 본번
naSubBun<-vector(mode="character",length=5), # 새주소 부번
useQty<-vector(mode="character",length=22) # 사용량 

final.url<-paste0(api.url,"sigunguCd=",sigunguCd,"&bjdongCd=",bjdongCd,"&bun=",bun,"&ji=",ji,"&ServiceKey=",service.key)
req<-GET(final.url)
building.energy.data<-content(req,as="parsed",type="application/json",encoding = "utf-8")

# 아직은 모든 변수를 수기로 입력해야 하는 단점이 있습니다. 
# 행정정보 시스템의 법정동 코드 시스템과 연계가 필요합니다
