#2-2#

#2-4#

#2-7#

#2-11#

#2-14#

#2-29#

#2-33#


#2-53#
set.seed(12345)
score <- sample(1:100, 30, replace=T)
summary(score)
sd(score)



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

