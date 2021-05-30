# matrix 실습
x1 <-matrix(d1:8, nrow = 2) #ncol 매개변수를 생략.
x1
x1<-x1*3
x1

sum(x1); min(x1);max(x1);mean(x1)

x2 <-matrix(1:8, nrow =3)
x2 # 경고 메세지가 나오지만, 다시 data의 첫 값으로 돌아가 1을 채워넣음 

chars <- letters[1:10]; print(chars)
(chars <- letters[1:10]) #괄호에 넣으면, 변수값을 출력까지 해준다.

mat1 <-matrix(chars) # 행의 개수 열의 개수를 주지 않으면 하나의 열에 다 넣어버림. 
mat1; dim(mat1)
matrix(chars, nrow=1)
matrix(chars, nrow=5) # 열 우선 채우기 (기본값) 
matrix(chars, nrow=5, byrow=T)# 행 우선 채우기
matrix(chars, ncol=5)
matrix(chars, ncol=5, byrow=T)
matrix(chars, nrow=3, ncol=5)
matrix(chars, nrow=3)

m <- matrix(chars,nrow=3)
m[1,1]
m[3,4] #3행 4열
m[3,4] <- 'w' # 인덱싱은 값을 추출하는 용도와 값을 할당하는 용도로 쓰임

colnames(m) # 열이름
rownames(m) # 행이름
colnames(m) <- c('c1','c2','c3','c4') # 열 이름 대입
rownames(m) <- c('r1','r2','r3') # 행 이름 대입

vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)
mat1 <- rbind(vec1,vec2,vec3); mat1 # 벡터의 이름이 바로 행 이름이 된다
mat2 <- cbind(vec1,vec2,vec3); mat2 # 벡터의 이름이 바로 열 이름이 된다
mat1[1,1]
mat1[2,];mat1[,3] 
mat1[1,1,drop=F] # matrix 구조를 떨어뜨리고 싶지 않을 때
mat1[2,,drop=F];mat1[,3,drop=F]

rownames(mat1) <- NULL # 행 이름을 없애고 싶을 때
colnames(mat2) <- NULL # 열 이름을 없애고 싶을 때
mat1;mat2
rownames(mat1) <- c("row1","row2","row3")
colnames(mat1) <- c("col1","col2","col3")
mat1
ls()
mean(x2)
sum(x2)
min(x2)
max(x2)
summary(x2)

mean(x2[2,]) # x2 행렬의 2행의 데이터의 평균
sum(x2[2,])
rowSums(x2); colSums(x2)

apply(x2, 1, sum); apply(x2, 2, sum) # 1 : 행단위 / 2 : 열 단위 , 3번째 항목은 함수(사용자 정의 함수를 적용할 수도 있다.)  #rowSums, colSums 와 동일
?apply
apply(x2, 1, max)
apply(x2, 1, min)
apply(x2, 1, mean)

apply(x2, 2, max)
apply(x2, 2, min)
apply(x2, 2, mean)

#Array 실습 (행, 열 ,층(면)의 3차원)
a1 <- array(1:30, dim=c(2,3,5)) # dim 매개변수를 꼭 주어야 하는 array
a1

a1[1,3,4]
a1[,,3]
a1[,2,]
a1[1,,]
a1 * 100

# factor 실습

score <- c(1,3,2,4,2,1,3,5,1,3,3,3)
class(score) # 주어진 데이터셋에서 데이터의 타입 정보를 나타냄. ? 데이터 프레임에서 여러 데이터 타입을 갖는 경우는?
summary(score)

f_score <- factor(score) # 팩터 형으로 바꿔줌 
class(f_score)
f_score
summary(f_score)
levels(f_score)


f_score1 <- as.factor(score)
class(f_score1)
f_score1
summary(f_score1)
levels(f_score1)


plot(score)
plot(f_score)


data1 <- c("월","수","토","월", "수", "화", "수", "수",
           "목","화")
data1
class(data1)
summary(data1)
day1 <- factor(data1)
day1
class(day1)
summary(day1)
levels(day1)

week.korabbname <- c("일", "월", "화",
                     "수", "목", "금", "토")
day2 <- factor(data1, 
               levels=week.korabbname) # 현재 데이터에는 없더라도 레벨은 갖고 있어야 하는 경우
day2
summary(day2)
levels(day2)



btype <- factor(
  c("A", "O", "AB", "B", "O", "A", "O"), 
  levels=c("A", "B", "O")) # 정해져 있는 레벨에는 AB가 존재하지 않는다. NA(결측치)로 처리
btype
summary(btype)
levels(btype)

gender <- factor(c(1,2,1,1,1,2,1,2), 
                 levels=c(1,2), 
                 labels=c("남성", "여성"))
gender
summary(gender)
levels(gender)



# 내장 데이터셋
data()
iris; head(iris);tail(iris) # 데이터의 일부(6행)를보고 싶은 경우 : head, tail 
View(iris) #데이터셋의 내용을 시각화로 체크해볼 수 있는 함수
str(iris) # 데이터 셋의 구조를 확인할 수 있음
summary(iris)



#Dataframe 실습
no <- c(1,2,3,4)
name <- c('Apple','Banana','Peach','Berry')
qty <- c(5,2,7,9)
price <- c(500,200,200,500)
fruit <- data.frame(no, name, qty, price) # 데이터 프레임 생성, stringsAsFactors : False 가 기본임
str(fruit) #구조 확인
View(fruit) # 내용 비주얼화 확인

fruit[1,]
fruit[-1,]
fruit[,2]
# fruit[,3, drop=F]
fruit[, c(3,4)] #drop 속성을 주지 않아도 구조를 유지한다.
fruit[3,2, drop =F]
fruit[3,1]

fruit[,3]
fruit$qty # 겹대괄호보다 이름을 적어서 사용하는 경우가 더 가독성이 좋다고 할 수 있다.
fruit[[3]]
fruit[3]  # 데이터프레임 형식 유지

str(fruit$qty)
str(fruit[3])

# dataframe exam1
english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
classnum <- c(1,1,2,2)
df_midterm <- data.frame(
  english, math, classnum) # 미리 벡터를 만들어 두었다가 데이터 프레임을 만든 경우
df_midterm
str(df_midterm)
colnames(df_midterm)
rownames(df_midterm)
names(df_midterm)
mean(df_midterm$english) # 영어의 평균
mean(df_midterm$math) #수학의 평균

df_midterm2 <- data.frame(
  c(90, 80, 60, 70), 
  c(50, 60, 100, 20), 
  c(1,1,2,2)) # 바로 벡터를 생성하여 데이터 프레임을 만든 경우
colnames(df_midterm2) # 컬럼 이름은 c함수의 호출식을 컬럼 이름으로 사용했다. 
rownames(df_midterm2)
names(df_midterm2)
df_midterm2
df_midterm2 <- data.frame(
  영어=c(90, 80, 60, 70), 
  수학=c(50, 60, 100, 20), 
  클래스=c(1,1,2,2)) # 벡터를 생성할 때 이름을 만들어서 데이터 프레임을 만든 경우
df_midterm2
df_midterm2$영어

df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6)) # 오류
df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6,1))
str(df)
df
df$var_sum <- df$var1 + df$var2 # 현재는 존재하지 않는 변수.. 새로 추가 (파생변수)
df$var_mean <- df$var_sum/2 # 현재는 존재하지 않는 변수.. 새로 추가 (파생변수)
df$result <- ifelse(df$var1>df$var2, 
                    "var1이 크다", "var1이 작다") # ifelse 함수의 사용 

getwd() # setwd('xxx') # getwd : getworkingdirectioy
 

#csv파일열기
score <- read.csv("data/score.csv")
score
str(score)
score$sum <- 
  score$math+score$english+score$science # 없는 컬럼에 대입하면, 새로운 컬럼이 생성된다.
score$result <- ifelse(score$sum >= 200, 
                       "pass", "fail")
score

summary(score$result)
table(score$result) # summary는 argument에 주어진 범주형,,, 에 따라 달라짐. table은 type에 관계없이 무조건 개수를 센다. 
summary(factor(score$result)) # 범주형으로 바꿔서 summary를 함
score$result = factor(score$result) #result를 factor형으로 바꾸어 대입
str(score)
summary(score)
score$id = as.character(score$id) # character 형으로 바꾸어 재 대입
score$class = factor(score$class) # 펙터 형으로 바꾸어 재 대입

score$grade<-ifelse(score$sum >= 230,"A",
                    ifelse(score$sum >= 215,"B", 
                           ifelse(score$sum >=200,"C","D")))
score

# order() 와 sort()
v <- c(10,3,7,4,8)
sort(v)
order(v)

emp <- read.csv(file.choose())
emp
str(emp)

summary(emp)

emp$job <- as.factor(emp$job)
emp$deptno <- as.factor(emp$deptno)
emp$mgr <- as.factor(emp$mgr)

summary(emp)
View(emp)

# emp에서 직원 이름
emp$ename
emp[,2]
emp[,"ename"] # 숫자 인덱스 대신에 컬럼명을 사용함. 
emp[,2, drop=FALSE] # 데이터 프레임 구조를 유지하고자 할때 
emp[,"ename",drop=F] 
emp[2]
emp["ename"] 

# emp에서 직원이름, 직무, 급여
emp[,c(2,3,6)]
emp[,c("ename","job","sal")] #컬럼명을 사용할 수 있다.
subset(emp,select = c(ename, job, sal)) #subset 함수의 사용
?subset
# emp에서 1,2,3 행 들만
emp[1:3,]
emp[c(1,2,3),]
?head
head(emp)
head(emp, n=1)
# ename이 "KING"인 직원의 모든 정보
emp[9,] # 인덱스를 알고 있을 때 
emp$ename=="KING"
emp[c(F,F,F,F,F,F,F,F,T,F,F,F,F,F,F,F,F,F,F,F),]
# emp$ename=="KING" = c(F,F,F,F,F,F,F,F,T,F,F,F,F,F,F,F,F,F,F,F)
emp[emp$ename=="KING",] # == 등가 연산 , 14개의 전체 행에 대해서 KING인지 아닌지 비교하게 됨
subset(emp,subset=emp$ename=="KING")
subset(emp,emp$ename=="KING") 

is.na(emp$name) # 결측치이면 TRUE, (비어있으면 TRUE) -> 모두가 false인데 logical(0)는 모두 거짓이라는 뜻.
is.na(emp$comm)

# 커미션이 정해지지 않은(NA인 직원, 결측치인 직원)을 받는 직원들의 모든 정보 출력
emp[is.na(emp$comm),] # TRUE 인 경우만 출력
# 커미션을 받는 직원들의 모든 정보 출력
emp[!is.na(emp$comm),] # 논리 부정 연산자 !를 앞에 붙여. 
subset(emp,!is.na(emp$comm)) 
View(emp)
# select ename,sal from emp where sal>=2000
subset(emp, emp$sal>= 2000, 
       c("ename","sal"))
subset(emp, select=c("ename","sal"), 
       subset= emp$sal>= 2000)
emp[emp$sal>=2000,c("ename","sal")]

# select ename,sal from emp where sal between 2000 and 3000
subset(emp, sal>=2000 & sal<=3000, c("ename","sal")) # 컬럼명만 주어도 된다. (데이터프레임$컬럼명도 가능)
emp[emp$sal>=2000 & emp$sal <=3000, c("ename","sal")] # 반드시 데이터프레임$컬럼명으로 접근


y <- c(0,25,50,75,100)
z <- c(50, 50, 50, 50,50)
y == z
y != z
y > z
y < z
y >= z
y <= z
y == 50 # c(50, 50, 50, 50, 50)
y > 50
