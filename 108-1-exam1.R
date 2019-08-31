#1-(a)#
rep(1:5,5:1)

#1-(b)#
rep(1:6,6)+seq()
#1-(b) correct
rev(7-sequence(1:6))

#2-1 / 2-2 / 2-3# 
cars.lm <- lm(dist ~ speed, data=cars)
cars.lm.sm <- summary(cars.lm)
class(cars.lm.sm) #correct: 看這傢伙的屬性#
attributes(cars.lm.sm) #correct: 多加的看哪個可以用#
str(cars.lm.sm)
cars.lm.sm$fstatistic

#3-(a)#
library(xlsx)
Rscore<-read.xlsx2('C:/Users/ASUS/Documents/GitHub/NTPU_108_R/data/R-score.xlsx',sheetIndex = 1)
names(Rscore)<-c("No","系級","學號","姓名","小考1","小考2","小考3","作業","期末考","點名")
Rscore<-Rscore[-1,]
head(Rscore)
summary(Rscore)

#3-(b)#
Rscore$小考1<-as.numeric(as.character(Rscore$小考1))
Rscore$小考2<-as.numeric(as.character(Rscore$小考2))
Rscore$小考3<-as.numeric(as.character(Rscore$小考3))
Rscore$作業<-as.numeric((as.character(Rscore$作業)))
Rscore$期末考<-as.numeric((as.character(Rscore$期末考)))

mean(Rscore$小考1)
sd(Rscore$小考1)


mean(Rscore$小考2)
sd(Rscore$小考2)
mean(Rscore$小考3)
sd(Rscore$小考3)
mean(Rscore$作業)
sd(Rscore$作業)
mean(Rscore$期末考)
sd(Rscore$期末考)

#correct# 使用apply去計算所有的平均數標準差

#3-(c)#
Rscore$test1<-(Rscore$小考1)*0.1
Rscore$test2<-(Rscore$小考2)*0.15
Rscore$test3<-(Rscore$小考3)*0.15
Rscore$HW<-(Rscore$作業)*0.2
Rscore$final<-(Rscore$期末考)*0.4
Rscore$FINALLL<-(Rscore$test1+Rscore$test2+Rscore$test3+Rscore$HW+Rscore$final)

Final_score<-Rscore[,c(3,16)]
Final_score

#correct: 可以使用矩陣相乘#

#4#
A <- matrix(c(2,5,4,8,-1,0),ncol = 3) #欄位先填#
B <- matrix(c(2,4,-3,-5,2,1,1,0,2,4,3,0), ncol = 4)
C <- matrix(c(2,8,-6,-1,-3,2), ncol =2)
#4-a#
A %*% B
#4-b#
2*A + 3*t(C)

#5#
View(installed.packages())

#6#
x <- "吳小明"
y <- 25
paste0("歡迎",x,"，","您的年齡是",y,"歲")

#7#
thou <- 1000
fiveh <- 500
fif <- 50
tenn <- 10
dol <- 1
sum(thou*3,fiveh*4,fif*2,tenn*6,dol*2)/31.070


#8-a# #第8題不會寫#
exp(1.22)
#8-b#
n <- 0:10
x <- 1.22
n.term <- x^n / factorial(n)
n.sum <- cumsum(n.term)
data.frame <- c(n.term, n.sum)


#9-csv#
csvfile<-read.csv('C:/Users/ASUS/Desktop/NTPU/For_HW_And_Test/臺北市空氣品質監測站基本資料.csv')
csvfile
str(csvfile)

#9-txt#
txtfile<-read.table('C:/Users/ASUS/Desktop/NTPU/For_HW_And_Test/臺北市空氣品質監測站基本資料.txt',header=TRUE, fileEncoding = "UTF-8")
txtfile
str(txtfile)

#9-xlsx#
xlsxfile<-read.xlsx('C:/Users/ASUS/Desktop/NTPU/For_HW_And_Test/臺北市空氣品質監測站基本資料.xlsx',sheetIndex = 1,header=F,encoding="UTF-8")
xlsxfile
str(xlsxfile)
