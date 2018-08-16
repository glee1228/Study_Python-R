#install.packages("foreign")
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)
setwd("C:\\Users\\user\\Desktop\\공부자료\\R과파이썬으로활용한데이터분석\\알\\data\\실습용_데이터_모음")
#raw_welfare<-read.spss(file = "Koweps_hpc10_2015_beta1.sav",to.data.frame=T)

#welfare<-raw_welfare

#head(welfare)
#tail(welfare)
#View(welfare)
#dim(welfare)
#str(welfare)
#summary(welfare)

#welfare<-rename(welfare,
#                sex=h10_g3,
#                birth=h10_g4,
#                marriage=h10_g10,
#                religion=h10_g11,
#                income=p1002_8aq1,
#                code_job=h10_eco9,
#                code_region=h10_reg7)
#str(welfare)

#class(welfare$birth)
#summary(welfare$birth)

#qplot(welfare$birth)

#table(is.na(welfare$birth))

#welfare$birth<-ifelse(welfare$birth==9999,NA,welfare$birth)
#table(is.na(welfare$birth))
#welfare$age<-2015-welfare$birth+1
#qplot(welfare$age)

age_income<- welfare%>%
  filter(!is.na(income))%>%
  group_by(age)%>%
  summarise(mean_income=mean(income))

#ggplot(data=age_income,aes(x=age,y=mean_income,fill=mean_income))+geom_col()

welfare<-welfare%>%
  mutate(ageg =ifelse(age<30,"young",
                  ifelse(age<=59,"middle","old")))

table(welfare$ageg)

