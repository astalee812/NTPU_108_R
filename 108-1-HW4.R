# 3-6 (a)#
x <- seq(0, 5, 0.1)
weibull <- function(x,a,b){
  we <- (a*(b^(-a))) * (x^(a-1)) * exp(-((x/b)^a))
  we
}

weibull(x,1,2)

# 3-6 (b) #
a1 <- weibull(x,1,2)
a2 <- weibull(x,2,2)
a5 <- weibull(x,5,2)

plot(a1,type="l", ylim=c(0.0,1.5), xlab="x", ylab="f(x)",
     main="X~Weib(alpha,beta=2)")
lines(a2, lty = 5, lwd = 2, type="l")
lines(a5, lty=3, type="l")
text(25, 0.8, expression(alpha==5))
text(5, 0.5, expression(alpha==1))
text(30, 0.3, expression(alpha==2))


# 3-7 #
install.package("extraDistr")
library(extraDistr)
x <- seq(0,10,1)
curve(drayleigh(x, 1), 0, 10, xlim=c(0,10),ylim=c(0,1.2),
      ylab ="" )
curve(drayleigh(x, 2), 0, 10, col = "green",add=T)
curve(drayleigh(x, 3), 0, 10, col = "red",add=T)
curve(drayleigh(x, 4), 0, 10, col = "pink",add=T)
curve(drayleigh(x, 0.5), 0, 10, col = "blue",add=T)
legend(5.5,1.1,legend=c(expression(sigma==0.5), expression(sigma==1), expression(sigma==2),
                      expression(sigma==3), expression(sigma==4)),
       lty = 1, col = c("black", "green", "red", "pink", "blue"), bty = "n")

# 3-13 #
x <- c(0,0.25,0.5,0.75,1)
a1 <- function(x){
  y = 1-(x^2)
  y
}
a1(1)
a11 <- curve(a1,0,1, lty = 1, add = T)
a1(x)

plot.new()
plot.window(xlim=c(-1,2),ylim=c(-1,2),asp = NA)
arrows(-0.5,0,1.3,0,angle = 30, code=2, lwd = 3)
arrows(0,-0.5,0,1.6,angle = 30, code=2, lwd = 3)
curve(a1,0,1, lty = 1,col ="blue",lwd = 2,add = T)
points(0,1,col="deeppink",lwd=4)
points(1/4, 15/16, col = "deeppink",lwd = 4, pch = 19)
points(1/2, 3/4, col = "deeppink", lwd = 4, pch = 19)
points(3/4, 7/16, col = "deeppink", lwd = 4, pch = 19)
segments(0.25, 1, 0.25, 0, col = "deeppink", lwd = 2)
segments(0, 1, 0.25, 1, col = "deeppink", lwd = 2)
segments(0.5, 15/16, 0.5, 0, col = "deeppink", lwd = 2)
segments(0.25, 15/16, 0.5, 15/16, col = "deeppink", lwd = 2)
segments(0.75, 3/4, 0.75, 0, col = "deeppink", lwd = 2)
segments(0.5, 3/4, 0.75, 3/4, col = "deeppink", lwd = 2)
segments(1, 7/16, 1, 0, col = "deeppink", lwd = 2)
segments(0.75, 7/16, 1, 7/16, col = "deeppink", lwd = 2)
text(0.3,0.5,expression(R))
text(-0.1,-0.1,"0")
text(-0.1,0.5,"0.5")
text(-0.1,1,"1")
text(0.23,-0.1,"0.25")
text(0.48,-0.1,"0.5")
text(0.73,-0.1,"0.75")
text(0.98,-0.1,"1.0")
text(0.1,1.1,"(0,1)")
text((1/4+0.1),(15/16+0.2),expression({}(frac(1,4),frac(15,16))))
text((1/2+0.1),(3/4+0.2),expression({}(frac(1,2),frac(3,4))))
text((3/4+0.1),(7/16+0.2),expression({}(frac(3,4),frac(7,16))))

# 3-14 #
a2 <- function(x){
  y = (x^2)-4
  y
}

a3 <- function(x){
  y=-(x^2)-(2*x)
  y
}

a4 <- curve(a2,-4,5, add = T, col = "blue", lwd = 2)
a5 <- curve(a3,-4,5, add = T, col = "red", lwd = 2)

plot.new()
plot.window(xlim=c(-5,3),ylim=c(-5,6),asp = NA)
arrows(-5,0,3,0, angle = 30 ,code = 2, lwd = 2)
arrows(0,-5,0,6, angle = 30 ,code = 2, lwd = 2)
segments(-3,5,-3,-3, lwd =2 )
curve(a2,-4,5, add = T, col = "blue", lwd = 2)
curve(a3,-4,5, add = T, col = "red", lwd = 2)
points(-3,5, pch = 19, col = "blue", lwd = 4)
points(-3,-3, pch = 19, col = "red", lwd = 4)
points(1,-3, pch = 19, col = "red", lwd = 4)
polygon(a4$x,a4$y, col = "darkslategray1", density = 30)
polygon(a5$x,a5$y, col = "deeppink", density = 50)
text(-2,3,expression(y==x^2-4))
text(1,-1,expression(y==-x^2-2*x))
text(-3,5.8,"(-3,5)")
text(-3,-3.8,"(-3,3)")
text(1.8,-3,"(1,-3)")


