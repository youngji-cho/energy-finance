library(httr)
library(XML)
##API data 
base_url<-"http://openapi.gmap.go.kr/service/rest/cvplInqireService/getOthbcCvplList"
ServiceKey<-"8PZnRzZb4yXsXJQVBDX74xuf8kHhF4cmY5XnEO9apteNWtahGwpA9%2FjrthHB0tX7GBlm9zN1A%2F0rKCx3wGe27g%3D%3D"
appName<-"태양광민원등록대장"
pageNo<-1
testYn<-"N"
api_url<-paste0(base_url,"&ServiceKey=",ServiceKey,"?appName=",appName,"?pageNo=",pageNo,"?testYn=",testYn)

##개별 유저 데이터 
usrHpNo<-"J7ImzWbyyPg69KtTrv/9rA=="
usrName<-"r74Rmfm+/h+aZkwgwgyGmg=="
usrAuthkey<-"zoUU71gZF60caEQK+MaATA=="
usr_url<-paste0("?usrHpNo=",usrHpNo,"?usrName=",usrName,"?usrAuthkey=",usrAuthkey)


final_url<-paste0(api_url,usr_url)
GET(final_url)

"http://openapi.gmap.go.kr/service/rest/cvplInqireService/getOthbcCvplList
&ServiceKey=8PZnRzZb4yXsXJQVBDX74xuf8kHhF4cmY5XnEO9apteNWtahGwpA9%2FjrthHB0tX7GBlm9zN1A%2F0rKCx3wGe27g%3D%3D
?appName=태양광민원등록대장
?pageNo=1
?testYn=N
?usrHpNo=J7ImzWbyyPg69KtTrv/9rA==
?usrName=r74Rmfm+/h+aZkwgwgyGmg==
?usrAuthkey=zoUU71gZF60caEQ K+MaATA==(123456)"

sample_url<-"http://openapi.gmap.go.kr/service/rest/cvplInqireService/getOthbcCvplList?testYn=Y&ServiceKey=8PZnRzZb4yXsXJQVBDX74xuf8kHhF4cmY5XnEO9apteNWtahGwpA9%2FjrthHB0tX7GBlm9zN1A%2F0rKCx3wGe27g%3D%3D&_type=xml&appName=testapp&usrName=R74Rmfm+/h+aZkwgwgyGmg==&usrHpNo=J7ImzWbyyPg69KtTrv/9rA=="
GET(sample_url)


service_url<-paste0(api_url,"?service",service_key)
doc<-xmlTreeParse(service_url,useInternal=TRUE)

sample_url<-http://openapi.gmap.go.kr/service/rest/cvplInqireService/getOthbcCvplList?testYn=Y
&ServiceKey=rIvLQu YURCj4zkoYe3pPuh...(생 략)
&_type=xml
&appName=testapp
&usrName=R74Rmfm+/h+aZkwgwgyGmg==
&usrHpNo=J7ImzWby yPg69KtTrv/9rA==

  
