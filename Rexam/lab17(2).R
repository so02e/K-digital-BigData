library(ggplot2)
# 1-1
mpg %>% str()

# 1-2
mpg %>% nrow()
mpg %>% ncol()

# 1-3
mpg %>% head(.,10)
mpg %>% head(10)

# 1-4
mpg %>% tail(.,10)
mpg %>% tail(10)

# 1-5
mpg %>% View()

# 1-6
mpg %>% summary()

# 1-7
mpg %>% count(manufacturer) 

# 1-8
mpg %>% count(manufacturer, model) 

# 2-1
mpgnew <- mpg %>% rename(city = cty, highway = hwy)

# 2-2
mpgnew %>% head()

# 3-1
str(midwest)
midwest %>% as.data.frame() %>%  str()

# 3-2
midwest  <- midwest %>% rename(total = poptotal, asian = popasian)

# 3-3
midwest  <- midwest %>%
  mutate(percentage = asian/total*100)
head(midwest)

# 3-4
midwest <- midwest %>%
  mutate(size = ifelse(percentage > mean(percentage), "large", "small")) 
head(midwest)

# 4-1
mpg %>% 
  mutate(Classification = ifelse(displ <= 4, "배기량이 4이하인 자동차", "배기량이 5이상인 자동차")) %>% 
  group_by(Classification) %>% 
  summarise(mean_hwy = mean(hwy))

mpg %>% 
  mutate(Classification = ifelse(displ <= 4, "배기량이 4이하인 자동차", "배기량이 5이상인 자동차")) %>% 
  group_by(Classification) %>% 
  summarise(mean_hwy = mean(hwy, na.rm=T))

# 4-2
mpg %>% 
  filter(manufacturer == "audi" | manufacturer == "toyota") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty))

# 4-3
mpg %>% 
  filter(manufacturer == "chevrolet" | manufacturer == "ford" | manufacturer == "honda") %>%
  summarise(mean_hwy = mean(hwy))

# 5-1
mpg_new <- mpg %>% select(class, cty) %>%   head()
(mpg_new <- mpg %>% select(class, cty)) %>%   head()

# 5-2
mpg_new %>%
  filter(class == "suv" | class == "compact") %>% 
  group_by(class) %>% 
  summarise(Max_cty = max(cty)) %>% 
  arrange(desc(Max_cty)) %>%  
  head(1)

# 6-1
mpg %>% 
  filter(manufacturer == "audi") %>% 
  group_by(model) %>% 
  summarise(Max_hwy = max(hwy)) %>%
  arrange(desc(Max_hwy)) %>%  
  head(1)

# 6-2
mpg %>% 
  filter(manufacturer == "audi") %>% 
  arrange(desc(hwy)) %>%
  head(5)
