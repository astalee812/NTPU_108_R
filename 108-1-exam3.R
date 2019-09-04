# 1-1 #
sample(c("剪刀","石頭","布"),size=1,replace=T)

# 1-2 #
cat("輸入你要出的拳頭(a: 剪刀, b: 石頭, c: 布, d: 不玩了):")
switch(x, a = "剪刀", b = "石頭", c = "布", d = "不玩了") 


# 1-3 #
games <-function(x){
  cat("輸入你要出的拳頭(a: 剪刀, b: 石頭, c: 布, d: 不玩了):")
  switch(x, a = "剪刀", b = "石頭", c = "布", d = "不玩了") 
  if (x=="a"){
    cat("電腦出",sample(c("剪刀","石頭","布"),size=1,replace=T))
  } else if (x=="b"){
    cat("電腦出",sample(c("剪刀","石頭","布"),size=1,replace=T))
  } else if (x=="c"){
    cat("電腦出",sample(c("剪刀","石頭","布"),size=1,replace=T))
  } else if (x=="d"){
    cat("謝謝再會!")
    break
  }
  
}


# 2 #
library(EBImage) 
wiki <- readImage("wiki.jpg")
dims <- dim(wiki)

pmf1 = dpois(1:20,1)
pmf2 = dpois(1:20,4)
pmf3 = dpois(1:20,10)
plot(pmf1, pch=1, main = "Poisson probability mass function", xlab ="k",ylab ="P(X=x)", col="orange", type= "b") 
lines(pmf2, pch = 1, col = "purple", lty=2, type = "b")
lines(pmf3, pch = 1, col = "lightblue", lty = 3, type = "b")
legend(x=5,y=0.38,c(expression(lambda==1),expression(lambda==4),expression(lambda==10)),lty=c(1,2,3),pch=c(1,1,1), col=c("orange","purple","lightblue"))
text(13,0.16,"see: https://en.wikipedia.org/wiki/Poisson_distribution", col="blue",cex=0.7 )
par(new=TRUE)
plot(c(0, dims[1]), c(0, dims[2]), type='n', xlab="", ylab="") #不要劃任何東西給我座標就好#
rasterImage(wiki, 0, 0, dims[1], dims[2])