#5-10(a)#
set.seed(123)
x <- sample(1:100, 50, replace = T)

zscore <- function (x){
  u <- mean(x)
  zs <- x-u / sd(x)
  zs
}

zscore(x)


#5-10(b)#
x <- sample(1:100,5)
zscore <- function (x){
  u <- mean(x)
  zs <- x-u / sd(x)
  zs_list <- list(mean(zs),var(zs))
  zs_list
  }

zscore(x)


#5-10(c)#
scale(x)


#5-11(a)#
x <- sample(1:50,10,replace = T)
y <- sample(1:50,10,replace = T)

pscore <- function(x,y){
  u1 <- mean(x)
  u2 <- mean(y)
  p <- sum((x-u1)*(y-u2)) / (sqrt(sum((x-u1)^2)) * sqrt(sum((y-u2)^2)))
  p
}

pscore(x,y)


#5-11(b)#
x <- rnorm(20)
y <- runif(20)
pscore(x,y)
cor(x,y)


#5-12#
x <- rnorm(20)
y <- runif(20)
rkc <- function(x,y){
  r1 <- rank(x)
  r2 <- rank(y)
  u1 <- mean(rank(x))
  u2 <- mean(rank(y))
  rankcorrelation <- (sum((r1 - u1) * (r2 - u2))) / (sqrt(sum((r1 - u1)^2)) * sqrt(sum((r2 - u2)^2)))
  rankcorrelation
}

rkc(x,y)

#5-13#
set.seed(12345)
x <- rnorm(100)
skewness <- function(x){
  u <- mean(x)
  n <- length(x)
  b <- (sum((x-u) ^ 3)/ n)/ sqrt(sum((x-u)^2) / (n-1)) 
  b
}
skewness(x)


#5-14(a)#
x <- sample(1:25, 10)
tmeans <- function(x,p){
  x1 <- sort(x)
  tmean <- x1[x1 >= quantile(x1,probs = p) & x <= quantile(x1,prob = 1-p)]
  tmean2 <- mean(tmean)
  tmean2
}

tmeans(x,0.2)

#5-14(b)#
data2 <- data1 <- rnorm(100)
id <- sample(100,10)
data2[id] <- data1[id] + 2*qchisq(0.975,10)
tmeans(data1,0)
tmeans(data1,0.01)
tmeans(data1,0.03)
tmeans(data1,0.05)
tmeans(data1,0.1)
tmeans(data2,0)
tmeans(data2,0.01)
tmeans(data2,0.03)
tmeans(data2,0.05)
tmeans(data2,0.1)

#5-14(c)#
t1 <- c(tmeans(data1,0),
        tmeans(data1,0.01),
        tmeans(data1,0.03),
        tmeans(data1,0.05),
        tmeans(data1,0.1),
        tmeans(data2,0),
        tmeans(data2,0.01),
        tmeans(data2,0.03),
        tmeans(data2,0.05),
        tmeans(data2,0.1))



t2 <- c(mean(data1,trim = 0),
        mean(data1,trim = 0.01),
        mean(data1,trim = 0.03),
        mean(data1,trim = 0.05),
        mean(data1,trim = 0.1),
        mean(data2,trim = 0),
        mean(data2,trim = 0.01),
        mean(data2,trim = 0.03),
        mean(data2,trim = 0.05),
        mean(data2,trim = 0.1))

data.frame(t1,t2)






