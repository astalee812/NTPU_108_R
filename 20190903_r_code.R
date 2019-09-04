#用R來把影像塞入#
install.packages(c("tiff", "jpeg", "png", "fftwtools"), repos="http://cran.csie.ntu.edu.tw")
install.packages("BiocManager")
BiocManager::install("EBImage")
library(EBImage) # (Repositories: BioC Software)
Transformers <- readImage("rosal.jpg")
(dims <- dim(Transformers))
Transformers

plot(c(0, dims[1]), c(0, dims[2]), type='n', xlab="", ylab="") #不要劃任何東西給我座標就好#
rasterImage(Transformers, 0, 0, dims[1], dims[2]) #把我的圖片塞到畫布裡面，給起始座標跟終點座標#


#對影像作處理#
Transformers.f <- Image(flip(Transformers)) #flip:先把物件做上下顛倒!沒有顛倒會不是正的#
# convert RGB to grayscale 把影像轉成灰階
rgb.weight <- c(0.2989, 0.587, 0.114)
Transformers.gray <- rgb.weight[1] * imageData(Transformers.f)[,,1] + 
  rgb.weight[2] * imageData(Transformers.f)[,,2] + 
  rgb.weight[3] * imageData(Transformers.f)[,,3]
dim(Transformers.gray)

class(Transformers.gray) #這個時候Transformers.gray是matrix,如果用rasterImage會讀不出來，要使用image#

Transformers.gray[1:5, 1:5]
par(mfrow=c(1,2), mai=c(0.1, 0.1, 0.1, 0.1))
image(Transformers.gray, col = grey(seq(0, 1, length = 256)), xaxt="n", yaxt="n") #灰階#
image(Transformers.gray, col = rainbow(256), xaxt="n", yaxt="n") #彩虹#

#把數學式寫出來 expression#
main.ex <- expression(paste("Math Symbols: ", list(alpha, theta)))
plot(1:10, 1:10, type="n", main=main.ex, xlab="", ylab="") #先給一個畫布，不要畫任何東西#
text(5, 9, expression(list({f * minute}(x), {f * second}(x)))) #{f * minute}(x)一次微分，{f * second}(x)二次微分#
text(5, 7, expression(hat(beta) == (X^t * X)^{-1} * X^t * y)) #-1次方:{-1}#
text(5, 5, expression(bar(x) == sum(frac(x[i],n), i==1, n))) #frac:分式, 下標i=x[i], 
ex <- expression(f(x)==paste(frac(1, sigma*sqrt(2*pi)), " ", #一定要寫成*#
                             plain(e)^{frac(-(x-mu)^2, 2*sigma^2)})) #打字體的e: plain(e)#
text(5, 3, labels = ex)

demo(plotmath)

#索引圖#
data <- iris[,1]
data[33] <- data[33]*10 #測試:把單一資料放大，遇到大量資料可以使用畫圖的方式找出極端值#
plot(data)
ind <- which(data>15)
data[ind]
data[ind] <- 5.2
windows()
plot(data) #自動偵測要用多少維度#

#索引圖#
lab <- names(iris)[1]
title <- paste("Histogram of ", lab)
hist(iris[,1], main=title, xlab=lab)
range(iris[,1])
hist(iris[,1], breaks=seq(3.5, 8.5, length=50),main=title, xlab=lab)
hist(iris[,1], breaks=seq(3.5, 8.5, length=50),main=title, xlab=lab, pro=T) #y軸變成density#

#要自己畫72/208的圖#
par(mfrow=c(2,2), mai=c(0.1, 0.1, 0.1, 0.1))
plot(x = iris$Sepal.Length,y=iris$Sepal.Width,col=c("blue","red","green"))

