#1-1(a): 印出系統現在的年月日時間#
Sys.time()

#1-1(b): 列出目前的工作目錄#
getwd()

#1-1(c): 列出目錄下的子目錄及檔案#
list.dirs()
list.files()

#1-1(d): 重新設定工作目錄#
setwd("C:/Users/Default")

#1-1(e): 印出目前 R 專案工作目錄及工作目錄下之所有目錄與檔案。#
getwd()
list.dirs()
list.files()

#1-1(f): 印出目前 R 專案工作區 (Workspace) 的物件後，將之全部刪除。#
ls()
#1-1(g): 印出 R 套件安裝之目錄。
library()

##1-4##
lm.obj <- lm(airquality$Wind ~ airquality$Temp)
lm.anova <- anova(lm.obj)
lm.summary <- summary(lm.obj)

#1-4(a): 物件 lm.anova 是屬於何種類別，其儲存結構如何?#
str(lm.anova)

#1-4(b): 物件 lm.summary 有哪㇐些屬性可供存取? 試取出 R2 值。(提示: r.squared)#
str(lm.summary)
lm.summary$r.squared

#1-6(a): 用 rep 指令造出以下數列:"A" "A" "A" "A" "A" "B" "B" "B" "B" "C" "C" "C" "D" "D" "E" #
rep(c("A","B","C","D","E"),5:1)

#1-6(b): 用 seq, c 指令造出數列:#
#"b" "d" "f" "h" "j" "l" "n" "p" "r" "t" "v" "x" "z" "a" "c" "e" "g"
#"i" "k" "m" "o" "q" "s" "u" "w" "y"#
c(letters[seq(2,26,2)],LETTERS[seq(1,26,2)])

#1-6(c)#
-(-1)**seq(1,100,1) / seq(1,100,1)


#1-10(a)#
colors<-c("red","yellow","blue")
paste(colors,"flowers")
#1-10(b)#
paste(colors,"flowers",sep="")
#1-10(c)#
paste("several",paste(colors,"s",sep=""))
#1-11(d)#
paste("I like",paste(colors[1],colors[2],colors[3],sep=", "))

#1-17(a)#
id<-c(1:12)
score<-c(30,49,95,NA,54,NA,61,85,51,22,0,0)
gender<-c("m","f","f","m","f","m","m","f","f","m")
gender<-as.factor(gender)
str(score)
table(gender)
#1-17(b)#
max(score,na.rm = T)
min(score,na.rm = T)
#1-17(c)#
newscore<-na.omit(score)
mean(newscore)
sd(newscore)
(gender_score_mean<-tapply(newscore,gender,mean))

#1-17(d)(i)#
newscore2<-score
newscore2[is.na(newscore2)] <- 0 
newscore2

#1-17(d)(ii)#
adjustscore<-ifelse(is.na(score)!=T,ifelse(score+10>100,100,score+10),NA)
adjustscore

#1-17(e)#
which(adjustscore>=60)

#1-20(a)#
install.packages("xlsx")
library(xlsx)
Rscore<-read.xlsx2('C:/Users/ASUS/Desktop/NTPU/For_HW_And_Test/R-score.xlsx',sheetIndex = 1)
names(Rscore)<-c("No","系級","學號","姓名","小考(1)_10%","小考(2)_15%","小考(3)_15%","作業_20%","期末考_40%","點名_10分")
Rscore<-Rscore[-1,]
head(Rscore)
tail(Rscore)

#1-20(b)#
weather<-read.table("C:/Users/ASUS/Desktop/NTPU/For_HW_And_Test/20140714-weather.txt",header=T, sep="\t")
head(weather)
tail(weather)
str(weather)

#1-20(c)#
weather_delays14<-read.csv("C:/Users/ASUS/Desktop/NTPU/For_HW_And_Test/weather_delays14.csv")
head(weather_delays14)
tail(weather_delays14)
str(weather_delays14)

#1-23(a)#
Dates<-c("0924","1112","1231","1105","0604","0219","0416","0611","0813","1029")
Time<-c("01:00","04:00","16:00","23:00","08:00","09:00","07:00","17:00","03:00","14:00")
Dates1<-as.character(paste0("2018",c(Dates)))
Dates2<- as.Date(Dates1,format="%Y%m%d")
DateTime<-as.character(paste(Dates2,Time))
DateTime2<-as.POSIXct(DateTime,tz = "UTC")
Items<-c("shirt","shirt","pants","jacket","jacket","shirt","jacket","jacket","shoes","shirt")
Volume<-c(7951,159,1958,6848,3762,3678,8696,9045,6208,1425)

mySale<-data.frame(DateTime = DateTime2, Items=as.factor(Items),Volume=as.numeric(Volume))
mySale

#1-23(b)#
overJulySale<-mySale[mySale$DateTime>="2018-07-01",]
unique(overJulySale$Items)
sum(overJulySale$Volume)
