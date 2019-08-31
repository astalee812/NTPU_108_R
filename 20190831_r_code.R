par(mfrow = c(1,3))
x <- iris[,1]
plot(x)
hist(x)
boxplot(x)

#加標題#
plot(x, main = "plot")
hist(x, main = "hist")
boxplot(x, main = "boxplot")

#改範圍#
plot(x, main = "plot", ylim = c(0,10))
hist(x, main = "hist", xlim = c(0,10), ylim = c(0,35))
boxplot(x, main = "boxplot", ylim = c(0,10))

#改圖樣#
y <- iris[,1]
plot(y, type="p") # points
plot(y, type="l") # lines
plot(y, type="b") # both
plot(y, type="h") # histogram-like
plot(y, type="n") # none 出現會是空白的


#abline就是圖形疊加#
attach(iris)
plot(Sepal.Length, Petal.Length, xlim = c(-1, max(Sepal.Length)),
     ylim = c(-1, max(Petal.Length)))
abline(lm(Petal.Length ~ Sepal.Length), col = "black") #劃一條線姓線#
abline(h = 0, col = "grey") #在y=0的地方加一條水平線#
abline(v = 0, col = "grey") #在x=0的地方加一條垂直線#
abline(h = 2, col = "red", lty = 2) #在y=2的地方加一條紅色且加粗的線#
abline(v = 5.5, col = "blue", lty = 3) #在x=5.5的地方加一條藍色且加粗的線#
abline(a = 1, b = 0.7,  col = "green", lty = 4, lwd = 2) # a的斜率1, b斜率0.7, lty線的樣式, lwd線的寬度#
detach(iris)

#lines()點的連結#
#這樣跑出來的圖很可怕，因為是依照x的出現順序而非大小順序來畫圖#
x <- iris[, 1]
y <- iris[, 3]
plot(x, y, pch=16, col="red")
lines(x,y)


#所以我們用排序x才會出現線圖#
sequence1 <- order(x)
plot(x, y, pch=16, col="red")
lines(x[sequence1], y[sequence1])

#箭頭:arrows & 線段: segments#
x <- runif(12)
y <- rnorm(12)
plot(x, y, main="arrows and segments")
#可以一次給很多個座標! 她就可以全部畫出來#
arrows(x[1], y[1], x[2], y[2], col= "black", length=0.2)
segments(x[3], y[3], x[4], y[4], col= "red")
segments(x[3:4], y[3:4], x[5:6], y[5:6], col= c("blue", "green"))

#玩耍時間#
f <- function(x){
  -x^2-2*x
}
x <- seq(-4,2,0.1)
y <- f(x)
plot(x,y,ylim=c(-5,6),col="red",type = "l", lwd = 2)


#座標系統 : 有高階圖形調控像#
myplot <- function(n){
  for(i in 1:n){ 
    plot(1, type="n", xaxt="n", yaxt="n", xlab="", ylab="")
    text(1, 1, labels=paste(i), cex=3)
  }
}
orig.par <- par(mai=c(0.1, 0.1, 0.1, 0.1), mfrow=c(3, 2))
myplot(6)
par(orig.par)

par(mai=c(0.1, 0.1, 0.1, 0.1), mfcol=c(2, 3))
orig.par <- par(mai=c(0.1, 0.1, 0.1, 0.1))
(mat1 <- matrix(c(1,2,1,3), 2, 2))
layout(mat1)
myplot(3)
par(orig.par)

#layout 一張多圖#
orig.par <- par(mai=c(0.1, 0.1, 0.1, 0.1))
(mat1 <- matrix(c(1,2,1,3), 2, 2))
layout(mat1)
myplot(3)
par(orig.par)

layout(mat1, widths=c(3, 1), heights=c(2, 1))
myplot(3)

(mat2 <- matrix(c(2,1,0,3), 2, 2))

layout(mat2, widths=c(3, 1), heights=c(1, 3))
myplot(3)



