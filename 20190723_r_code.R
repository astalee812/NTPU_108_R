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





