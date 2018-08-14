------1~4호선 승하차 승객수 

setwd("C:\\Users\\user\\Desktop\\공부자료\\R과파이썬으로활용한데이터분석\\알\\data\\실습용_데이터_모음")

passenger<- read.csv("1-4호선승하차승객수.csv")

passenger%>%
  mutate(노선색상=
                ifelse(노선번호=="line_1","블루라인",
             ifelse(노선번호=="line_2","그린라인",
             ifelse(노선번호=="line_3","레드라인",
             "옐로라인"))))
