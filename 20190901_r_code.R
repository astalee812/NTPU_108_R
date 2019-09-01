#pch = 20大實心點, pch = 小實心點#
plot(1:10, rep(1, 10), pch=20, col=1:10, cex=5, xlab="", ylab="") 
text(1:10, rep(1.2, 10), labels=1:10) #加字text, lable寫1~10#

#也可以寫rgb(0,0,0): 坐標軸給紅綠藍#
rgb(1,0,0) 

#查詢所有顏色#
colors()


col2rgb("peachpuff")

col2rgb(c(myblue = "royalblue", reddish = "tomato")) # names kept

col2rgb(paste("gold", 1:4, sep=""))
#16進位#
col2rgb("#08a0ff") 

#調色盤
palette()

#這八個的rgb分別為多少
col2rgb(1:8) 

#用判別方式來決定點的顏色#
plot(iris[,3], iris[,4], pch = 16, col=ifelse(iris[,1] > median(iris[,1]), "red", "blue"))

#彩色集: 使用rainbow(100)即可#
par(mfrow=c(2,3))
n <- 24
pie(rep(1,n), col=rainbow(n))
pie(rep(1,n), col=heat.colors(n))
pie(rep(1,n), col=terrain.colors(n))
pie(rep(1,n), col=topo.colors(n))
pie(rep(1,n), col=cm.colors(n))
pie(rep(1,n), col=grey(1:n/n))




