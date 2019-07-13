#印出系統現在的年月日時間#
Sys.time()

#列出目前的工作目錄#
getwd()

#列出目錄下的子目錄及檔案#
list.dirs() #子目錄#
list.files()#檔案#

#重新設定工作目錄#
setwd()

#安裝cluster及clValid套件並載入#
install.packages("cluster")
library(cluster)
install.packages("clValid")
library(clValid)

#自己安裝套件到電腦中，並用install.package指令安裝#

#安裝biocinductor套件: cancerclass,geneClassifiers, maSigPro#
install.packages("cancerclass")
install.packages("geneClassifiers")
install.packages("maSigPro")

#列出電腦作業系統以及R版本#
Sys.info()
R.Version()

#查看目前占用多少記憶體#
object.size(x)
