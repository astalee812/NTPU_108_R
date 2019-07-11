#看我自己的pakage安裝在哪#
.libPaths()

#開R的時候自動載入常用的R，可以不用一直寫library#
.First<-function(){
  cat("\n  Welcome to \n\n")
  require(rgl)
}
#重點學習!! 我要怎麼查程式!!!#
#查詢help# #查東西會比較建議使用RGui#
??"t test"  #for t-test#
?? "%*%"    #for 線性代數#

#找出那些package可以有範例可以讓我練習#
demo()
#在console一直按enter就可以一直看他們裡面的圖
demo(graphics)
demo(image)
demo(persp)
#3D graph!!!! awesome!!!#
library(rgl)
demo(rgl)

#更新R跟R套件#
install.packages("installr")
library(installr)
installr()
#看一下套件的版本，想看電腦跟R的版本都可以看
sessionInfo()
#看Rstudio的版本#
version

#Data set: iris#  #ML常用它來練習也有網站#
View(iris)
summary(iris)


#Function name 可以使用底線就可以一眼看出來是函數"compute_x" #
#變數命名可以用一個點，"varible.x" #

#針對我寫的code做美肌!讓她變漂亮!! code - Reformat code 就會變成規定的狀況#



#object 物件#
x <- 3+5
y <- 7
objects()
#把物件印出來#
ls()
#把x跟y移除#
rm(x,y)
#把所有空間的東西移除#
rm(list=ls())


#估計R物件所占用的記憶體#
n <- 1000
p <- 200
mydata<-matrix(rnorm(n*p),ncol=p,nrow=n)
print(object.size(mydata),units="Mb")
#打好多! 做成一個函數#
os <- function(x){
  print(object.size(x), units = "Mb")
  }
os(mydata)


#object#
x <- 2 
x <- vector() 
x <- matrix() 
x <- 'Hello Dolly' 
x <- c('Hello', 'Dolly') 
x <- function(){}

#Rounding of numbers#
(x <- c(pi, 1/3, -1/3, -pi))
#無條件進位#
ceiling(x)
#無條件捨去#
floor(x)
#直接取整數#
trunc(x)
#四捨五入到小數點第2位#
round(x, 2)
#四捨五入到小數點第5位#
round(x, 5)

x <- c(1/3, 2, -4, 1.5)
ceiling(x) == floor(x)

#向量 vector#
x1 <- c(10, 5, 3, 6, 2.7)
x1
#把list的東西塞到x2中
assign("x2", c(10, 5, 3, 6, 2.7))
x2
#另外一種方式指定資料
c(10, 5, 3, 6, 2.7) -> x3
x3
#看資料裡面有多少東西#
length(x1)
#儲存全部都是數字，出來也會是數字
c(1,7:9)
#如果list裡面有字串，全部都會變成字串#
c(1:5, 10.5, "next")

#抽取向量#
x1[4]
x1[2:4]
#選取多個位置的數字#
x1[c(4, 2, 1)]
#不要第三個數字#
x1[-3]
#抽取符合邏輯的數值#
x1[x1<5]
x1[10]
#更改list裡面的數字#
x1[2] <- 32; x1
#更改多個數字，如果長度不一樣，系統會警告，原則是短變長#
x1[c(1, 3, 5)] <- c(1,2,3)
x1

y1 <- 1/x1
y1
length(y1)

v1 <- x1 + y1+1
v1
length(v1)

y2 <- c(x1, 0, x1)
y2
length(y2)

v2 <- x1 + y2 + 1
length(v2)

#常用的統計運算# #看不懂或者不會打就打問號來查詢#
x <- c(1.58, -0.29,  0.59, -0.38,  0.72)
max(x)
min(x)
range(x)
c(min(x), max(x))
mean(x) #要排除NA值，則 na.rm = T #
sum(x)/length(x) #樣本平均數=課本上的公式#
sd(x)
var(x) #變異數#
cov(x) #共變異數#
sum( (x-mean(x))^2)/(length(x)-1) #樣本變異數#
sqrt(var(x))
median(x)
summary(x)
sort(x)
rank(x)
x[order(x,decreasing = T)]

?order
