# 1 #
head(ChickWeight)
summary(ChickWeight)
plot(ChickWeight$Time,ChickWeight$weight,xlab = 'time',ylab = 'weight')

cor(ChickWeight$weight,ChickWeight$Time)
plot(ChickWeight$weight~ChickWeight$Diet,xlab = 'diet',ylab = 'weight')


par(mfrow = c(2, 2))
hist(ChickWeight$weight[ChickWeight$Diet=='1'],breaks = 10,main = 'Histogram: Weight for Diet 1', xlab = "weight for diet1")
hist(ChickWeight$weight[ChickWeight$Diet=='2'],breaks = 10,main = 'Histogram: Weight for Diet 2', xlab = "weight for diet2")
hist(ChickWeight$weight[ChickWeight$Diet=='3'],breaks = 10,main = 'Histogram: Weight for Diet 3', xlab = "weight for diet3")
hist(ChickWeight$weight[ChickWeight$Diet=='4'],breaks = 10,main = 'Histogram: Weight for Diet 4', xlab = "weight for diet4")

# 2-1 #
score <- read.table("C:/Users/ASUS/Documents/GitHub/NTPU_108_R/data/score1032.txt",header=TRUE)
library(fields)
rc <- tim.colors(nrow(score)) 
cc <- rainbow(ncol(score[,c(5:11)]), start = 0, end = .3)

heatmap(as.matrix(score[,c(5:11)]), scale = "none", RowSideColors = rc, ColSideColors = cc, main = "heatmap")
heatmap(as.matrix(score[,c(5:11)]), scale = "none", Rowv = T, Colv = T, RowSideColors = rc, ColSideColors = cc, main = "heatmap")



# 3 #
x <- seq(-1, 3, 1)
y <- seq(-2, 2, 1)
xy <- data.frame(x=rep(x, each=length(y)), y=rep(y, length(x)))
my.dbvn <- function(x,y,a,b,c,d,e){
  fxy <- (1 / (2 * pi * sqrt(c) * sqrt(d) * sqrt(1 - (e ^ 2)))) * exp(-(1/(2 * (1 - (e ^ 2)))) * 
                                                                       ((((x-a)^2)/c)+(((y-b)^2)/d) + ((2*e*(x-a)*(y-b))/(a*b))))
  fxy
}

my.dbvn(xy$x,xy$y,1,0,2,0.5,0.6)
xy <- data.frame(x=rep(x, each=length(y)), y=rep(y, length(x)),my.dbvn(x,y,1,0,2,0.5,0.6))
my.dbvn(xy$x,xy$y,1,0,2,0.5,0.6)




4^(-1)
