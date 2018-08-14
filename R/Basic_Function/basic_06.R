------혼자서 해보기
------------분석도전

Q1.
midwest <- as.data.frame(ggplot2::midwest)
midwest <-midwest%>%
  mutate(minor_per = ((poptotal-popadults)/poptotal)*100)


Q2.
midwest <- midwest%>%
  arrange(desc(minor_per))
midwest%>%head(10)

Q3.
midwest<-midwest%>% 
  mutate(minor_grade=ifelse(minor_per>=40,"large",ifelse(minor_per>=30,"middle","small")))

#View(midwest)

Q4.
midwest2<-as.data.frame(ggplot2::midwest)
midwest2<-midwest2%>%
  mutate(asian_per=((popasian/poptotal)*100))%>%
  arrange(asian_per)
#attach(midwest2)

colnames(midwest2)

midwest2[,c(2,3,29)]