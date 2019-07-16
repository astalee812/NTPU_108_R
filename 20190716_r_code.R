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

