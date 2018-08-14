setwd("C:\\Users\\user\\Desktop\\공부자료\\R과파이썬으로활용한데이터분석\\알\\data\\실습용_데이터_모음")

exam<- read.csv("csv_exam.csv")
head(exam)

head(exam,10)

tail(exam)

tail(exam,10)

#View(exam)

dim(exam)

str(exam)

summary(exam)


library(ggplot2)
mpg<-as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)

dim(mpg)

str(mpg)

library(dplyr)

df_raw<-data.frame(var1 = c(1,2,1),
                   var2 = c(2,3,2))

df_raw

df_new<-df_raw
df_new

df_new<-rename(df_new,v2=var2)
df_new

tmp<-as.data.frame(ggplot2::mpg)
tmp<-rename(tmp,city=cty,highway=hwy)
head(tmp)

df<-data.frame(var1 = c(4,3,8),
               var2 = c(2,6,1))
df

df$var_sum <- df$var1+df$var2
df$var_sum

df$var_mean<- (df$var1+df$var2)2
df

mpg$total<-(mpg$cty+mpg$hwy)/2
head(mpg)

summary(mpg$total)
hist(mpg$total)

ifelse(mpg$total>=20,"pass","fail")

mpg$test<-ifelse(mpg$total>=20,"pass","fail")

head(mpg,20)

table(mpg$test)
library(ggplot2)
qplot(mpg$test)

midwest2<-as.data.frame(ggplot2::midwest)
midwest2
midwest2<-rename(midwest2,total=poptotal)
midwest2<-rename(midwest2,asian=popasian)
midwest2$asian_percent<-(midwest2$asian/midwest2$total)

hist(midwest2$asian_percent)
summary(midwest2$asian_percent)

head(midwest2$total)
head(midwest2$asian)
midwest2$asian_many<-ifelse(midwest2$asian_percent>0.004872,"large","small")

qplot(midwest2$asian_many)


