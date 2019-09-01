#pch = 20小實心點, pch = 16 大實心點#
#pch是符號, cex是符號大小#
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
par(mfrow=c(2,3)) #mfrow多圖合併#
n <- 24
pie(rep(1,n), col=rainbow(n))
pie(rep(1,n), col=heat.colors(n))
pie(rep(1,n), col=terrain.colors(n))
pie(rep(1,n), col=topo.colors(n))
pie(rep(1,n), col=cm.colors(n))
pie(rep(1,n), col=grey(1:n/n))


library(RColorBrewer)
brewer.pal.info
display.brewer.all()

#調色盤觀看
display.brewer.pal(5, "BrBG") #5個顏色#
display.brewer.pal(7, "BrBG") #7個顏色#
display.brewer.pal(9, "BrBG") #9個顏色#

#畫iris的花萼長度#
par(mfrow=c(1,6)) #mfrow多圖合併#
#切了10個，使用set3的調色盤#
hist(Sepal.Length, breaks=10, col=brewer.pal(3, "Set3"), main="Set3 3 colors")
hist(Sepal.Length, breaks=3 ,col=brewer.pal(3, "Set2"), main="Set2 3 colors")
hist(Sepal.Length, breaks=7, col=brewer.pal(3, "Set1"), main="Set1 3 colors")
hist(Sepal.Length, breaks= 2, col=brewer.pal(8, "Set3"), main="Set3 8 colors")
hist(Sepal.Length, col=brewer.pal(8, "Greys"), main="Greys 8 colors")
hist(Sepal.Length, col=brewer.pal(8, "Greens"), main="Greens 8 colors")
detach(iris)

n <- 10
(col.a <- colorRamp(c("red", "green"))((0:n)/n)) #(x) , x in [0,1]

rgb(col.a/255)

col.b <- colorRampPalette(c("red", "green"))(n)  # (n)
col.b

col2rgb(col.b)

plot(1:n,  rep(0.5, n),  pch=20, col=rgb(col.a/255), cex=8, ylim=c(0, 3))
text(5, 1, 'colorRamp(c("red", "green"))((0:n)/n)')
points(1:n,  rep(2, n),  pch=20, col=col.b, cex=8)
text(5, 2.5, 'colorRampPalette(c("red", "green"))(n)')


#tim.colors#
par(mfcol=c(3,2))
x <- 1:20
y <- 1:20
z <- outer(x, rep(1,20), "+") #做相加的運算: 為了畫色階#
obj <- list(x=x, y=y, z=z)
image(obj, col=tim.colors(200), main="tim.colors(200)")
image(obj, col=two.colors(), main="two.colors()")
image(obj, col=two.colors(start="darkgreen", end="darkred", middle="black"), 
      +       main="two.colors()")

plot(x, y,  main="two.colors(alpha=.5)")
image(obj, col=two.colors(alpha=.5), add=TRUE)
image(obj, col=designer.colors(), main="designer.colors()")
coltab <- designer.colors(col=c("blue", "grey", "green", "red")) 
image(obj, col= coltab, main="designer.colors()")

#相關係數矩陣#
install.packages("fields")
library(fields)
cor.col <- two.colors(start="blue", middle="white", end="red") 
length(cor.col)
range(cor.col)

n <- 100
p <- 4

set.seed(12345)
x <- matrix(rnorm(n*p), ncol=p)
rx <- cor(x)
rx
#(-1, 0, 1) => (0, 1, 2) => (1, 128, 255)
range.col <- floor((1+range(rx))*127+1) 
range.col

par(mfrow=c(1, 2))
image(t(rx)[,p:1], main="cor(x)", col=cor.col, xaxt="n", yaxt="n")
axis(3, at=seq(0, 1, length.out=4), labels=paste0("x", 1:p))
axis(2, at=seq(0, 1, length.out=4), labels=paste0("x", p:1), las=1)

image(t(rx)[,p:1], main="cor(x)", col=cor.col[range.col[1]: range.col[2]], xaxt="n", yaxt="n")
axis(3, at=seq(0, 1, length.out=4), labels=paste0("x", 1:p))
axis(2, at=seq(0, 1, length.out=4), labels=paste0("x", p:1), las=1)

x <- 1:20
y <- 1:20
z <- outer(x, rep(1,20), "+")
obj <- list(x=x, y=y, z=z)
image(obj, col=cor.col, xaxt="n", ylab="", yaxt="n")
axis(1, at=x, labels=round(seq(-1, 1, length.out=20), 2), las=2)


#相關係數圖#
library(corrplot)
# par(mar = rep(0,4))
plot(0, xlim = c(0, 3), ylim = c(0, 1), type = "n")
colorlegend(rainbow(100), 0:9)

colorlegend(heat.colors(100), LETTERS[1:12], xlim = c(1, 2))
colorlegend(terrain.colors(100), 0:9, ratio.colbar = 0.6,
            lim.segment = c(0, 0.6), xlim = c(2, 3), align = "l")


par(mar = rep(0,4))
plot(0, xlim = c(3, 6), ylim = c(-0.5, 1.2), type = "n")
colorlegend(topo.colors(100), 0:9, lim.segment = c(0,0.6),
            xlim = c(3,4), align = "l", offset = 0)
colorlegend(cm.colors(100),1:5, xlim = c(4,5))
colorlegend(sample(rainbow(12)), labels = LETTERS[1:12],
            at = seq(0.05, 0.95, len = 12), xlim = c(5, 6), align = "r")

colorlegend(sample(rainbow(12)),
            labels = LETTERS[1:12], at = seq(0.05, 0.95, len = 12),
            xlim = c(3, 6), ylim = c(1.1, 1.2), vertical = FALSE)

colorlegend(colbar = grey(1:100 / 100), 1:10, col = "red", align = "l",
            xlim = c(3, 6), ylim = c(-0.5, -0.1), vertical = FALSE)


#文字標號#
plot(iris[,3], iris[,4], type="n") #給一個畫布#
my.label <- c(rep("a", 50), rep("b", 50), rep("c", 50)) #iris有不同品種，可以用字母代替資料點#
text(iris[,3], iris[,4], labels=my.label, cex=0.7)

#文字標題做顏色，如果資料有超過中位數就給紅色，沒有就給藍色#
plot(iris[,3], iris[,4], type="n")
my.label <- c(rep("a", 50), rep("b", 50), rep("c", 50))
text(iris[,3], iris[,4], my.label, cex=0.7, 
     col=ifelse(iris[,1] > median(iris[,1]), "red", "blue"))

#圖上文字然後畫一個箭頭，接著在把數學公式寫在畫布上#
plot(iris[,1], iris[,2], xlim=c(0, 10), ylim=c(0, 10))
text(2,8, "This is a test")
arrows(x0=3, y0=7, x1=5, y1=5, length = 0.15, col="red")
text(4, 9, expression(hat(beta) == (X^t * X)^{-1} * X^t * y))


#Legen 圖例說明#
plot(iris[,3], iris[,4], type="n")
my.label <- c(rep("a", 50), rep("b", 50), rep("c", 50))
my.color <- c(rep("red", 50), rep("blue", 50), rep("green", 50))
text(iris[,3], iris[,4], my.label, cex=0.7, col=my.color)
legend(5, 0.6, legend=c("setosa","versicolor", "virginica"), pch = "abc",       
       col=c("red","blue","green"))


#開始畫一些數學的東西#
x <- seq(-pi, pi, len = 65)
plot(x, sin(x), type = "l", ylim = c(-1.2, 1.8), col = 3, lty = 2)
points(x, cos(x), pch = 3, col = 4)
lines(x, tan(x), type = "b", lty = 1, pch = 4, col = 6)
legend(-1, 1.9, c("sin", "cos", "tan"), col = c(3,4,6), text.col = "green4",      
       lty = c(2, -1, 1), pch = c(-1, 3, 4), bg = 'gray90') #負的意思是不要畫#


# axis:座標軸 #
plot(1:7, rnorm(7), xaxt = "n", frame = FALSE) #沒有橫軸跟方框#
axis(1, 1:7, LETTERS[1:7], col = "green") 
axis(3, 1:7, paste("test", LETTERS[1:7]), col.axis = "blue", las=2) #las=2表示文字要變成直的, las=1就會變成橫的#
axis(4, lty=2, lwd = 2, las=2)

plot(1:8, xaxt = "n",  xlab = "")
axis(1, labels = FALSE)
my.labels <- paste("Label", 1:8, sep = "-") 
text(1:8, par("usr")[3] - 0.25, srt = 45, adj = 1, #srt=45,把坐標軸的字變成斜的45度#
     labels = my.labels, xpd = TRUE) #xpd限定畫圖在第二層上#
mtext(1, text = "X Axis Label", line = 3)

par("usr")

#畫方形#
plot(0, xlim=c(0,14), ylim=c(0, 14), type = "n", 
     xlab = "", ylab = "", main = "Rectangles")
rect(1, 2, 3, 6)
n <- 0:3
rect(5+n, 5+n, 6+2*n, 6+2*n, col = rainbow(4), border = n+1, lwd=4)


symbols(x = c(2, 7), y = c(2, 5), circles = c(1, 7), xlim=c(0, 10), ylim=c(0, 10), bg=c("red", "gray"), xlab="", ylab="")


##
plot(c(100, 250), c(300, 450), type = "n", xlab = "", ylab = "")
i1 <- as.raster(matrix(0:1, ncol = 6, nrow = 7))
rasterImage(i1, 180, 380, 220, 430, interpolate = FALSE)

i2 <- as.raster(matrix(colors()[1:100], ncol = 5))
rasterImage(i2, 100, 300, 150, 400, interpolate = FALSE) 


#這個我跑不了，package: EBImage這個無法下載#
install.packages(c("tiff", "jpeg", "png", "fftwtools"), repos="http://cran.csie.ntu.edu.tw")
install.packages("EBImage")
library(EBImage) # (Repositories: BioC Software)
Transformers <- readImage("Transformers07.jpg")
(dims <- dim(Transformers))
Transformers

plot(c(0, dims[1]), c(0, dims[2]), type='n', xlab="", ylab="")
rasterImage(Transformers, 0, 0, dims[1], dims[2])
