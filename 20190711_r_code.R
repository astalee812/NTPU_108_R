#看我自己的pakage安裝在哪#
.libPaths()

#開R的時候自動載入常用的R，可以不用一直寫library#
.First<-function(){
  cat("\n  Welcome to \n\n")
  require(rgl)
}
#重點學習!! 我要怎麼查程式!!!#
#查詢help# #查東西會比較建議使用RGui#
??"t test"  #for t-test#
?? "%*%"    #for 線性代數#

#找出那些package可以有範例可以讓我練習#
demo()
#在console一直按enter就可以一直看他們裡面的圖
demo(graphics)
demo(image)
demo(persp)
#3D graph!!!! awesome!!!#
library(rgl)
demo(rgl)

#更新R跟R套件#
install.packages("installr")
library(installr)
installr()
#看一下套件的版本，想看電腦跟R的版本都可以看
sessionInfo()
#看Rstudio的版本#
version

#Data set: iris#  #ML常用它來練習也有網站#
View(iris)
summary(iris)


#Function name 可以使用底線就可以一眼看出來是函數"compute_x" #
#變數命名可以用一個點，"varible.x" #


#針對我寫的code做美肌!讓她變漂亮!! code - Reformat code 就會變成規定的狀況#



