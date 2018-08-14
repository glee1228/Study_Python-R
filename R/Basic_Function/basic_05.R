setwd("C:\\Users\\user\\Desktop\\공부자료\\R과파이썬으로활용한데이터분석\\알\\data\\실습용_데이터_모음")

exam<- read.csv("csv_exam.csv")
exam

exam%>% filter(class==1)
exam%>% filter(class==2)
str(exam)

class1 <-exam%>% filter(class==1)
class2 <-exam%>% filter(class==2)

mean(class1$math)
mean(class2$math)
-------------혼자서해보기(filter)
---------------Q1. 

library(ggplot2)
mpg = as.data.frame(ggplot2::mpg)
str(mpg)
displ4<-mpg%>% filter(displ==4)
displ4
mean(displ4$hwy)
displ5<-mpg%>% filter(displ==5)
mean(displ5$hwy)

---------------Q2.

audi<-mpg%>% filter(manufacturer=='audi')
toyota<-mpg%>% filter(manufacturer=='toyota')
mean(audi$cty)
mean(toyota$cty)

---------------Q3.

chevrolet<-mpg%>% filter(manufacturer=='chevrolet')
ford<-mpg%>% filter(manufacturer=='ford')
honda<-mpg%>% filter(manufacturer=='honda')
mean(chevrolet$hwy)
mean(ford$hwy)
mean(honda$hwy)

exam %>% select(math)
exam %>% select(english)

exam %>% select(class,math,english)

exam %>% select(-math)

exam %>% filter(class==1) %>% select (english)

str(mpg)
-------------혼자서해보기(select)

-----------------Q1.
suv<-mpg %>% filter(class=='suv')
compact<-mpg %>% filter(class=='compact')

-----------------Q2.
mean(suv$cty)
mean(compact$cty)


exam %>% arrange(math)
exam %>% arrange(desc(math))

exam %>% arrange(class,math)

mpg%>% arrange(desc(hwy)) %>%filter(manufacturer=='audi') %>% head(5)

exam %>%
  mutate(total = math+english+science,
         mean = (math+english+science)/3 ) %>%  head

exam %>%
  mutate(test = ifelse(science>=60 , "pass","fail")) %>% head

-------------혼자서해보기(mutate,arrange)

-----------------Q1.
mpg2 <- mpg
mpg2%>% mutate(FE = cty+hwy,mean_FE = FE/2)%>% arrange(desc(mean_FE)) %>%head(3)



exam %>% summarise(mean_math = mean(math))
exam %>% group_by(class) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())

mpg %>% 
  group_by(manufacturer, drv) %>%
  summarise(mean_cty = mean(cty)) %>%
  head(10)

mpg %>%
  group_by(manufacturer) %>%
  filter(class=="suv") %>%
  mutate(FE = (cty+hwy)/2) %>%
  arrange(desc(FE)) %>%
  head(10)
-------------------------혼자서해보기

---------------------Q1.
mpg %>%
  group_by(class)%>%
  summarise(mean_cty = mean(cty))

---------------------Q2.
mpg %>%
  group_by(class)%>%
  summarise(mean_cty = mean(cty))%>%
  arrange(desc(mean_cty))

---------------------Q3.
mpg %>%
  group_by(manufacturer)%>%
  summarise(mean_hwy = mean(hwy))%>%
  arrange(desc(mean_hwy))
  

---------------------Q4.
mpg%>%
  filter(class=="compact") %>%
  group_by(manufacturer) %>%
  summarise(n=n())

test1<-data.frame(id = c(1,2,3,4,5),
                  midterm =c(60,80,70,90,85))

test2<-data.frame(id=c(1,2,3,4,5),
                  final=c(70,83,65,95,80))

total <- left_join(test1,test2, by ="id")
total

name <- data.frame(class=c(1,2,3,4,5),teacher=c("kim","lee","park","choi","jung"))
name

exam_new <- left_join(exam,name, by="class")
exam_new



