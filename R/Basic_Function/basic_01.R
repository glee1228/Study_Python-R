#1
a=c(80,60,70,50,90)
#2
mean(a)

#3
b=mean(a)
b

v_character <- c('사과','복숭아','사과','오렌지','사과','오렌지','복숭아')
v_character
v_factor<-factor(v_character)
v_factor
mode(v_factor)
class(v_factor)
str(v_factor)

#
ex_label <- c("하하","중하","중","중상","상상")

ordered_factor <- factor(ex_label, order=T)

ordered_factor 

factor(ex_label, levels=c("하하","중하","중","중상","상상"))



#1
data4 <- seq(from = as.Date('2015-01-01'), to = as.Date('2015-01-31'), by=1)
data4

#2
vec1 <- c("사과","배","감","버섯","고구마")
vec1
vec1[-3]

#3
vec1 <- c("봄","여름","가을","겨울")
vec2 <- c("봄","여름","늦여름","초가을")
setdiff(vec1,vec2)
union(vec1,vec2)

#4
v1<-c(1:10)
v1

#5
v1[1:5]

#6
v1[3:7]

#7
v1[-c(3:7)]

#8
v1[3]<-0
v1[6]<-0
v1

#9
v1[9]<-0
v1

#10
class(v1)
v1<-as.numeric(v1)
class(v1)
v1

# v1의 맨 앞에 0을 추가하여 출력(v1은 변경하지 않음)
v1<-c(0,v1)
v1

# v1의 11번째에 11을 추가. v1을 변경함
v1[11]<-11
v1

# v1의 맨 뒤에 14~20을 추가. v1을 변경함
v1<-c(v1,14:20)
v1

# v1에서 위에서 추가한 11과 14사이에 12, 13을 추가.
v1<-c(v1[1:11],12,13,v1[12:18])
v1

# v2에 100을 대입
v2<-100

# v1과 v2를 더하기
v1+v2

# v2에 100, 200, 300을 대입
v2<-c(100,200,300)

# v1과 v2를 더하기
v1+v2

# v1과 v2의 합집합 출력하기
union(v1,v2)

# v1에서 v2의 차집합 출력하기
setdiff(v1,v2)

# v2에서 v1의 교집합 출력하기
intersect(v1,v2)

# v2의 열 이름 (A, B, C) 지정하기
names(v2)<-c("A","B","C")
v2

# v3에 5부터 5의 간격으로 50까지 할당
v3<-seq(5,50,5)

# v4에 5 6 5 6 5 6 을 할당
v4<-c(5,6,5,6,5,6)

# v5에 -1 -1 -1 0 0 0 1 1 1 을 할당
v5<-c(-1,-1,-1,0,0,0,1,1,1)

# v5의 길이 출력
length(v5)

# v3에 15가 있는지 검색
v3==15
v3[3]

# v3에 55가 있는지 검색하여 결과를 변수 vv에 대입
vv<-v3[3]
vv



#
list1 <- list(
name = 'James Seo',
address='Seoul',
tel = '010-8706-4712',
pay = 500)
list1
list1[[1]]
list1[[2]]
list1[[3]]

df_midterm <- data.frame(english=c(90,80,60,70), math = c(50,60,100,20), class = c(1,1,2,2))
df_midterm

sales2 <- matrix(c(1,'Apple',500,5,
                          2,'Peach',200,2,
                          3,'Banana',100,4,
                          4,'Grape',50,7),nrow=4,byrow=T)
sales2
df1 <- data.frame(sales2)  
df1
names(df1) <- c('NO','NAME','PRICE','QTY') 
df1

