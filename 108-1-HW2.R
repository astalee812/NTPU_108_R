#2-2-(a)#
x <- sample(1:10,5)
cal <- function(x) {
  mm <- numeric(length(x))
  ss <- numeric(length(x))
  for (i in 1:length(x)){
    mm[i] <- x[i]
    n <- length(x)
    means <- sum(mm) / n
  
    vars <- (sum(x**2) - n * ((means)**2)) / (n-1)
  }
  print(means)
  print(vars)
  
}

cal(x)

#2-2-(b)#
x <- sample(1:100,50)
cal(x)
  
#2-2-(c)#
x <- sample(1:100,50)
cal(x)

mean(x)
var(x)


#2-3#
for(i in c(1:9)) {
  for (j in c(1:9)){
    z <- i*j
    cat(i,"*",j ,"=",z,"\t")
  }
  cat("\n")
}


#2-4-(a)#
result <- c()
for (i in 1) {
  for (j in 1:5) {
    cat(rep(c(i:j)),"\n")
    
  }
}



#2-4-(b)#
for(i in 1){
  
  for(k in 5:1){
    cat(rep("",k,"\t"))
  }
 
  for(j in seq(1,9,by=2)){
    cat(rep(j,j),"\n")
  }
}



#2-7#
An <- (n+3) / (n+8)
Bn <- (2*(n^2)+3) / (2*(n^2)+3)
Cn <- (n^0.5) / (2+(n^0.5))




#2-11#
score <- sample(1:100, 50, replace = T)
finalscore <- function(score){
  score1 <- score[score < 60]
  percentage1 <- length(score1) / length(score)
  adjustscore <- (score^0.5) * 10 
  percentage2 <- length(adjustscore[adjustscore < 60]) / length(adjustscore)
  
  maxscore1 <- max(score)
  maxscore2 <- max(adjustscore)
  
  print(percentage1)
  print(maxscore1)
  print(percentage2 )
  print(maxscore2)
}

finalscore(score)


#2-14#
set.seed(12345)
n <- 50
midterm <- sample(0:100, n, replace = T)
extra <- sample(0:100, n, replace = T)

finalscore <- function(midterm,extra){

  final <- (midterm * 0.4) + (extra * 0.6)
  final1 <- ifelse (final < midterm , midterm , final)
  mm <- mean(final1)
  ss <- var(final1)
  
  print(mm)
  print(ss)
}

finalscore(midterm,extra)


#2-29#
ComputeWeight <- function(x){ 
my.gender <- readline(prompt="Enter gender: ")
my.hight <- readline(prompt="Enter hight: ")
my.hight <- as.integer(my.hight)
standerwight <- if (my.gender == "m") {
  standerwight <- (my.hight - 80) * 0.7
  } else {
  standerwight <- (my.hight - 70) * 0.6
  }
print(standerwight)
}

#2-33#


#2-53#
set.seed(12345)
score <- sample(1:100, 30, replace=T)
summary(score)
str(score)
sd(score)
score
uper <- mean(score) + sd(score)
low<- mean(score) - sd(score)
score1 <- ifelse((score > uper),"A",
                      ifelse(score < low,"C","B"))
rbind(score,score1)



#2-54-(a) #  #看錯題號#
scoreA <- read.table("C:/Users/ASUS/Documents/GitHub/NTPU_108_R/data/score-A.txt",sep = "\t")
head(scoreA)
scoreA <- scoreA[-1:-3,]
names(scoreA) <- c("座號","學號","姓名","性別","小考1","小考2","小考3","小考4","TA","期中考","期末考","出席")
scoreA$班級 <- "A"

scoreB <- read.table("C:/Users/ASUS/Documents/GitHub/NTPU_108_R/data/score-B.txt",sep = "\t")
head(scoreB)
scoreB <- scoreB[-1:-3,]
names(scoreB) <- c("座號","學號","姓名","性別","小考1","小考2","小考3","小考4","TA","期中考","期末考","出席")
scoreB$班級 <- "B"
total <- rbind(scoreA,scoreB)
score <- as.data.frame(total)
score<-score[,c(13,1,2,3,4,5,6,7,8,9,10,11,12)]
score

#2-54-(b) # 
str(score)
score$小考1<-as.numeric(as.character(score$小考1))
score$小考2<-as.numeric(as.character(score$小考2))
score$小考3<-as.numeric(as.character(score$小考3))
score$小考4<-as.numeric(as.character(score$小考4))
score$TA<-as.numeric(as.character(score$TA))
score$期中考<-as.numeric(as.character(score$期中考))
score$期末考<-as.numeric(as.character(score$期末考))
score$出席<-as.numeric(as.character(score$出席))
score[is.na(score)] <- 0
score$finalscore <- (score$小考1*0.07) + (score$小考2*0.07) + (score$小考3*0.08) + (score$小考4*0.08) + (score$TA*0.15) + (score$期中考*0.25) + (score$期末考*0.3) + score$出席
score$finalscore[score$finalscore > 100] <- 100

#2-54-(c)#
score[score$finalscore <= 59 & score$finalscore >= 51,]

#2-54-(d)#
library(dplyr)
score %>% group_by(班級) %>% summarise(mean(finalscore))
score %>% group_by(性別) %>% summarise(mean(finalscore))

#2-54-(e)#
sum(score$班級=="A" & score$finalscore < 60) / sum(score$班級 == "A")
sum(score$班級=="B" & score$finalscore < 60 & score$性別=="男") / sum(score$班級 == "B")

