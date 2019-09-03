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
Transformers.f <- Image(flip(Transformers)) #先把物件做上下顛倒!沒有顛倒會不是正的#
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