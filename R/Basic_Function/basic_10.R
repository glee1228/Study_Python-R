setwd("C:\\Users\\user\\Desktop\\공부자료\\R과파이썬으로활용한데이터분석\\알\\data\\실습용_데이터_모음")

library(ggplot2)

#ggplot(data=mpg,aes(x=displ,y=hwy))+geom_point()

#ggplot(data=mpg,aes(x=displ,y=hwy))+geom_point()+xlim(3,6)

#ggplot(data=mpg,aes(x=displ,y=hwy))+geom_point()+xlim(3,6)+ylim(10,30)
'''
ggplot(data=mpg,aes(x=displ,y=hwy))+
  geom_point()+
  xlim(3,6)+
  ylim(10,30)

'''
#mpg데이터의 cty(도시 연비)와 hwy(고속도로 연비)간의 어떤 관계가 있는지 알아보려고 합니다.
#x축은 cty, y축은 hwy로 된 산점도를 만들어보세요

ggplot(data=mpg,aes(x=cty,y=hwy))+geom_point()


#미국 지역별 인구통계 정보를 담은 midwest데이터를 이용해서 전체 인구와 아시아인 인구간에 
#어떤 관계가 있는지 알아보려고 합니다. x축은 poptotal(전체인구), y축은 popasian(아시아인 인구)
#로 된 산점도를 만들어보세요. 전체인구는 50만 명 이하, 아시아인 인구는 1만명 이하인 지역만 산점도에 표시되게 설정하세요

#ggplot(data=midwest,aes(x=poptotal,y=popasian))+geom_point()+xlim(0,5*1e+05)+ylim(0,1e+04)



library(dplyr)

df_mpg<-mpg%>%
  group_by(drv)%>%
  summarise(mean_hwy=mean(hwy))

df_mpg
#그래프생성
#ggplot(data=df_mpg,aes(x=drv,y=mean_hwy))+geom_col()
#크기 순으로 정렬하기
#ggplot(data=df_mpg,aes(x=reorder(drv,-mean_hwy),y=mean_hwy))+geom_col()
#빈도를 막대의 길이로 표현한 그래프
#ggplot(data=mpg,aes(x=drv))+geom_bar()
#ggplot(data=mpg,aes(x=hwy))+geom_bar()

#어떤 회사에서 생산한 suv 차종의 도시 연비가 높은지, suv차종을 대상으로 평균 cty가 가장 높은 회사 다섯곳을 막대 그래프로 표시해보세요. 막대는 연비가 높은 순으로 정렬하세요

mpg3=mpg<-as.data.frame(ggplot2::mpg)
mpg3<-mpg3%>%
  filter(class=="suv")%>%
  group_by(manufacturer)%>%
  summarise(mean_cty=mean(cty))%>%
  arrange(desc(mean_cty))%>%
  head(5)
#ggplot(data=mpg3,aes(x=manufacturer,y=mean_cty))+geom_col()
#ggplot(data=mpg3,aes(x=reorder(manufacturer,-mean_cty),y=mean_cty,fill=mean_cty))+geom_col()
#자동차 중에 어떤 class가 가장 많은지 알아보려고 합니다.
#자동차 종류별 빈도를 표현한 막대 그래프를 만들어 보세요.

#ggplot(data=mpg,aes(x=class,fill=class))+geom_bar()

#시계열 그래프 만들기
#ggplot(data=economics,aes(x=date,y=unemploy))+geom_line()
#ggplot(data=economics,aes(x=date,y=psavert))+geom_line()

#ggplot(data=mpg,aes(x=drv,y=hwy))+geom_boxplot()

