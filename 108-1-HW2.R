#2-2#

#2-4#

#2-7#

#2-11#

#2-14#

#2-29#

#2-33#

#2-53-(a) #
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
score

#2-53-(b) #





