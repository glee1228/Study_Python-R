#------1~4호선 승하차 승객수 

setwd("C:\\Users\\user\\Desktop\\공부자료\\R과파이썬으로활용한데이터분석\\알\\data\\실습용_데이터_모음")

passenger<- read.csv("1-4호선승하차승객수.csv")

passenger%>%
  mutate(노선색상=
                ifelse(노선번호=="line_1","블루라인",
             ifelse(노선번호=="line_2","그린라인",
             ifelse(노선번호=="line_3","레드라인",
             "옐로라인"))))


#노선별 승차인원수 합계

passenger%>%
  group_by(노선번호)%>%
  summarise(sum_ride= sum(승차))

#노선별 하차인원수 합계

passenger%>%
  group_by(노선번호)%>%
  summarise(sum_quit=sum(하차))

#노선번호 상관없이 승차

sum_tot=passenger%>%
  summarise(sum_total_ride=sum(승차))

#노선번호 상관없이 하차

sum_quit=passenger%>%
  summarise(sum_total_quit=sum(하차))

#노선번호 상관없이 승차 하차
all_ride_quit <-data.frame(승차=sum_tot,
                             하차=sum_quit)
all_ride_quit

#노선 번호별 승차+하차
passenger%>%
  group_by(노선번호)%>%
  summarise(승하차=sum(승차+하차))

#노선 번호별 승차인원 합계
passenger%>%
  group_by(노선번호)%>%
  summarise(승차=sum(승차))

#노선 번호별 하차인원 합계
passenger%>%
  group_by(노선번호)%>%
  summarise(하차=sum(하차))

#각 시간대별 승차인원의 합을 3구간으로 나누어 혼잡,보통,여유로 표시(기준임의설정)
passenger%>%
  mutate(시간대=ifelse(nchar(시간)==3,substr(시간,1,1),substr(시간,1,2)))%>%
  group_by(시간대)%>%
  summarise(승하차=sum(승차+하차))%>%
  mutate(혼잡도=ifelse(승하차>=10000000,"혼잡",
            ifelse(승하차>8000000,"보통","여유")))