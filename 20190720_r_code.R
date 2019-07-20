#目前使用的記憶體量#
memory.size(max = FALSE)
#從作業系統得到的最大量記憶體#
memory.size(max = TRUE)
#列出目前記憶體的限制#
memory.size(max = NA)
#設定新的記憶體限制為1024MB#
memory.limit(size = 1024)

#做一個10000*20的資料集#
n <- 10000
p <- 200
myData <- as.data.frame(matrix(rnorm(n*p), ncol = p, nrow=n))
print(object.size(myData), units = "Mb")

write.table(myData, "myData.txt") ## 約34.7 MB
InData <- read.table("myData.txt")
print(object.size(InData), units = "Mb")

##變數標籤##
install.packages("Hmisc")
library(Hmisc)
weight <- c(21, 65, 43)
height <- c(164, 182, 170)
label(weight) <- "體重" ; label(height) <- "身高"
units(weight) <- "公斤" ; units(height) <- "公分"

weight
height

mydata <- data.frame(weight=weight, height=height)
mydata

label(mydata)

# units(mydata) can't work
# apply(mydata, 2, units) can't work
lapply(mydata, units)


##目錄下的檔案##
getwd()
list.dirs()
list.files() # dir()
list.files(R.home())
dir("./data", pattern = "txt$")
file.info(dir())


##讀中文資料檔編碼##  #這邊知道就好#
x <- c("曾寶儀", "蔡依琳", "吳瀞惠", "林志玲", "李伃晞")
Encoding(x)

getOption("encoding") # options(encoding="utf-8")
options(stringsAsFactors = FALSE)
(mydata1 <- read.table("NameAge1.txt", header = T, sep="\t"))
read.table("NameAge2.txt", header = T, sep="\t")
read.table("NameAge2.txt", header = T, sep="\t", fileEncoding = "utf8", encoding = "UTF-8")
read.csv("NameAge2.txt")

library(readr)
(mydata2 <- read_delim("NameAge2.txt", delim="\t"))
mydata2$姓名
as.data.frame(mydata2)
Encoding(mydata2[[1]])
enc2native(mydata2[[1]])
enc2utf8(mydata2[[1]])

####