# 0. 동적 크롤링을 위한 라이브러리 셀레늄 기동
library(RSelenium)

# 1. 서버를 기동시킨 후 접속한다.
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")

# 2. selenium 서버에 의해 제어되는 브라우저 기동시킨다.
remDr$open()

# 3. url 정보를 저장하고 불러온다.
url <- "https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2"
remDr$navigate(url)

# 4. 크롤링

# 1) 리뷰의 태그 룰을 파악한다

# body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > ul > li:nth-child(1) > div.review_desc > p
# body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > ul > li:nth-child(2) > div.review_desc > p
# body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > ul > li:nth-child(3) > div.review_desc > p
# body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > ul > li:nth-child(4) > div.review_desc > p

# body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > ul > li > div.review_desc > p (복잡하기 때문에 적당한 길이를 줄여 사용하여 찾아지나 확인할 수 있다. )



content <- remDr$findElements(using ="css selector","div.review_ta.ng-scope div.review_desc > p") # div.review의 자손 ..(자손은 한칸 띄는 것이기 때문에).. 몇개인지 모르기 때문에 elements

sapply(content,function(x){x$getElementText()}) # 복수 개이기 때문에, 각각의 원소에 따라 function을 호출하고 x에는 그 값들이 들어간다. sapply함수에 대한 보충 필요



# 2) 다음 버튼에 대한 css 선택자를 알아서 클릭이벤트 발생 시키기  
# body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > span:nth-child(3) > a

# body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > span:nth-child(6) > a

btn <- remDr$findElement(using='css','"body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > a.direction.next')
btn$clickElement()




# 3) 멈추기
# 다음 버튼이 없어진 건 아닌데 흐려진 상황  # 속성값이 disabled이 findelement()가 비어있는 리스트이면 -> 스타일이 바뀌었는데. CSS 선택자 의 클래스 속성의 값이 바뀌는 상황. 


btn
# a 태그의 변화 -> 없었던 클래스 속성이 추가됨. 

# 4) 저장
write(repl_v, "output/naverhotel.txt")
