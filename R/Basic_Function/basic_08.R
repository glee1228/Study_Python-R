library(dplyr)
setwd("C:\\Users\\user\\Desktop\\공부자료\\R과파이썬으로활용한데이터분석\\알\\data\\실습용_데이터_모음")

test1 <- data.frame(id=c(1,2,3,4,5),
                    midterm=c(60,70,80,90,50))
test1
test2<- data.frame(id=c(1,2,3,4,5),
                   final=c(70,70,50,80,90))
test2
point <- left_join(test1,test2,by="id")
point

exam = read.csv("csv_exam.csv")
exam

name <- data.frame(class=c(1,2,3,4,5),
                   teacher=c("kim","lee","park","choi","jung"))
name

exam_new <- left_join(exam,name,by="class")
exam_new

fuel <- data.frame(fl = c("c","d","e","p","r"),
                   price_fl=c(2.35,2.38,2.11,2.76,2.22),
                   stringAsFactors=F)

fuel


library(ggplot2)
mpg<-as.data.frame(ggplot2::mpg)
head(mpg)

mpg<-left_join(mpg,fuel,by="fl")
mpg
mpg%>%
  select(model,fl,price_fl)%>% 
  head(5)

