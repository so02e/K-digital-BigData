# 13장
install.packages("HSAUR")

library(HSAUR)
data("Forbes2000")
ds <- Forbes2000 
ds[!complete.cases(ds),]          # 결측값 확인

str(ds)
head(ds)

table(ds$country)
tmp <- sort(table(ds$country), decreasing=T)
top.10.contry <- tmp[1:10]
top.10.contry                     # 상위 10개국

par(mar=c(8,4,4,2))               # 그래프 여백 조정
barplot(top.10.contry,
        main='기업수 상위 10개국',
        col=rainbow(10),          # 레인보우 팔레트
        las=2
)
par(mar=c(5,4,4,2))

# 업종별 기업 분포
table(ds$category)
tmp <- sort(table(ds$category), decreasing=T)
top.10.category <- tmp[1:10]
top.10.category                    # 상위 10개 업종

par(mar=c(10,4,4,2))               # 그래프 여백 조정
barplot(top.10.category,
        main='기업수 상위 10개 업종',
        col='pink',
        las=2)
par(mar=c(5,4,4,2))

# 업종별 기업자산 분포
tmp <- ds[ds$category %in% names(top.10.category),]
levels(tmp$category)
tmp$category <- factor(tmp$category)
levels(tmp$category)

par(mar=c(10,4,4,2))               # 그래프 여백 조정
boxplot(assets~category, data=tmp,
        ylim=c(0,100),
        xlab='',
        las=2)
par(mar=c(5,4,4,2))


tmp <- ds[order(ds$marketvalue, decreasing=T),]
tmp[1:10,c('name', 'country','category','marketvalue')]


korea <- subset(ds, country=='South Korea')
korea[,c('rank','name','category','marketvalue')]


tmp <- ds[,5:8]
tmp <- tmp[complete.cases(tmp),]  # 결측값 제거
plot(tmp, lower.panel=NULL)       # 산점도
cor(tmp)                          # 상관계수


files <- c('data/ds.2015.csv', 'data/ds.2016.csv','data/ds.2017.csv',
           'data/ds.2018.csv','data/ds.2019.csv')

ds <- NULL
for (f in files) {
  tmp <- read.csv(f, header=T)
  ds <- rbind(ds, tmp) 
  print(f)
}

str(ds)
head(ds)
unique(ds$loc)                             # 관측 장소
range(ds$mdate)                            # 측정 기간

# 열별 결측값 확인
for (i in 3:8) {
  cat(names(ds)[i], sum(is.na(ds[,i])), sum(is.na(ds[,i]))/nrow(ds), '\n')   
}
ds <- ds[,-8]                              # PM25 열 제거
ds <- ds[complete.cases(ds),]              # 결측값 포함 행 제거

mdate <- as.character(ds$mdate)
head(mdate)
ds$year  <- as.numeric(substr(mdate, 1,4))  # 연도
ds$month <- as.numeric(substr(mdate, 5,6))  # 월
ds$hour  <- as.numeric(substr(mdate, 9,10)) # 시간
ds$locname <- NA                            # locname 열을 추가
ds$locname[ds$loc==111123] <- '서울'        # 도시
ds$locname[ds$loc==336111] <- '목포'        # 도시  
ds$locname[ds$loc==632132] <- '강릉'        # 도시

head(ds)


boxplot(PM10~locname, data=ds,
        main='미세먼지 농도 분포')

boxplot(PM10~locname, data=ds,
        main='미세먼지 농도 분포',
        ylim=c(1,100))

library(ggplot2)

tmp.year <- aggregate(ds[,7], by=list(year=ds$year,loc=ds$locname), FUN='mean')
tmp.year$loc = as.factor(tmp.year$loc)
head(tmp.year)

ggplot(tmp.year, aes(x=year,y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('연도별 PM10 농도 변화')+
  ylab('농도')

tmp.month <- aggregate(ds[,7], by=list(month=ds$month,loc=ds$locname), 
                       FUN='mean')
tmp.month$loc = as.factor(tmp.month$loc)
head(tmp.month)

ggplot(tmp.month, aes(x=month,y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=3, shape=19, alpha=0.5)+
  ggtitle('월별 PM10 농도 변화')+
  ylab('농도')


tmp.hour <- aggregate(ds[,7], by=list(hour=ds$hour,loc=ds$locname), FUN='mean')
tmp.hour$loc = as.factor(tmp.hour$loc)
head(tmp.hour)

ggplot(tmp.hour, aes(x=hour,y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=3, shape=19, alpha=0.5)+
  ggtitle('시간별 PM10 농도 변화')+
  ylab('농도')


set.seed(1234)
plot(ds[sample(nrow(ds),5000),3:7], lower.panel=NULL)
cor(ds[,3:7])


tmp.yml <- aggregate(ds[,7], by=list(year=ds$year,month=ds$month,
                                     loc=ds$locname), FUN='mean')

# 가장 미세먼지가 많았던 달
idx <- which(tmp.yml$x==max(tmp.yml$x))
tmp.yml[idx,]

# 가장 미세먼지가 적었던 달
idx <- which(tmp.yml$x==min(tmp.yml$x))
tmp.yml[idx,]








# 상관분석

library(MASS)
str(cats)
?cats
head(cats)
plot(cats$Hwt ~ cats$Bwt, # y축 ~ x축
     col="forestgreen", pch=19,
     xlab="Body Weight (kg)", ylab="Heart Weight (g)",
     main="Body Weight and Heart Weight of Cats")

cor(cats$Bwt, cats$Hwt)
with(cats, cor(Bwt, Hwt)) #어떤 셋이든 cat라는 set을 가지고 적용을 한다. 데이터 셋을 주는 것을 생략할 수 있다. 

cor.test(cats$Bwt, cats$Hwt)
with(cats, cor.test(Bwt, Hwt))
with(cats, cor.test(~ Bwt + Hwt))
cor.test(~ Bwt + Hwt, data=cats)
cor.test(~ Bwt + Hwt, data=cats, subset=(Sex=="F"))
with(cats, cor.test(~ Bwt + Hwt, subset=(Sex=="M")))



str(iris)
cor(iris[-5])

iris.cor <- cor(iris[, 1:4])
class(iris.cor)
str(iris.cor)
iris.cor
iris.cor["Petal.Width", "Petal.Length"]
pairs(iris[, 1:4])
cor.test(iris$Petal.Length, iris$Petal.Width)
cor.test(iris$Sepal.Length, iris$Sepal.Width)
cor.test(iris$Petal.Length, iris$Sepal.Width)
cor.test(iris$Sepal.Length, iris$Petal.Width)

iris.na.test <- iris[, 1:4]
iris.na.test[1,1] <- NA
iris.na.test[3,2] <- NA
iris.na.test[4,3] <- NA
head(iris.na.test)
cor(iris.na.test) # 하나라도 NA를 갖고 있으면, NA가 뜬다. 먼저 결측치가 있는지 찾아보아야 한다. 결측치를 해결하는방법 . 없애거나 정해놓은 값을 채워넣는 작업을 해야 한다.

# 행 자체를 날림
cor(iris.na.test, use="complete.obs")
# 그때그때 상황에 따라서 두 변수에 한해서만 삭제.
cor(iris.na.test, use="pairwise.complete.obs")

install.packages("psych")
library(psych)
corr.test(iris[-5])
print(corr.test(iris[-5]), short=FALSE)

?state.x77
str(state.x77)
head(state.x77)
old.op <- options(digits=2)
cor(state.x77)
options(old.op)



str(mtcars)
head(mtcars)
car_cor <- cor(mtcars)
round(car_cor,2)
install.packages("corrplot")
library(corrplot)
corrplot(car_cor)
corrplot(car_cor, type="lower", order="hclust", tl.srt=45)
corrplot(car_cor, method="ellipse", type="lower", order="hclust", tl.srt=45, diag=F)
corrplot(car_cor, method="number", type="lower", order="hclust", tl.srt=45, diag=F)
corrplot(car_cor, method="shade", type="lower", order="hclust", tl.srt=45, diag=F)
corrplot(car_cor, method="color", type="lower", order="hclust", tl.srt=45, diag=F)
corrplot(car_cor, method="pie", type="lower", order="hclust", tl.srt=45, diag=F)
corrplot(car_cor, method="color", type="lower", order="hclust", tl.srt=45)
corrplot(car_cor, method="color", addCoef.col="black", type="lower", order="hclust", tl.srt=45)
corrplot(car_cor, method="color", addCoef.col="black", type="lower", diag=F, tl.srt=45)



library(psych)
pairs.panels(state.x77, bg="red", pch=21, hist.col="gold", 
             main="Correlation Plot of US States Data")


install.packages("corrgram")
library(corrgram)
corrgram(state.x77, order=TRUE, lower.panel=panel.shade, 
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Corrgram of US States Data")


cols <- colorRampPalette(c("darkgoldenrod4", "burlywood1", 
                           "darkkhaki", "darkgreen"))
corrgram(state.x77, order=FALSE, col.regions=cols,
         lower.panel=panel.pie, upper.panel=panel.conf, 
         text.panel=panel.txt, main="Corrgram of US States Data")




cor(Orange$circumference, Orange$age)
plot(Orange$circumference, Orange$age, col = "red", pch = 19 )
cor.test(Orange$circumference, Orange$age)






######################
## 단순선형회귀분석 ##
######################

# R에 내장된 women 데이터셋으로 키에 따른 몸무게 예측 분석

str(women)
head(women)
?women

# 선형관계 확인
plot(women, xlab="키(in)", ylab="몸무게(lbs)")


## 0부터 시작하도록
plot(women$height, women$weight, xlim=c(0, 
                                        max(women$height)), ylim=c(0, max(women$weight)),
     xlab="키(in)", ylab="몸무게(lbs)")

# 회귀선 그리기
plot(women$height, women$weight, xlab="키(in)", ylab="몸무게(lbs)")
abline(lm(weight~height, data=women), col="red", lty=2)

cor(women$height, women$weight)
cor(women$weight, women$heigh)

# 회귀분석
women.lm <- lm(weight~height, data=women)
women.lm
summary(women.lm)


# 회귀식(모델)
# wight = -87.51667 + 3.45000*height
# 키값에 따른 몸무게 예측
h = c(100, 120, 140)
-87.51667 + 3.45000*h

predict(women.lm, data.frame(height=h))




# R에 내장된 cars 데이터셋으로 자동차 속도에 따른 정지 거리 예측

str(cars)
head(cars)

x <- cars$speed
y <- cars$dist

# 선형관계 확인
plot(x, y, xlab="속도", ylab="정지 거리")


# 수리적 모형으로 해 구하기
cars.lm <- lm(y~x)
cars.lm
summary(cars.lm)
str(cars.lm)
names(cars.lm)
(intercept <- cars.lm$coefficients[1])
(slope <- cars.lm$coefficients[2])

# 회귀선 그리기
plot(x, y, xlab="속도", ylab="정지 거리")
abline(a=intercept, b=slope, col="red", lty=2)


# 예측
x <- 35
y.hat <- slope*x + intercept
y.hat 


predict(cars.lm, newdata=data.frame(x=35))
predict.lm(cars.lm, newdata=data.frame(x=35))


(cars.lm2 <- lm(dist ~ speed, data=cars))
predict(cars.lm2, newdata=data.frame(speed=35))
predict.lm(cars.lm2, newdata=data.frame(speed=35))


# factory.csv 파일을 읽어서 회귀분석
fdata <- read.csv("data/factory.csv")
str(fdata)
fdata
plot(fdata$age, fdata$cost, xlab="사용연도", ylab="정비비용", pch=19, col="blue", cex.lab=1.5)
title("사용연도와 정비비용", cex.main=2, col.main="red") 

factory.lm <- lm(cost ~ age, data=fdata)
abline(factory.lm, col="red")

summary(factory.lm)

# 회귀 방정식으로 예측
29.107 + 13.637 * 4 
predict(factory.lm, newdata=data.frame(age=4) )

names(factory.lm)
sum(factory.lm$residuals) # 잔차들의 합

cbind(fdata, factory.lm$residuals, factory.lm$fitted.values)

fdata[,2] == round(factory.lm$residuals + factory.lm$fitted.values)



# 데이터들을 표준화 시켜서 회귀분석
attach(fdata)
st_fdata <- cbind(fdata, st_age=(age-mean(age))/sd(age), st_cost=(cost-mean(cost))/sd(cost))
attach(st_fdata)
st_factory.lm <- lm(st_cost ~ st_age, data=st_fdata)  
plot(st_age, st_cost, xlab="사용연도", ylab="정비비용", pch=19, col="blue", cex.lab=1.5)
title("변수 표준화 후의 사용연도와 정비비용", cex.main=2, col.main="red") 
abline(st_factory.lm, col="red")
summary(st_factory.lm)
detach(st_fdata)
predict(st_factory.lm, newdata=data.frame(st_age=4) )



attach(fdata)
st_fdata <- cbind(fdata, st_age=scale(age), st_cost=scalecost)
attach(st_fdata)
st_factory.lm <- lm(st_cost ~ st_age, data=st_fdata)  
plot(st_age, st_cost, xlab="사용연도", ylab="정비비용", pch=19, col="blue", cex.lab=1.5)
title("변수 표준화 후의 사용연도와 정비비용", cex.main=2, col.main="red") 
abline(st_factory.lm, col="red")
summary(st_factory.lm)
detach(st_fdata)
predict(st_factory.lm, newdata=data.frame(st_age=4) )



# Orange 데이터셋 : 각 나무의 종류, 나무의 나이, 나무 둘레 길이에 대한 35개의 관측값으로 구성 
head(Orange)
data(Orange)
head(Orange)
model <- lm(circumference ~ age, Orange) 
model
# 회귀 계수만 출력
coef(model)
# 잔차 추출
r <- residuals(model)
r[1:4] 

# 모델을 적용하여 예측값 구하기
f <- fitted(model) # predict()
r <- residuals(model)

# 예측 데이터값 + 잔차
f[1:4] + r[1:4] 
# 실제 데이터값
Orange[1:4,'circumference'] 



# 생성된 모델로 지정된 독립변수 값에 대한 종속변수 값 예측하기
predict.lm(model, newdata = data.frame(age = 100))


# 결정계수는 상관계수의 제곱
summary(model)
cor(Orange$circumference, Orange$age)
cor(Orange$circumference, Orange$age) ^ 2


# 단순회귀 모델의 시각화
plot(Orange$age, Orange$circumference)
abline(coef(model))
