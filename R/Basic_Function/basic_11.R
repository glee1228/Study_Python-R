#install.packages("foreign")
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)
setwd("C:\\Users\\user\\Desktop\\공부자료\\R과파이썬으로활용한데이터분석\\알\\data\\실습용_데이터_모음")
raw_welfare<- read.spss(file= "Koweps_hpc10_2015_beta1.sav", to.data.frame=T)

welfare <- raw_welfare

#head(welfare)

welfare<- rename(welfare,
                 sex=h10_g3,
                 birth=h10_g4,
                 marriage=h10_g10,
                 religion = h10_g11,
                 income=p1002_8aq1,
                 code_job=h10_eco9,
                 code_region=h10_reg7)

class(welfare$sex)

table(welfare$sex)

welfare$sex <-ifelse(welfare$sex ==9, NA, welfare$sex)

table(is.na(welfare$sex))

welfare$sex <-ifelse(welfare$sex ==1, "male","female")
table(welfare$sex)

class(welfare$income)

summary(welfare$income)

#qplot(welfare$income)

#qplot(welfare$income)+xlim(0,1000)

summary(welfare$income)

welfare$income <-ifelse(welfare$income %in% c(0,9999),NA,welfare$income)

table(is.na(welfare$income))

#파생변수 만들기 - 나이
welfare$age<-2015-welfare$birth+1
summary(welfare$age)

#파생변수 만들기 - 나이대별 청,중,장년 구분
welfare<-welfare%>%
  mutate(ageg= ifelse(age<30,"young",
                      ifelse(age<=59,"middle","old")))

table(welfare$ageg)


sex_income<-welfare%>%
  filter(!is.na(income))%>%
  group_by(ageg,sex)%>%
  summarise(mean_income=mean(income))
sex_income


ageg_income<-welfare%>%
  filter(!is.na(income))%>%
  group_by(ageg)%>%
  summarise(mean_income =mean(income))

ageg_income

#ggplot(data =ageg_income, aes(x=ageg,y=mean_income))+
#  geom_col()+
#  scale_x_discrete(limits = c("young","middle","old"))


#ggplot(data =ageg_income, aes(x=ageg,y=mean_income,fill=mean_income))+
#  geom_col()+
#  scale_x_discrete(limits = c("young","middle","old"))

#ggplot(data=sex_income,aes(x=ageg,y = mean_income,fill=sex))+
#  geom_col(position="dodge")+
#  scale_x_discrete(limits=c("young","middle","old"))

welfare<-left_join(welfare,list_job,id="code_job")

welfare%>%
  filter(!is.na(code_job))%>%
  select(code_job)%>%
  head(10)

job_income<-welfare%>%
  filter(!is.na(job)&!is.na(income))%>%
  group_by(job)%>%
  summarise(mean_income =mean(income))

head(job_income)
