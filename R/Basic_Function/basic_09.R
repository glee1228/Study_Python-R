setwd("C:\\Users\\user\\Desktop\\공부자료\\R과파이썬으로활용한데이터분석\\알\\data\\실습용_데이터_모음")

df <- data.frame(sex=c("M","F",NA,"M","F"),
                 score=c(5,4,3,4,NA))
df

is.na(df)

table(is.na(df))

table(is.na(df$sex))

table(is.na(df$score))

mean(df$score)

sum(df$score)

library(dplyr)

df_nomiss<-df%>% filter(!is.na(score))

df_nomiss<- df%>% filter(!is.na(score)&!is.na(sex))
df_nomiss

df_nomiss2 <- na.omit(df)
df_nomiss2

mean(df$score,na.rm=T)

sum(df$score,na.rm=T)

exam <-read.csv("csv_exam.csv")
exam[c(3,8,15),"math"]<-NA
exam
exam%>%
  summarise(mean_math=mean(math))

exam%>% summarise(mean_math = mean(math,na.rm=T))

exam$math <-ifelse(is.na(exam$math),55,exam$math)
exam

#상자그림으로 극단치 기준 정해서 제거하기

mpg<- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)

mpg$hwy<-ifelse(mpg$hwy>40,NA,mpg$hwy)
mpg$hwy

boxplot(mpg$hwy)$stats

table(is.na(mpg$hwy))

mpg%>%
  group_by(drv)%>%
  summarise(mean_hwy = mean(hwy,na.rm=T))


#mpg데이터를 이용하여 분석 문제 해결
#drv변수와 cty변수에 이상치 및 존재할수없는 값을 할당 한 후, 분석

mpg<-as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"]<-"k"
mpg[c(29,43,129,203),"cty"]<-c(3,4,39,42)

boxplot(mpg$cty)$stats
mpg$cty<-ifelse(mpg$cty>27|mpg$cty<8,NA,mpg$cty)
#mpg$drv
mpg$drv<-ifelse(mpg$drv!="r"&mpg$drv!="4"&mpg$drv!="f",NA,mpg$drv)
mpg$drv
mpg%>%
  filter(!is.na(drv)&!is.na(cty))%>%
  group_by(drv)%>% 
  summarise(mean_cty=mean(cty))