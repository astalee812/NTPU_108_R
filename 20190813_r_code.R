
# 68/100
binomial <- function(k, n, p){
  factorial(n)/(factorial(k) * factorial(n - k)) * (p^k) * ((1-p)^(n-k))    
}

compute.mu.sigma <- function(pmf, parameter){
  
  mu <- 0 #這兩個要先宣告! 以防找不到這東西#
  sigma2 <- 1
  
  pmf.name <- deparse(substitute(pmf)) #這邊deparse跟substitute要一起使用，可以把函數印出來#
  cat("Input is", pmf.name, "distribution.\n")
  if(pmf.name ==  "binomial"){
    k <- parameter[[1]]
    n <- parameter[[2]]
    p <- parameter[[3]]
    mu <- sum(k * pmf(k, n, p))
    sigma2 <- sum((k - mu)^2 * pmf(k, n, p))
  }  
  cat("mu: ", mu, "\n")
  cat("sigma2: ", sigma2, "\n")
}

compute.mu.sigma(pmf=binomial, parameter=c(4, 10, 0.5))


# 69/100
binomial <- function(k, n, p){
  factorial(n)/(factorial(k) * factorial(n - k)) * (p^k) * ((1-p)^(n-k))    
}

poisson <- function(k, lambda){
  exp(-lambda) * (lambda^k)/(factorial(k))   
}

geometric <- function(k, p){
  (1 - p)^k * p  
}

compute.mu.sigma <- function(pmf, parameter){
  pmf.name <- deparse(substitute(pmf))
  mu <- sum(parameter$k * (do.call("pmf", parameter)))
  sigma2 <- sum((parameter$k - mu)^2 * do.call("pmf", parameter)) #do.call是把pmf算出來帶入n個參數中#
  cat("distribution: ", pmf.name, "\n")
  cat("mu: ", mu, "\t sigma2:", sigma2, "\n" )
}

my.par <- list(k = c(0:10), n = 10, p = 0.6)
compute.mu.sigma(pmf = binomial, parameter = my.par)

my.par <- list(k = c(0:100), lambda = 4)
compute.mu.sigma(pmf = poisson, parameter = my.par)

my.par <- list(k = c(0:10000), p = 0.4)
compute.mu.sigma(pmf = geometric, parameter = my.par)


as.numeric(factor(c("a", "b", "c")))
as.numeric(c("a", "b", "c")) #'don't work#

#字串轉換成變數名稱或指令#
(x <- sample(1:42, 6))
(y <- letters)
get("x")

for(i in 1:5){
  x.name <- paste("x", i, sep=".")
  assign(x.name, 1:i)
  cat(x.name, ": \t")
  cat(get(x.name), "\n")
}

(my.math <- c("3+4", "a/5"))
eval(my.math)
eval(parse(text=my.math[1])) #parse是轉換，把字串變成真的可以算的東西#

plot.type <- c("plot", "hist", "boxplot")
x <- rnorm(100)
my.plot <- paste(plot.type, "(x)", sep="") #把計算程式變成字串#
eval(parse(text=my.plot)) #parse是用來把雙引號拿掉做真正的計算#
