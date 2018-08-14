no = c(1,2,3)
name = c("apple","banana","peach")
price = c(100,200,300)

df1 <- data.frame(NO=no,NAME=name,PRICE=price)
df1

no = c(10,20,30)
name=c("train","car","airplane")
price=c(1000,2000,3000)

df2 <- data.frame(NO=no,NAME=name,PRICE=price)
df2

name=c("김길동","강길동","박길동")
kor=c(100,90,85)
mat=c(90,95,98)
eng=c(80,98,100)
s <-data.frame(NAME=name,KOR=kor,MAT=mat,ENG=eng)
s
colnames(s)
s[,c(1,2)]
s[,c(1,3)]
s$NAME
subset(s,KOR>=90)
subset(s,NAME=="박길동")
newdata<-data.frame(NAME="최길동",KOR=80,MAT=90,ENG=93)
s<-rbind(s,newdata)
s
t <- s[c(2,3,4),c(1,2,3)]
t <- cbind(t,data.frame(SCI=c(88,80,94)))
ncol(t)
t[c(1,3),]
t[c(2:4)]
t[c(1,4,2,3)]

merge(s,t)
merge(s,t,all=T)
cbind(s,t)
cbind(t,s)

tt<-t[,c(1,2,3)]
ss<-s[,c(1,2,3)]
rbind(tt,ss)
rbind(ss,tt)

