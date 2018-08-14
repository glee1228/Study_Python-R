setwd("C:\\Users\\user\\Desktop\\공부자료\\R과파이썬으로활용한데이터분석\\알\\data\\실습용_데이터_모음")
list.files()
input5 <- readLines('scan_4.txt')
input5
fruits <- read.table('fruits.txt')
fruits

ftuits <-read.table('fruits.txt',header=T)
fruits

fruit2 <-read.table('fruits_2.txt')
fruit2
fruit2 <- read.table('fruits_2.txt',skip=2)
fruit2

fruit2 <-read.table('fruits_2.txt',nrows=2)
fruit2

fruits3<-read.table('fruits.txt',header=T,nrows=2)
fruits3

fruits3<-read.table('fruits.txt',header=F,skip=2,nrows=2)
fruits3

fruit3<-read.csv('fruits_3.csv')
fruit3

fruit4<-read.csv('fruits_4.csv')
fruit4

fruit4<-read.csv('fruits_4.csv',header=F)
fruit4

label<-c('NO','NAME','PRICE','QTY')
fruit4<-read.csv('fruits_4.csv',header=F,col.names=label)
fruit4

df_midterm <- data.frame(english=c(90,80,60,70),
                         math=c(50,60,100,20),
                         class=c(1,1,2,2))
df_midterm
write.csv(df_midterm,file="df_midterm.csv")

library(googleVis)
library(sqldf)

Fruits
write.csv(Fruits,"Fruits_sql.csv",quote=F,row.names=F)
fruits_2 = read.csv.sql("Fruits_sql.csv",sql="SELECT * FROM file WHERE Year=2008")
fruits_2

library(readxl)
df_exam <-read_excel("excel_exam.xlsx")
df_exam

df_exam_novar <-read_excel("excel_exam_novar.xlsx",col_names=F)
df_exam_novar

df_exam_sheet <-read_excel("excel_exam_sheet.xlsx",sheet=3)
df_exam_sheet

fruits6 <-read.delim("clipboard",header=T)
fruits6

csv_url<-"http://viewportsizes.com/devices.csv"
csv_df <-read.table(file=csv_url,sep=",",header=T,stringsAsFactors = F)

str(csv_df)

url<-"http://openapi.seoul.go.kr:8088"

key<-"4f50676872676c6537354a624e6d61"

api_url<-paste(url,key,"xml","octastatapi419","1","26",sep="/")

api_url


library(XML)

#parsedXml<-xmlParse(api_url)
#rowXml<- getNodeSet(parsedXml,"//row")

#api_data<- xmlToDataFrame(rowXml)
#api_data<-csv_df
#api_data
#for(x in 3:14){
#  api_data[,x]<-as.numeric(api_data[,x])
#}
#str(api_data)

library(WriteXLS)
name<-c("Apple","Banana","Peach")
price<-c("300,200,100")
item<-data.frame(NAME=name,PRICE=price)
item

WriteXLS("item","item.xls")
