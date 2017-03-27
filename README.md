# R과 정부 공공데이터 API를 활용한 건물정보 분석  

R을 통해서 대한민국의 건물분석을 위한 프로그램입니다.정부 공공데이터 포털(https://www.data.go.kr) 에서 API를 접속해서 JSON파일을 끌어옵니다. <br></br>
목적은 저희 향후 꿈인 태양광발전소의 리스크 분석을 위함입니다. 다른 사람의 건물위(roof-top)에 올라가는 태양광의 특성상, 건물의 수명주기에 따른 리스크가 많습니다.
예를 들어, 태양광발전소가 지어진 뒤, 7년쯤 있다가 리모델링이 되서 철거된다든지.... 

##정부공공데이터 사용시 유의해야할 점 
정부 공공데이터 포털을 활용시 정보가 너무 없어서 고생했습니다. 공공데이터 포털의 가이드로는 부족하더군요. 공공데이터 API에 대해 간단한 가이드 후 코드를 설명하겠습니다.<br>

### Ouath-authentication 이 필요없는 API 접속<br>
Facebook, twitter, github api를 접속할 때는 반드시 ouath-login과정을 거쳐야 합니다. 사용자 인증을 위함입니다. 
하지만, 공공데이터 API에서는 ouath-authentication과 같은 과정은 필요가 없습니다.url에 바로 service key를 입력해서 GET(httr) 함수를 통해서 실행하면 됩니다. 
<br></br>
건축물 대장 API의 인증을 받으면 발급되는 것은 서비스키 하나입니다.보통 oauth로그인할 때 주어지는 consumer secret,이나 endpoints는 없습니다. (endpoints는 경우에 따라 있는 경우도 있습니다} <br></br>
1.저의 서비스 키는 아래와 같습니다.<br>
`8PZnRzZb4yXsXJQVBDX74xuf8kHhF4cmY5XnEO9apteNWtahGwpA9%2FjrthHB0tX7GBlm9zN1A%2F0rKCx3wGe27g%3D%3D`
<br></br>
2. 공공데이터 포털에서는 API 가이드북을 보면, 기본 url은 아래와 같습니다.<br> 
`"http://apis.data.go.kr/1611000/BldRgstService/getBrRecapTitleInfo?"` 
<br></br>
3.건축물 대장에 API가이드에에서 예시되는 API의 주소는 아래와 같습니다.<br>  ``"http://apis.data.go.kr/1611000/BldRgstService/getBrBasisOulnInfo?sigunguCd=11680&bjdongCd=10300&bun=0012&ji=0000&ServiceKey=인증키" ``<br></br>
4. 기본 API url 이후에 "sigunguCd(시군구 코드)" 와 "bjdongCd(법정동 코드)"는 API내의 변수입니다.이처럼 url속에 "&" 과 필요한 변수의 코드를 입력하면 해댱 건물의 데이터를 불러올 수 있습니다. 그러므로, 전체 API코드 는 다음과 구성될 수 있습니다. 
<br>
    `req<-GET('http://apis.data.go.kr/1611000/BldRgstService/getBrBasisOulnInfo?sigunguCd=11680&bjdongCd=10300&bu n=0012&ji=0000&ServiceKey= 8PZnRzZb4yXsXJQVBDX74xuf8kHhF4cmY5XnEO9apteNWtahGwpA9%2FjrthHB0tX7GBlm9zN1A%2F0rKCx3wGe27g%3D%3D')` <br>
    `building.data<-cotent(req)` <br>
    `building.data` 
<br> 
당연한 것은 sigunguCd(시군구 코드)를 bjdongCd(법정동코드)나 다른 코드를 입력하면 다른 건물의 데이터를 불러올 수 있습니다. 자세한 것은 홈페이지 참조바랍니다. 

## 본 Repository의 구성 
1. 건물정보(building information) : 건축물 대장 정보 서비스의 API를 활용한 건축물 정보의 조회입니다. <br> 
2. 건물에너지정보(builing energy) : 건물 에너지 정보 서비스의 API를 활용한 건물의 에너지 정보 조회입니다. <br>
다른API 개방에 따라 유용한 API가 있으면 추가적으로 구성할 예정입니다. <br>
<hr>
문과 전공자여서 코드 자체가 많이 부족합니다. 부족한 점 있으면 언제든지 연락바랍니다. 










