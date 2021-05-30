v1 <- 1:10
v2 = 10:1
print(v1)
v2
v3 <- 100
v3
v1 <- c(4,1,8,6,10) # c() 함수는 아규먼트를 원하는 만큼 전달할 수 있다.
v2 <- c(100,200,TRUE,FALSE); print(v2)
v3 <- c("100",200,T,F); print(v3)
v1[5];v1[3];v1[1];v1[0];v1[6] # 6번째 원소는 존재하지 않는다. NA
length(v3)

rep(1, 100)
rep(1:3, 5) # 14행과 15행은 동일하다. 
rep(1:3, times=5) # 키워드 파라미터
rep(1:3, each=5) 
?rep  #help()

LETTERS
letters
month.name
month.abb
pi

LETTERS;letters;month.name;month.abb;pi

LETTERS[1]; LETTERS[c(3,4,5)]
LETTERS[3:5]; LETTERS[5:3]
LETTERS[-1]; LETTERS[c(-2,-4)] # 음의 값 인덱스 : "제외"의 의미

length(LETTERS)
length(month.name)
length(pi)


x <- c(10,2,7,4,15)
x
print(x)
class(x)
rev(x) # 역순으로 reverse . 실제 벡터를 변화시키는 것은 아니다. 
range(x)
sort(x) #오름차순
sort(x, decreasing = TRUE) #내림차순
sort(x, decreasing = T)
#x <- sort(x)
order(x)



x[3] <- 20
x
x + 1
x <- x + 1
max(x);min(x);mean(x);sum(x)
summary(x) # 기초 통계량 추출 함수로 값을 벡터에 저장함

x[c(2,4)] # x[2], x[4], 인덱스를 벡터로 주는 경우
x[c(F,T,F,T,F)] # x[c(T,F)] 논리형 인덱스는 TRUE 인 경우만 출력. 개수를 똑같이 주지 않은 경우는 2개를 가지고 확장시킴.. TFTFT
x > 5
x[x > 5] # 인덱스에 비교식을 넣어 적용할 수 있다. 원하는 조건에 맞는 값을 뽑아내는 경우. 
x[x > 5 & x < 15] # x[x > 5 && x < 15]
#x[x > 5 | x < 15]

names(x) # 텍스트 마이닝을 할 때 네임벡터를 사용하는 경우가 많다.
names(x) <- LETTERS[1:5]
names(x) <- NULL
x[2];x["B"]; #x[B()]


# &, &&
c(T, T, F, F) & c(T, F, T, F) # 각각 원소마다 비교 
c(T, T, F, F) | c(T, F, T, F) # 각각 원소마다 비교 
c(T, T, F, F) && c(T, F, T, F) # 무조건 첫번째 원소끼리 비교
c(T, T, F, F) || c(T, F, T, F)


ls()
rm(x)
x
class(x)

rainfall <- c(21.6, 23.6, 45.8, 77.0, 
              102.2, 133.3,327.9, 348.0, 
              137.6, 49.3, 53.0, 24.9) # 강수량 데이터 (월별)
rainfall > 100
rainfall[rainfall > 100]
which(rainfall == 348.0)
which(rainfall > 100) #비교식이 참인 경우의 index값을 추출해줌
month.name[which(rainfall > 100)] # which에 의해 추출된 5,6,7,8,9에 따른 달의 이름 출력
month.abb[which(rainfall > 100)]
month.korname <- c("1월","2월","3월",
                   "4월","5월","6월",
                   "7월","8월","9월",
                   "10월","11월","12월")
month.korname[which(rainfall > 100)] 
which.max(rainfall) #which.max는 argument 벡터에서 최대값의 인덱스를 추출
which.min(rainfall) #which.max는 argument 벡터에서 최소값의 인덱스를 추출
month.korname[which.max(rainfall)]
month.korname[which.min(rainfall)]


sample(1:20, 3)
sample(1:45, 6)
sample(1:10, 7)
sample(1:10, 7, replace=T) # 중복 허용

paste("I'm","Duli","!!")
paste("I'm","Duli","!!", sep="")
paste0("I'm","Duli","!!")

fruit <- c("Apple", "Banana", "Strawberry")
food <- c("Pie","Juice", "Cake")
paste(fruit, food)
paste0(fruit, food)

paste(fruit, food, sep="")
paste(fruit, food, sep=":::")
paste(fruit, food, sep="", collapse="-")
paste(fruit, food, sep="", collapse="")
paste(fruit, food, collapse=",")

