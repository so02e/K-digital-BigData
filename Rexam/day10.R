# 한국어 형태소 분석 패키지 설치
# Rtools 설치
# https://cran.r-project.org/bin/windows/Rtools/index.html
install.packages("Sejong")
install.packages("hash")
install.packages("tau")
install.packages("devtools")

# github 버전 설치
install.packages("remotes")
# 64bit 에서만 동작합니다.
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

library(KoNLP)
useSejongDic()
R.version

word_data <- readLines("data/애국가(가사).txt")
word_data

word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2 # 명사만 뽑아내는 extractNoun. 
word_data3 <- extractNoun(word_data)
word_data3

# 제대로 명사만 추출하지 않는 경우, 딕셔너리를 빌드 딕셔너리를 이용한다.
add_words <- c("백두산", "남산", "철갑", "가을", "달") #등록하고자하는 단어 벡터
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)
# 단어 / 품사(ncn을 repeat 함수 이용하여 ) / 로드되어있는 딕셔너리에만 적용 = T 
word_data3 <- extractNoun(word_data)
word_data3

undata <- unlist(word_data3)
undata

word_table <- table(undata)
word_table

undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
word_table2 <- table(undata2)
word_table2

final <- sort(word_table2, decreasing = T)

head(final, 10)

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")
SimplePos22("대한민국의 영토는 한반도와 그 부속도서로 한다")
SimplePos09("대한민국의 영토는 한반도와 그 부속도서로 한다")
