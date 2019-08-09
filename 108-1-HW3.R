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
  p <- sum((x-u1)*(y-u2)) / sqrt(sum((x-u1)^2) * sum((y-u2)^2))
  p
}

pscore(x,y)

cor(x,y)


#5-11(b)#
x <- rnorm(20)
y <- runif(20)
pscore(x,y)
cor(x,y)


#5-12#



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




#5-14(b)#


#5-14(c)#


#5-15#
pxx <- function(n,p){
  x <- c(1:n)
  px <- (prod(1:n) / (prod(1:x)*prod(1:(n-x)))) * (p^x) * (1-p)^(n-x)
  px
}

pxx(15,0.2)
pxx(15,0.8)






