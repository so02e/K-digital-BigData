# 호텔 아고다에서 댓글 읽기
url<-'https://www.agoda.com/ko-kr/shilla-stay-yeoksam/hotel/seoul-kr.html?asq=z91SVm7Yvc0eRE%2FTBXmZWCYGcVeTALbG%2FvMXOYFqqcm2JknkW25Du%2BVdjH%2FesXg8ORIaVs1PaEgwePlsVWfwf3sX%2BVNABRcMMOWSvzQ9BxqOPOsvzl8390%2BEhEylPvEiBp0eoREr2xLYHgqmk0Io4J1HYEzEOqyvdox%2BwS6yxHeonB9lh7mJsBIjSBPoMzBLFW01k%2BU8s2bGO6PcSdsu3T30HwabyNzwNYKiv%2BRDxfs%3D&hotel=699258&tick=637215342272&languageId=9&userId=bcb7ecc6-7719-465f-bf29-951e39733c66&sessionId=uouhnqjisace4freagmzbxxc&pageTypeId=7&origin=KR&locale=ko-KR&cid=-1&aid=130243&currencyCode=KRW&htmlLanguage=ko-kr&cultureInfoName=ko-KR&ckuid=bcb7ecc6-7719-465f-bf29-951e39733c66&prid=0&checkIn=2020-05-30&checkOut=2020-05-31&rooms=1&adults=1&childs=0&priceCur=KRW&los=1&textToSearch=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC%20(Shilla%20Stay%20Yeoksam)&productType=-1&travellerType=0&familyMode=off'
remDr$navigate(url)


# 첫페이지의 리뷰 읽기
doms <- remDr$findElements(using = "css selector", "div.Review-comment-right > div.Review-comment-bubble > div.Review-comment-body > p.Review-comment-bodyText")
review <- sapply(doms, function (x) {x$getElementText()})
review <- unlist(review)


# 모든 페이지의 리뷰 읽기
pageLink <- NULL
review <- NULL
curr_PageOldNum <- 0

repeat{
  doms <- remDr$findElements(using = "css selector", ".Review-comment-bodyText")
  Sys.sleep(1)
  
  review <- sapply(doms, function (x) {x$getElementText()})
  review <- unlist(review)
  
  # # arguments인수를 써서 가변형인자. 내부적으로 하나의 함수로 인식되는 자바스크립트 코드 -> clickElement()가 안먹는 경우
  pageLink <- remDr$findElements(using='css selector',"#reviewSection > div:nth-child(6) > div > span:nth-child(3) > i ")
  remDr$executeScript("arguments[0].click();",pageLink) 
  
  
  reviewtab <- remDr$findElements('css selector',"#reviewFilterSection > div.Review__FilterContainer > div:nth-child(1) > div > ul > li:nth-child(6)")
  
  remDr$executeScript("arguments[0].click();",reviewtab) 
  
  
  Sys.sleep(2)
  
  # 현재 페이지 번호 추출
  #reviewSection > div:nth-child(4) > div > span.Review-paginator-numbers > span.Review-paginator-number.Review-paginator-number--current
  curr_PageElem <- remDr$findElement(using='css','#reviewSection > div:nth-child(6) > div > span.Review-paginator-numbers > span.Review-paginator-number.Review-paginator-number--current')
  curr_PageNewNum <- as.numeric(curr_PageElem$getElementText())
  
  
  
  

  if(curr_PageNewNum == curr_PageOldNum)  {
    cat("종료\n")
    break; 
  }
  curr_PageOldNum <- curr_PageNewNum;
}

