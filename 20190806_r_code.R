

#factorial.call丟回去自己function中#
factorial.call <- function(n, f){     
  
  if(n <= 1){
    return(f)
  }
  else{ 
    factorial.call(n-1, n*f)
  }
}
factorial.call(5, 1)

x <- 3
switch(x, 
       cat("2+2\n"), 
       cat("mean(1:10)\n"), 
       cat("sd(1:10)\n"))

switch(x, 2+2, mean(1:10), sd(1:10))

switch(2, 2+2, mean(1:10), sd(1:10))

switch(6, 2+2, mean(1:10), sd(1:10))


my.lunch <- function(y){
  switch(y, 
         fruit="banana", 
         vegetable="broccoli", 
         meat="beef")
}
my.lunch("fruit")
my.lunch(fruit)



# 43/100
x.center <-  function(x, type){
  switch(type, #比對字串#
         mean = mean(x), 
         median = median(x), 
         trimmed = mean(x, trim = 0.1),
         stop("Measure is not included!"))
}

x <- rnorm(20) #隨機取20個數字#
x.center(x, "mean")
x.center(x, "median")
x.center(x, "trimmed")
x.center(x, "mode")


# 44/100
my.median.1 <- function(x){
  odd.even <- length(x)%%2 #相除的餘數#
  if(odd.even==0){
    (sort(x)[length(x)/2] + sort(x)[1+length(x)/2])/2
  }else{
    sort(x)[ceiling(length(x)/2)] #ceiling取整數#
  }
}

#上下一樣的寫法，只是把一樣的東西坐取代，比較乾淨#
my.median.2 <- function(x){
  odd.even <- length(x)%%2
  s.x <- sort(x)
  n <- length(x)
  if(odd.even==0){
    median <- (s.x[n/2] + s.x[1+n/2])/2
  }else{
    median <- s.x[ceiling(n/2)] 
  }    
  return(median)
}

x <- rnorm(30)
my.median.1(x) 
my.median.2(x) 
median(x)

#apply系列::用於矩陣型:matrix, dataframe(1:row / 2:col)#
# 45/100
(x <- matrix(1:24, nrow=4))
apply(x, 1, sum)  #row列的總和#
apply(x, 2, sum)  #col攔的總和#
apply(x, 1, sqrt) #R的放資料的方式是先放攔位，所以會顛倒#
apply(x, 2, sqrt)


# 46/100 #apply可以自訂函數#
math <- sample(1:100, 50, replace=T)
english <- sample(1:100, 50, replace=T)
algebra <- sample(1:100, 50, replace=T)
ScoreData <- cbind(math, english, algebra) #集結成一個資料框#
head(ScoreData, 5)
myfun <- function(x){
  sqrt(x)*10
}
sdata1 <- apply(ScoreData, 2, myfun)
head(sdata1, 5)

head(apply(ScoreData, 2, function(x) sqrt(x)*10), 5)
myfun2 <- function(x, attend){
  y <- sqrt(x)*10 + attend
  ifelse(y > 100, 100, y)
}
sdata2 <- apply(ScoreData, 2, myfun2, attend=5)
head(sdata2, 5)


#tapply#
# 47/100
tapply(iris$Sepal.Width, iris$Species, mean)
set.seed(12345)
scores <- sample(0:100, 50, replace=T)
grade <- as.factor(sample(c("大一", "大二", "大三", "大四"), 50, replace=T))
bloodtype <- as.factor(sample(c("A","AB","B","O"), 50, replace=T))
tapply(scores, grade, mean)
tapply(scores, bloodtype, mean)
tapply(scores, list(grade, bloodtype), mean)
tapply(scores, list(grade, bloodtype), length)


# 48/100
n <- 20
(my.factor <- factor(rep(1:3, length = n), levels = 1:5))
table(my.factor)
tapply(1:n, my.factor, sum) #回傳向量#

tapply(1:n, my.factor, range) #回傳表列#

tapply(1:n, my.factor, quantile) #回傳表列#

# not run
# > by(iris[,1:4] , iris$Species , mean)
by(iris[,1:4] , iris$Species , colMeans)

varMean <- function(x, ...) sapply(x, mean, ...)
by(iris[, 1:4], iris$Species, varMean)


#lapply#
a <- c("a", "b", "c", "d")
b <- c(1, 2, 3, 4, 4, 3, 2, 1)
c <- c(T, T, F)

list.object <- list(a,b,c)

my.la1 <- lapply(list.object, length)
my.la1

my.la2 <- lapply(list.object, class)
my.la2

