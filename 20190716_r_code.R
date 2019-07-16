# data frame #
my.matrix <- matrix(1:15, ncol=3)
my.matrix
my.data <- data.frame(my.matrix)
my.data

my.data[1, ]
my.data[2, 3]
my.data$X1
my.data[, "X1"]
my.data["X1"]
rownames(my.data)
row.names(my.data)
names(my.data)

rownames(my.data) <- c(paste("s", 1:5, sep="."))
colnames(my.data) <- c("A1", "A2", "A3")
my.data
#把資料集的欄位集結，以後不用一直打$字來抓取資料#
attach(my.data)
A1
A2
A3
#要集結起來的把它拆開#
detach()
A1

#做一個data.frame#
subjects <-c ('Chinese', 'Math', 'English')
scores <- c(50, 90, 61)
pass <- scores >= 60

student <- data.frame(subjects, scores, pass)
#還可以直接更改欄位名稱#
student <- data.frame(s=subjets,g = score, p = pass)
student
student["2",] 
student[,"scores"]

head(iris)

index.1 <- iris[, iris$Species] == "virginica"
iris[index.1, ]
iris[iris$Species == "virginica",]
iris[!(iris$Species == "virginica"),]
m <- mean(iris$Sepal.Length)
index.3 <- iris[, "Sepal.Length"] > m
iris[index.3, ]

x1 <- rnorm(5)
x2 <- rnorm(5)
x1
class(x1)
data.frame(Var1=x1, Var2=x2)

y1 <- data.frame(rnorm(5))
y2 <- data.frame(rnorm(5))
y1
class(y1)
data.frame(Var1=y1, Var2=y2)


class(iris)
head(iris, 3)
x1 <- iris[1] #抓第一欄的資料#
head(x1)
class(x1)
x2 <- iris[[1]] #抓取數值#
head(x2)
class(x2)
x3 <- iris["Sepal.Length"] #抓取到一個data.frame#
class(x3)
x4 <- iris[, "Sepal.Length"] #抓取到一個向量值#
class(x4)

#比較一下#
iris.copy <- iris
iris.copy[3] <- NULL #指定第三欄為null#
head(iris.copy, 3)
iris.copy <- iris
iris.copy[[3]] <- NULL
head(iris.copy, 3)
iris$species #小寫#
iris$Species #大寫#

#日期處理#
as.Date("1985-12-16") #如果超過時間範圍:character string is not in a standard unambiguous format#
as.Date("2019/02/17")
as.Date(1000, origin = "1900-01-01") #從1900/01/01之後的1000天是哪一個日期#
as.Date("2/15/2011", format = "%m/%d/%Y")
as.Date("April 26, 1993", format = "%B %d, %Y")
as.Date("22JUN01", format = "%d%b%y") 
seq(as.Date('1976-7-4'), by = 'days', length = 10) #產生連續日期#
seq(as.Date('2010-2-1'), to = as.Date('2010-4-1'), by='2 weeks') #產生連續週期的日期#

lct <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")

Sys.time()
#取出日期#
substr(as.character(Sys.time()), 1, 10)
substr(as.character(Sys.time()), 12, 19)
date()

#把系統時間(產出文字)變成時間格式而非文字#
my.date <- as.POSIXlt(Sys.time())
my.date
my.date$sec
my.date$min
my.date$hour
my.date$mday #當月的第幾天#
my.date$mon
my.date$year + 1900
my.date$wday
my.date$yday

now <- Sys.time()
as.POSIXct(now)
as.POSIXlt(now)
class(now)

#不同的時間記錄方式#
#POSIXct:總秒數從1970/1/1開始算起#
#POSIXlt:一個列表，裡面有跟時間相關的數值（秒、分、時、日、月、年等）#
as.POSIXct("1969-12-31 23:59:59", format = "%Y-%m-%d %H:%M:%S", tz = "UTC") 
as.POSIXlt(Sys.time(), "GMT") 

#重要時間function: strptime #
x1 <- c("20040227", "20050412", "19930922")
strptime(x1, format="%Y%m%d")
x2 <- c("27/02/2004", "27/02/2005", "14/01/2003")
strptime(x2, format="%d/%m/%Y")
x3 <- c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
strptime(x3, "%d%b%Y")

#把日期跟時間合起來#
dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
times <- c("23:03:20", "22:29:56", "01:03:30", "18:21:03", "16:56:26")
x <- paste(dates, times)
strptime(x, "%m/%d/%y %H:%M:%S")

#時間相關的package: lubricate#


(z <- 0:9)
mode(z)
(digits <- as.character(z))
mode(digits)
(d <- as.integer(digits))
mode(d)
(x <- z[1:5]>3)
mode(x)

x1 <- 10
class(x1)
x2 <- seq(1, 10, 2)
class(x2)

my.f <-  formula(iris$Sepal.Length ~ iris$Sepal.Width) #依變數 ~ 獨立變數#
# "~" separate response variable on the left from the explanaatory variable on the right.#

class(my.f)
class(lm(my.f))
class(aov(my.f))

class(iris)
(iris.sub <- iris[5:10, 1:4])
class(iris.sub)
class(as.matrix(iris.sub))

as.list(iris.sub)
class(as.list(iris.sub))


ex1 <- expression(1 + 0:9)  # expression object
ex1
eval(ex1) #叫表達式裡面的東西去計算#
class(ex1)

hi <- function(){
  cat("hello world!\n")
}
hi()
class(hi) 

(r.dates <- strptime(c("27/02/2004", "27/02/2005"), format="%d/%m/%Y"))
class(r.dates)

#物件結構#
mode()
class()
str()
summary()

x <- 1:12
str(x)
ch <- letters[1:12]
str(ch) 
str(iris)
str(ls)  
str(str)
myp <- plot(iris[,1], iris[,2])
str(myp) #有些圖示沒有辦法存東西，但是有些圖會有額外資料存在，例如直方圖#


(x <- as.Date("1985-6-16"))
str(x)
(y <- strptime("27/02/2004", format="%d/%m/%Y"))
str(y)


my.f <-  iris$Sepal.Length ~ iris$Sepal.Width
my.f
str(my.f)
#簡單線性回歸#
my.lm <- lm(my.f)
my.lm
str(my.lm)
my.lm$coefficients
summary(my.lm) #這個好像比較好看#

#我要如何抽取p value/ F value... etc.#
my.lm.s <- summary(my.lm)
str(my.lm.s)
my.lm.s$r.squared #未調整r值#
my.lm.s$adj.r.squared #調整後的r值# y可以解釋x的程度
my.lm.s$fstatistic #f value#
my.lm.s$coefficients
my.lm.s$coefficients[,4] #p value for ceofficient#

#物件之間的轉換，要自己去尋找#
?list 

as.numeric(factor(c("a","b","c")))
as.numeric(c("a","b","c")) #這個是不會work的#


#資料輸出及輸入#
getwd()
setwd("")

#資料輸出#
stdout()
?stdout

#是將資料從螢幕中顯示出來，如果要大量運算! 就要用cat(x)才可以看到#
cat()
cat("Hello R users!\n") #\n 是一個跳脫符號#
#把向量印出來#
a <- c(1,2,3)
cat("Here is a list: ", a, "\n")
#直接在cat中計算#
cat("3 + 5 =", 3+ 5, "\n" )

cat("A test list: ", paste("Test", 1:3, sep="-"), "\n")
#加檔案才會印到檔案中#
cat("this is my output","\n", "2 3 5 7","\n", "11 13 17 19", file="test1.txt")
#跟上面那個一樣的output#
cat("this is my output", "2 3 5 7", "11 13 17 19", file="test2.txt", sep="\n")

cat("today", "is", date(), sep="\t", "\n")
#cat只能接受向量跟文字#

#cat是不會回傳資料的，print會回傳文字向量#
cat("hello")
print("hello")
class(cat("hello"))
class(print("hello"))

cat("Today is: ", date(), "\n")
print("Today is: ", date()) #這個印不出來#

cat(head(iris, 2)) #cat無法把資料集印出來#
print(head(iris, 2))

dice1 <- sample(1:6, 10, replace=TRUE)
dice2 <- sample(1:6, 10, replace=TRUE)
mytable <- table(dice1, dice2)
mytable
print(mytable, zero.print = ".")


#怎麼從螢幕輸入---使用scan#
stdin()
a <- scan() #每按一次enter就是一筆資料，按兩次enter才會結束#
a
b <- scan(nmax=1)
b
#quiet=TRUE 為了讓提示閉嘴#
b <- scan(nmax=1, quiet=TRUE)
b
#輸入字串#
c <- scan(what="character", quiet=TRUE)
c
#輸入字串要限定那些句子要在一起，要用""#
c <- scan(what="character", quiet=TRUE)
c
#把輸入的資料變成matrix#
e <- scan()
e.mat <- matrix(e, ncol=3, byrow=TRUE)
e.mat

