# 56/100 
as.vector(Country[grep("^.y", as.character(Country))])

as.vector(Country[grep("^..y", as.character(Country))])

as.vector(Country[grep("^.{5}y", as.character(Country))])

as.vector(Country[grep("^.{,4}$", as.character(Country))]) 

as.vector(Country[grep("^.{15,}$", as.character(Country))])

strtrim{base}
substr{base}
substring{base}
strsplit{base}


# 57/100
text <- c("arm", "leg", "head", "foot", "hand", "hindleg", "elbow")
text
gsub("h", "H", text) #sub替代，h全部換成H#
gsub("o", "O", text) #foot是全換#
sub("o", "O", text) #foot只會換第一個#
gsub("^.", "O", text) #^表示第一個，"."表示都可以，表示都把第一個換成O#

#replace {base}: Replace Values in a Vector#
#replace(x, list, values)#

x <- c(3, 2, 1, 0, 4, 0)
replace(x, x==0, 1)

replace(text, text=="leg", "LEG")
replace(text, text %in% c("leg", "foot"), "LEG") #A %in% B :表示A元素是在B元素當中#


# 58/100
text <- c("arm", "leg", "head", "foot", "hand", "hindleg", "elbow")
#regexpr(pattern, text) :找元素在哪裡，找不到會回傳-1，找到會回傳找到的第一個位子#
regexpr("o", text)
grep("o", text) #整串裡面的第幾個位置#

#把符合條件的位置抓出來之後，把那個元素抓出來#
text[grep("o", text)]
#how many "o"s there are in each string# #我還是不太懂#
gregexpr("o", text)
#無法做多重match，只能做1個並回傳位置#
charmatch("m", c("mean","median","mode"))
#回傳位置#
charmatch("med", c("mean","median","mode"))


#題目: 我要在一段文章中找出出現最多的單字#

# 59/100
stock <- c("car", "van")
requests <- c("truck", "suv", "van", "sports", "car", "waggon", "car")
requests %in% stock
#which會把符合的元素位置傳回#
index <- which(requests %in% stock)
requests[index]

x <- round(rnorm(10), 2)
x
index <- which(x < 0)
index
x[index]
x[x<0]


# 60/100
x <- matrix(sample(1:12), ncol=4, nrow=3)
x
which(x %% 3 == 0) # %%表示餘數 #
which(x %% 3 == 0, arr.ind = T) #arr.ind回報第幾列第幾欄#

x <- c(45, 3, 50, 41, 14, 50, 3)
which.min(x) #回傳位置#
which.max(x)
x[which.min(x)] #回傳元素#
x[which.max(x)]
which(x == max(x))


# 61/100
setA <- c("a","b","c", "d", "e")
setB <- c("d", "e", "f", "g")

union(setA, setB) #聯集#
intersect(setA, setB) #交集#
setdiff(setA, setB) #在A不在B#
setdiff(setB, setA) #在B不在A#
setA %in% setB #A元素是否有在B元素裡面#
setB %in% setA #B元素是否有在A元素裡面#
setA[setA %in% setB] #等同交集#



# 62/100 #程式執行時間#
myFun <- function(n){
  x <- 0
  for(i in 1:n){
    x <- x + i
  }
  x
}

#比較長用這個#
system.time({
  ans <- myFun(10000)
})

start.time <- proc.time()
for(i in 1:50) mad(runif(500))
proc.time() - start.time

start.time <- Sys.time()
ans <- myFun(10000)
end.time <- Sys.time()
end.time -start.time


# 63/100
setwd("C:/Users/ASUS/Documents/GitHub/NTPU_108_R/data/")
city <- read.table("city.txt", header=TRUE, row.names=NULL, sep="\t")
attach(city)
names(city)

rank.price <- rank(price) #排名只看相對應的位子#
sorted.price <- sort(price)
ordered.price <- order(price) #對價格取位置#

sort(price, decreasing=TRUE) #從大到小#
rev(sort(price)) #跟decreasing = T 一樣#


# 64/100
city

(view1 <- data.frame(location, price, rank.price))

(view2 <- data.frame(sorted.price, ordered.price)) 

(view3 <- data.frame(location[ordered.price], price[ordered.price])) 

# 65/100
y <- 1:20
sample(y)
sample(y)
sample(y, 5)
sample(y, 5)
sample(y, 5, replace=T)

substr("this is a test", start=1, stop=4)
substr(rep("abcdef",4),1:4,4:5)

x <- c("asfef", "qwerty", "yuiop[", "b", "stuff.blah.yech")
substr(x, 2, 5)
substring(x, 2, 4:6)
substring(x, 2) <- c("..", "+++")
x


# 66/100 argumments函數
#kernel function核函數: 核密度函數計算#
#這邊是把函數用function寫出來然後直接套用到計算式#

u <- seq(-3, 3, 0.1)
#三角核函數#
Triangular <- function(u){
  s <- ifelse(abs(u) <= 1, 1, 0) #寫下條件句#
  ans <- (1-abs(u))*s #程式寫出來乘以條件句，符合條件才答案，不符合為0#
  return(ans)
}

#高斯函數#
Gaussian <- function(u){
  ans <- exp((-1/2)*(u^2))/sqrt(2*pi) #exp自然對數 = 2.718....#
  return(ans)
}

#伊式函數#
Epanechnikov <- function(u){
  s <- ifelse(abs(u) <= sqrt(5) , 1, 0) #條件句#
  ans <- 3*(1-((u^2)/5))/(4*sqrt(5))*s 
  return(ans)
}

par(mfrow=c(1,3))
x <- seq(-3, 3, 0.1)
plot(x, Triangular(x), main="Triangular Kernel", type="l")
plot(x, Gaussian(x), main="Gaussian Kernel", type="l")
plot(x, Epanechnikov(x), main="Epanechnikov Kernel", type="l")


# 67/100 #核函數密度估計，其公式K = kernel，可以將剛剛三個函數名稱填入#
fh <- function(xi, x, h, kernel, n=150){
  ans <- sum(kernel((x-xi)/h))/(n*h)
  return(ans)
}

x <- iris[, 1]
fh(x, 7, 0.2736, Triangular)
fh(x, 7, 0.2736, Gaussian)
fh(x, 7, 0.2736, Epanechnikov)



# 68/100
binomial <- function(k, n, p){
  factorial(n)/(factorial(k) * factorial(n - k)) * (p^k) * ((1-p)^(n-k))    
}

compute.mu.sigma <- function(pmf, parameter){
  
  mu <- 0
  sigma2 <- 1
  
  pmf.name <- deparse(substitute(pmf))
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
  sigma2 <- sum((parameter$k - mu)^2 * do.call("pmf", parameter))
  cat("distribution:¡@", pmf.name, "\n")
  cat("mu: ", mu, "\t sigma2:", sigma2, "\n" )
}

my.par <- list(k = c(0:10), n = 10, p = 0.6)
compute.mu.sigma(pmf = binomial, parameter = my.par)
distribution:¡@ binomial 
mu:  6   sigma2: 2.4 
my.par <- list(k = c(0:100), lambda = 4)
compute.mu.sigma(pmf = poisson, parameter = my.par)
distribution:¡@ poisson 
mu:  4   sigma2: 4 
my.par <- list(k = c(0:10000), p = 0.4)
compute.mu.sigma(pmf = geometric, parameter = my.par)


# 70/100
as.numeric(factor(c(¡§a¡¨, ¡§b¡¨, ¡§c¡¨)))
as.numeric(c(¡§a¡¨, ¡§b¡¨, ¡§c¡¨)) #don¡¦t work


