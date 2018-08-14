---------------2018base.csv 


setwd("C:\\Users\\user\\Desktop\\공부자료\\R과파이썬으로활용한데이터분석\\알\\data\\실습용_데이터_모음")

base<- read.csv("2018base.csv")
str(base)
base=base%>%
  group_by("선수")%>%
  mutate("타율"=안타/타수)
  
base=base%>%
  mutate("X1루타"=안타-(X2루타+X3루타+홈런))
head(base)

base =base[,c("선수","팀","게임수","타석","타수","득점","안타","X1루타","X2루타","X3루타","홈런","타점","타율")]

base=base%>% 
  mutate("루타수"=(X1루타+(2*X2루타)+(3*X3루타)+(4*홈런)))

base=base%>%
  mutate("장타율"=타수/루타수)

base%>%
  arrange(desc(장타율))%>%
  head(5)
base%>%
  arrange(desc(타율))%>%
  head(5)
base%>%
  arrange(desc(홈런))%>%
  head(5)

