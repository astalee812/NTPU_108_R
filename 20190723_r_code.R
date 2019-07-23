#距離算法的函數#
my.dist <- function(x1, y1, x2, y2){
  d <- sqrt((x1-x2)^2 + (y1-y2)^2)
  d
}

#加入引數及內定值#
my.dist2 <- function(x1, y1, x2=0, y2=0){
  d <- sqrt((x1-x2)^2 + (y1-y2)^2)
  list(points.a=c(x1, y1), points.b=c(x2, y2), dist.ab=d)
}

my.dist(1, 2, 4, 7)

my.dist2(1, 2, 4, 7) 

my.dist2(1, 2)


#引數及內定值#  #其對應到的位置都是我函數中的位置#  #函數可以不按順序但名字要寫對#
ans <- fun1(data=d, data.frame=df, is.graph=TRUE, limit=20)
ans <- fun1(d, df, TRUE, 20)
fun1(d, df, is.graph=TRUE, limit=20)
fun1(data=d, limit=20, is.graph=TRUE, data.frame=df)

#寫函數要給內定值 limit#
#fun1 <- function(data, data.grame, is.graph=TRUE, limit=20){…}#
ans <- fun1(d, df)
ans <- fun1(d, df, limit=10)

#Practice#
my.dist <- function(a, b){
  sqrt(sum((a-b)^2))
}

my.dist(a=c(1, 2), b=c(4, 7))

#寫法1# #函數寫法比較好#
f <- function(x){
  x^2+1
}

#寫法2 --- 注意 x一定要存在#
x <- 1:5
y <- f(x)
y

x <- 1:5
y <- x^2+1
y


min(5:1, pi)
#一對一比較#
pmin(5:1, pi)

#算出一倍標準差佔整理資料的多少% #
data.ratio <- function(x){
  x.number <- length(x)
  x.up <- mean(x) + sd(x)
  x.down <- mean(x) - sd(x)
  x.n <- length(x[x.down < x & x < x.up])
  x.p <- x.n/x.number
  list(number=x.n, percent=x.p)
}

data.ratio(iris[,1])

#如何寫函數: 先把要做的事情一行一行寫出來確認可以run出東西，再把所有的程式用function包起來#


ratio.number<-function(x, k=1){

  #x<-sample(1:100,30)#
  #k=1#
  m<-mean(x)
  s<-sd(x)
  
  up<-m+k*s
  low<-m-k*s
  
  id<-(low < x) & (up < x)
  n.x<-length(x[id])
  r.x<-n.x / length(x)
  list(ratio = r.x, num = n.x) }

ratio.number(60)


#課堂練習5#
compute <- function(a, b=0.5){
  
  sum <- a+b
  diff <- a-b
  prod <- a*b
  if(b!=0){
    div <- a/b
  }else{
    div <- "divided by zero"
  }
  list(sum=sum, diff=diff, product=prod, divide=div)    
}


compute(2, 5)

compute(2)

compute(2, 0)



#課堂練習6: 兩樣本 t test，找出這兩個東西是不是相同的#
two.sample.test <- function(y1, y2){
  n1 <- length(y1); n2 <- length(y2)
  m1 <- mean(y1); m2 <- mean(y2)
  s1 <- var(y1); s2 <- var(y2)
  s <- ((n1-1)*s1 + (n2-1)*s2)/(n1+n2-2)
  stat <- (m1-m2)/sqrt(s*(1/n1+1/n2))
  list(means=c(m1, m2), pool.var=s, stat=stat)
}

t.stat <- two.sample.test(iris[,1], iris[,2]) 
t.stat

# compare with R package function "t.test" #
t.test(iris[,1],iris[,2],var.equal = T)


##函數內的變數##  #雙箭頭的意思#
myfun1 <- function(x){   
  y <- x + 5
  cat("y: ", y, "\n")
}

#使用雙箭頭#
myfun2 <- function(x){   
  y <<- x + 5
  cat("y: ", y, "\n")
}

y <- 5; cat("y: ", y, "\n")
myfun1(3)
cat("y: ", y, "\n")

y <- 5; cat("y: ", y, "\n")
myfun2(3)
cat("y: ", y, "\n")

myfun1 <- function(x){   
  y <- x + 5
  cat("y: ", y, "\n")
}

myfun2 <- function(x){   
  y <<- x + 5
  cat("y: ", y, "\n")
}

y <- 5; cat("y: ", y, "\n")
myfun1(3)
cat("y: ", y, "\n")


y <- 5; cat("y: ", y, "\n")
myfun2(3)
cat("y: ", y, "\n")

## for 迴圈##
for(i in 1:5){
  cat("loop: ", i, "\n")
}

for(k in c(1, 17, 3, 56, 2)){
  cat(k, "\t")
}

for(bloodType in c("A", "AB", "B", "O")){
  cat(bloodType, "\t")
}


rm(list=ls())
y <- round(rnorm(10), 2)
z <- y
y
i

for(i in 1:length(y)){
  if(y[i] < 0) 
    y[i] <-0
}
y
i

z[z<0] <- 0
z



## for 雙迴圈 ##  #竟量避免使用for 雙迴圈#
a <- numeric(5)
for(i in 1:5){
  a[i]<- i^2
}
a


m <- 3
n <- 4
for(i in 1:m){
  for(j in 1:n){
    cat("loop: (", i, ",", j, ")\n")
  }
}


a <- matrix(0,2,4)
for(i in 1:2){
  for(j in 1:4){ 
    a[i,j]<- i+j
  }
}
a


## 迴圈控制: next，省略此次迴圈，直接執行下一個迴圈##

m <- 3
n <- 4
for(i in 1:m){
  for(j in 1:n){
    
    if(i==2){
      cat("before next:", i,",",j, "\n")
      next
      cat("after next:", i,",",j, "\n")
    }else{
      cat("loop: (", i, ",", j, ")\n")
    }
  }
}



## 迴圈控制: break 跳出當下的迴圈##
m <- 3
n <- 4
for(i in 1:m){
  for(j in 1:n){
    
    if(i==2){
      cat("before break:", i,",",j, "\n")
      break
      cat("after break:", i,",",j, "\n")
    }else{
      cat("loop: (", i, ",", j, ")\n")
    }
  }
}




##課堂練習: 判斷一正整數是否為質數##

check.prime <- function(num){
  
  yes <- FALSE
  
  if(num == 2){
    yes <- TRUE
    
  } else if(num > 2) {
    
    yes <- TRUE
    for(i in 2:(num-1)) {
      if ((num %% i) == 0) {
        yes <- FALSE
        break
      }
    }
  } 
  
  if(yes) {
    cat(num, "is a prime number. \n")
  } else {
    cat(num, "is not a prime number. \n")
  }
}


check.prime(2)
check.prime(13)
check.prime(25)


## 判別條件 : repeat and while，用於我不知道要跑幾次的時候 ##
#repeat沒有判別，所以至少會執行一次#
#while會判別之後再執行，所以有可能不執行#


a <- 5
while(a > 0){  
  a <- a-1  
  cat(a,"\n")
  if(a==2){
    cat("before next:", a, "\n")
    next
    cat("after next:", a, "\n")
  }
}

# 換成break #
a <- 5
while(a > 0){  
  
  if(a == 2){
    cat("before break:", a, "\n")
    break
  }
  a <- a-1  
  cat(a,"\n")
}

# 無窮迴圈 : 按esc / Ctrl+c / Ctrl+z 停止計算# #這邊我不懂#
a <- 5
while(a > 0){  
  
  if(a==2){
    cat("before break:", a, "\n")
    next
    cat("after break:", a, "\n")
  }
  a <- a-1  
  cat(a,"\n")
}

##課堂練習10 : 計算n! 看看哪一個方式比較快##

##額外練習: n! 使用向量式來計算，連乘##
prod(1:10)
