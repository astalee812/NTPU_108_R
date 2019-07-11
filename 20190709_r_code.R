#############################################################################
#2019/7/9 for R test
#auther : asta lee
#version : 0.1
#############################################################################

score<-c(46,78,34)
cat("hollo world")
mean(score)

plot(iris[,1])
plot(score)

number<-c(1:10)

library(rgl)
help("plot3d")
open3d()
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x, y)
plot3d(x, y, z, col = rainbow(1000))