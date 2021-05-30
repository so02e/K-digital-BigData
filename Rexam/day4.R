l <- list(1,2,3)
v <- c(1,2,3)

sum(v)
sum(l) # Error in sum(l) : 인자의 'type' (list)이 올바르지 않습니다.


#read file data
nums <- scan("data/sample_num.txt")
word_ansi <- scan("data/sample_ansi.txt",what="")
words_utf8 <- scan("data/sample_utf8.txt", what="",encoding="UTF-8")
words_utf8_new <- scan("data/sample_utf8.txt", what="")
lines_ansi <- readLines("data/sample_ansi.txt")
lines_utf8 <- readLines("data/sample_utf8.txt",encoding="UTF-8")

df2 <- read.table("data/product_click.log", stringsAsFactors = T) #read.csv와 거의 동일
# read.csv는 csv 파일(각각의 내용이 컴마로 구분된 파일
# 구분자가 컴마가 아닌 다른 문자 (탭, 공백)인 경우에는 read.table을 사용한다. 컬럼명이 없는 파일이고, 자동적으로 V1,V2로 컬럼명을 자동적으로 붙인다.

str(df2)
head(df2)
summary(df2$V2)


# 함수 정의와 활용

func1 <- function() {
  xx <- 10   # 지역변수는 함수 안에서만 사용 가능하다.
  yy <- 20
  return(xx*yy)
}
func1()
#yy
result <- func1()
result
xx  # 오류발생
func1(10) # 매개변수가 없는 함수에 아규먼트를 주어 호출하는 경우는 불가능하다.

func2 <- function(x,y) { # 매개변수 2개를 갖는다.
  xx <- x
  yy <- y
  return(sum(xx, yy))
}

func2() # 매개변수 2개를 필요로 하는데, 기본값도 없고, 반드시 값을 전달해줘야 한다.
func2(5,6) # 식 : 연산식, 호출식, 변수, 리터럴

func3 <- function(x,y) {
  #x3 <- x+1
  #y3 <- y+1
  x4 <- func2(x+1, y+1)  # 값(식) : 변수, 리터럴, 연산식, 호출식
  # x4 <- func2(x3, y3)
  return(x4)
}

func3(9, 19)  # 30

func4 <- function(x=100, y=200, z) {
  return(x+y+z)
}
func4()
func4(10,20,30)
func4(x=1,y=2,z=3)
func4(y=11,z=22,x=33)
func4(z=1000)  #func4(,,1000)

# 시트에 있는 함수 코드
f1 <- function() print("TEST")
f1()
r <- f1()
r


f2 <- function(num) {print("TEST"); print(num) }
f2(100)
f2()


f3<- function (p="R") print(p)
f3()
f3(p="PYTHON")
f3("java")



f4<- function (p1="ㅋㅋㅋ",p2) for(i in 1:p2) print(p1)
f4(p1="abc", p2=3)
f4("abc", 3) 
f4(5) # f4(,5)
f4(p2=5) 


f5<- function(...) { print("TEST"); data <- c(...); print(length(data))}
f5(10, 20, 30)
f5("abc", T, 10, 20)


f6<- function(...) {
  print("수행시작")
  data <- c(...)
  for(item in data) {
    print(item)
  }
  return(length(data))
}
f6()
f6(10)
f6(10,20)
f6(10,20,30)
f6(10,'abc', T, F)

f7<- function(...) {
  data <- c(...)
  sum <- 0;
  for(item in data) {
    if(is.numeric(item))
      sum <- sum + item
    else
      print(item)
  }
  return(sum)
}
f7(10,20,30)
f7(10,20,'test', 30,40)

f8<- function(...) {
  data <- list(...)
  sum <- 0;
  for(item in data) {
    if(is.numeric(item))
      sum <- sum + item
    else
      print(item)
  }
  return(sum)
}

f8(10,20,30)
f8(10,20,"test", 30,40)
