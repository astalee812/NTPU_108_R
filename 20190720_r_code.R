# 目前使用的記憶體量 #
memory.size(max = FALSE)
# 從作業系統得到的最大量記憶體 #
memory.size(max = TRUE)
# 列出目前記憶體的限制 #
memory.size(max = NA)
# 設定新的記憶體限制為1024MB #
memory.limit(size = 1024)

# 做一個10000*20的資料集 #
n <- 10000
p <- 200
myData <- as.data.frame(matrix(rnorm(n*p), ncol = p, nrow=n))
print(object.size(myData), units = "Mb")

write.table(myData, "myData.txt") ## 約34.7 MB
InData <- read.table("myData.txt")
print(object.size(InData), units = "Mb")

## 變數標籤 ##
install.packages("Hmisc")
library(Hmisc)
weight <- c(21, 65, 43)
height <- c(164, 182, 170)
label(weight) <- "體重" ; label(height) <- "身高"
units(weight) <- "公斤" ; units(height) <- "公分"

weight
height

mydata <- data.frame(weight=weight, height=height)
mydata

label(mydata)

# units(mydata) can't work
# apply(mydata, 2, units) can't work
lapply(mydata, units)


## 目錄下的檔案 ##
getwd()
list.dirs()
list.files() # dir()
list.files(R.home())
dir("./data", pattern = "txt$")
file.info(dir())


## 讀中文資料檔編碼##  #這邊知道就好 #
x <- c("曾寶儀", "蔡依琳", "吳瀞惠", "林志玲", "李伃晞")
Encoding(x)

getOption("encoding") # options(encoding="utf-8")
options(stringsAsFactors = FALSE)
(mydata1 <- read.table("NameAge1.txt", header = T, sep="\t"))
read.table("NameAge2.txt", header = T, sep="\t")
read.table("NameAge2.txt", header = T, sep="\t", fileEncoding = "utf8", encoding = "UTF-8")
read.csv("NameAge2.txt")

library(readr)
(mydata2 <- read_delim("NameAge2.txt", delim="\t"))
mydata2$姓名
as.data.frame(mydata2)
Encoding(mydata2[[1]])
enc2native(mydata2[[1]])
enc2utf8(mydata2[[1]])

############-----------R程式設計----------#################
getwd()


## 條件判斷 ##
## 課堂練習1 ##
x <- 1
if((x-2) < 0) cat("expr2 \n") else cat("expr3 \n")
if((x-2) > 0) cat("expr2 \n") else cat("expr3 \n")
## 課堂練習2 ##
x <- c(-1, 2, 3) # 只會看第一個數字 #
if((x-2) < 0) cat("expr2 \n") else cat("expr3 \n")
if((x-2) > 0) cat("expr2 \n") else cat("expr3 \n")

x <- 0
if(x) cat("expr2 \n") else cat("expr3 \n")
if(x+1) cat("expr2 \n") else cat("expr3 \n")

x <- c(-1, 0, 1, 2,3) # 只會看第一個數字 #
if(x) cat("expr2 \n") else cat("expr3 \n")
if(x+1) cat("expr2 \n") else cat("expr3 \n")


## 課堂練習3 ##
# all(): return TRUE if all values are TRUE#
# any(): return TRUE if any values are TRUE#
x <- c(-1, 2, 3)
if(any(x <=0)) y <- log(1+x) else y <- log(x)
y
z <- if(any(x<=0)) log(1+x) else log(x) 
z

## 比較兩個數列 - 看看就好 ##
check.if <- function(a, b){
  if(a == b){
    cat("Equal! \n")
  }else{
    cat("Not equal! \n")  
  }
}

check.if2 <- function(a, b){
  if(sum(abs(a - b)) == 0){
    cat("Equal! \n")
  }else{
    cat("Not equal! \n")  
  }
}

a <- sample(1:10, 4)
b <- a
check.if2(a, b)

check.if(a = 1, b = 1)
check.if(a = 1, b = 2)
check.if(a = 1, b = c(1, 2, 3)) #條件長度>1，因此只能用地一個元素#
check.if(a = 1, b = c(2, 1, 3)) #條件長度>1，因此只能用地一個元素#
check.if(a = c(1, 2, 3), b = c(1, 2, 3)) #條件長度>1，因此只能用地一個元素#
check.if(a = c(2, 4, 5), b = c(1, 2, 3)) #條件長度>1，因此只能用地一個元素#
check.if(a = c(1, 5), b = c(4, 2, 3))
# 兩個向量比較不要使用 == #
identical(a, b) 
all.equal(pi, 355/113) 

##條件判斷##
a<-c(3,4,6,9,5)
b<-c(1,2,8,5,6)
#| (單個符號)會將每個資料都比較，||(雙個符號) 只會比較第一個元素#
a | b
a & b
a || b
a && b

##課堂練習4.1##
x <- 3
y <- 4
x < 2
y > 2
#只比較第一個#
x < 2 || y > 2
x > 2
y > x
x > 2 && y > x
x < 2 | y > 2
x > 2 & y > x
xv <- c(1, 2, 3)
yv <- c(2, 2, 5)
xv < 2
yv > 2
xv < 2 || yv > 2
(! xv < 2) || yv > 2
xv < 2 || (! yv > 2)
xv < 2 && yv > 2
(! xv < 2) && yv > 2
xv < 2 && (! yv > 2)

xv < 2 | yv > 2
(! xv < 2) | yv > 2
xv < 2 | (! yv > 2)
xv < 2 & yv > 2
(! xv < 2) & yv > 2
xv < 2 & (! yv > 2)


## 巢狀 if/else ##
if (test_expression1) {
  statement1
} else if (test_expression2) {
  statement2
} else if (test_expression3) {
  statement3
} else
  statement4

#課程練習#
a <- 2.13

if( a > 10 ){ 
  cat("a > 10 \n")
}else if(a > 5){ 
  cat("5 < a < 10 \n")
}else if(a > 2.5){ 
  cat("2.5 < a < 5 \n")
}else if(a > 1.25){
  cat("1.25 < a < 2.5 \n")
}else{
  cat("a < 1.25")
}

1.25 < a < 2.5 


x <- 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else
  print("Zero")

# ifelse : 常使用作來判別跟分組 #
(x <- c(2:-1))
sqrt(x)
sqrt(ifelse(x >= 0, x, NA))
ifelse(x >= 0, sqrt(x), NA) #最好是判斷完再去做計算#

(yes <- 5:6)
(no <- pi^(0:2))
ifelse(NA, yes, no)
ifelse(TRUE, yes, no)
ifelse(FALSE, yes, no)


##課堂練習4.2##
x
ifelse(x <= 10, 1, ifelse(x <= 20, 2, 3))

set.seed(12345)
age <- sample(1:100, 20)
age

set.seed(12345)
code <- sample(LETTERS[1:5], 20, replace=T)
code

##課堂練習4.3##
set.seed(12345)
score <- sample(0:100, 10, replace=T)
score

gpa.table <- data.frame(grade=c("A", "B", "C", "D", "E"),
                        pscore=c("80-100", "70-79", "60-69", "50-59", "49-0"),
                        GPA=c(4, 3, 2, 1, 0))
gpa.table
set.seed(12345)
score <- sample(0:100, 10, replace=T)
 #用位置來取資料，判斷式給分數tag1.2.3是給資料位子，輸出的時候可以直接用位子抽取#
score_to_gpa <- function(x){
  
  group.id <- ifelse(x >= 80, 1, 
                     ifelse(x >= 70, 2, 
                            ifelse(x >=60, 3, 
                                   ifelse(x >= 50, 4, 5))))
  data.frame(score=x, gpa.table[group.id,], row.names = NULL)
}

score_to_gpa(score)

##自訂函數 function()##
my.dist2 <- function(x1,y1,x2,y2){
  d <- sqrt((x1-x2)^2 +(y1-y2)^2)
  d
}
my.dist2(1,2,4,7)


##直角坐標求兩點##
my.dist3 <- function(x1, y1, x2=0, y2=0){
  d <- sqrt((x1-x2)^2 + (y1-y2)^2)
  list(points.a=c(x1, y1), points.b=c(x2, y2), dist.ab=d)
}

my.dist3(3,4)


