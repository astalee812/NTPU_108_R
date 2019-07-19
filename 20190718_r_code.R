#read.table, header=是否包含欄位名稱#
my.data <- read.table("iris-data1.txt")
my.data <- read.table("iris-data2.txt", header=TRUE, row.names=1)
my.data <- read.table("iris-data3.txt", header=TRUE, sep="\t")

#沒有欄位名稱會直接給V1~Vn#
my.data <- read.table("iris-data0.txt", header=FALSE)
#看行跟列的數量#
dim(my.data)

my.data[1:3,]
#attributes=屬性#
attributes(my.data)
row.names(my.data)
#看變數名稱#
names(my.data)
colnames(my.data)
#挑出前五筆資料#
head(my.data)
#挑出後五筆資料#
tail(my.data)
#總覽資料#
View(my.data)
str(my.data)

##資料含有空格blank##
x <- read.table("mydata.txt", header=T)
head(x)
str(x)
summary(x)

#這邊會有錯誤訊息: line 2 did not have 5 elements #
x.b1 <- read.table("blank_ex1.txt", header=T)
#加上fill=T，這是讓資料的長度都一樣，blank那格就會是空的#
#加上na.strings=NA，可以讓blank資料呈現NA值#
x.b1 <- read.table("blank_ex1.txt", header=T, fill=T)
head(x.b1)
x.b2 <- read.table("blank_ex2.txt", header=T)
x.b2 <- read.table("blank_ex2.txt", header=T, fill=T)
head(x.b2)

##讀CSV檔##
read.csv(file, header = TRUE, sep = ",", quote = "\"",
         dec = ".", fill = TRUE, comment.char = "", ...)

read.csv2(file, header = TRUE, sep = ";", quote = "\"",
          dec = ",", fill = TRUE, comment.char = "", ...)

elections <- read.csv("elections-2000.csv")
head(elections)

##讀取用TAB分隔的檔案##
read.delim(file, header = TRUE, sep = "\t", quote = "\"",
           dec = ".", fill = TRUE, comment.char = "", ...)

mydata <- read.delim("mydata.txt")
head(mydata)
str(mydata)
##讀取日期時間資料##
myDT <- read.table("mydate.txt", 
                   sep = ";")
myDT
lapply(myDT, class)

#方法一#
varNames <- c("ID", "Values", "DateTime")
myDT <- read.table("mydate.txt", sep = ";", 
                   col.names = varNames)
myDT
lapply(myDT, class)
#striptime:將文字型式的日歷時間轉換成R 的“日期-時間類別物件#
myDT$DateTime <- strptime(myDT$DateTime, 
                          "%Y/%m/%d %H:%M:%S")
lapply(myDT, class)

##設定自訂日期時間格式##
setClass('myDateTime') 
setAs("character", "myDateTime", 
      function(from) as.POSIXct(from, format="%Y/%m/%d %H:%M:%S"))
varNames <- c("ID", "Values", "DateTime")
varClasses <- c("integer", "numeric", "myDateTime")
myDT <- read.table("mydate.txt", sep = ";", colClasses = varClasses, 
                   col.names = varNames)
myDT
lapply(myDT, class)

##注意事項##
read.table("input_testl.txt") #cannot open the connection#
read.table("input_test1.txt") #line 4 did not have 6 elements#
read.table("input_test1.txt", sep="\t")
read.table("input_test1.txt", sep="\t", header=T)

##讀取外部資料檔##
my.data <- scan(file="iris-data0.txt", what=list(w=numeric(0), x=numeric(0), 
                                                 y=numeric(0), z=numeric(0), name="character"))
my.mat <- as.data.frame(my.data)
my.mat

my.data <- scan(file="iris-data1.txt", what=list(n=integer(0), w=numeric(0), 
                                                 x=numeric(0), y=numeric(0), z=numeric(0), name="character"), skip=1)
my.data$n

##課堂練習##
getwd()

cat("1 2 3", "11 12 13", "21 22 23", "31 32 33", "41 42 43", 
    file="ex.txt", sep="\n")
scan(file="ex.txt", what=list(x=0, y="", z=0))

##匯入R內建資料##
#列出所有package的data set#
data()

data(Puromycin, package="datasets")
Puromycin

data(package="rpart")

#讀取R的rda檔案#
load("test.rda")

library("MASS")
data(crabs)
?crabs
class(crabs)
dim(crabs)
colnames(crabs)
str(crabs)



##編輯資料##
library(MASS)
class(crabs)
dim(crabs)
colnames(crabs)
str(crabs)
#edit(data.name): 會跳出一個資料編輯器讓你改所有資料#
edit(crabs)
#new.data <-edit(data.name)#
crabs.new <- edit(crabs)
fix(crabs.new)
#new.date <- edit(data.frame())#
new.data <- edit(matrix(0, ncol=2, nrow=3))


##匯出成資料檔##
write.csv(iris, "myNewData.csv", sep=",", col.names=TRUE)

write.table(iris, "myNewData.txt", quote=FALSE, sep="\t")

library(MASS)
hills
hills10 <- hills[1:10, 1:2]
hills10
#append = T，表示要輸出欄位名稱#
write.table(hills10, "hill10.txt", sep="\t", quote=F, row.names=TRUE)
#在既有的資料檔案中加資料時，需要有相同的欄位名稱#
write.table(hills[11:15,1:2], "hill10.txt", append=TRUE, sep="\t", row.names=TRUE, col.names=FALSE)


##課堂練習4##
#cat一定要帶/n，不然會一直在同一行#
zz <- file("output.txt", "w")
cat("Title line", "2 3 5 7", " ", "11 13 17", file=zz, sep="\n")
cat("One more line \n", file=zz)
close(zz)


zz <- textConnection("output.obj", "w")
#sink: 可以將 R 所執行結果紀錄進行匯出#
sink(zz)
example(lm)
sink()
close(zz)
cat(output.obj, sep="\n")
write(output.obj, file="result.txt")

#課堂練習5# #這邊我不是很懂#
iris[1:10, ]
write.table(iris, "iris-data0.txt", sep="\t", quote=F, row.names=FALSE, col.names = FALSE)
write.table(iris, "iris-data1.txt", sep="\t", quote=F, row.names=TRUE, col.names = TRUE)

write.table(hills[11:15,1:2], "iris-data2.txt", append=TRUE, sep="\t", row.names=TRUE, col.names=FALSE)

write.table(hills[11:15,1:2], "iris-data3.txt", append=TRUE, sep="\t", row.names=TRUE, col.names=FALSE)

##課堂練習5-2##
my.data0 <- read.table("iris-data0.txt")
my.data0[1:5, ] # or head(mydata0)

my.data1 <- read.table("iris-data1.txt")
my.data1[1:5, ]
#這個無法讀出檔案#
my.data2 <- read.table("iris-data2.txt", header=TRUE, row.names=1)
my.data2[1:5, ]
#這個無法讀出檔案#
my.data3 <- read.table("iris-data3.txt", header=TRUE, sep="\t")
my.data3[1:5, ]

my.sdata0 <- scan(file="iris-data0.txt", what=list(w=numeric(0), x=numeric(0), 
                                                   y=numeric(0), z=numeric(0), name="character"))
my.sdata0
my.mat <- as.data.frame(my.data)
my.mat[1:5, ]

my.sdata1 <- scan(file="iris-data1.txt", what=list(n=integer(0), w=numeric(0), 
                                                   x=numeric(0), y=numeric(0), z=numeric(0), name="character"), skip=1)
str(my.sdata1)
my.sdata1$n


##讀取部分資料##
x <- 1:10000; s <- sample(x, 10)
a1 <- which(x %in% s)
a2 <- intersect(x, s)
a3 <- which(is.element(x, s))

for(i in 1:10000){
  for(j in 1:10){
    if(all.equal(x[i], s[j])){
      cat("..")
    }
  }
}

n <- 10000
p <- 1000
Mat <- matrix(rnorm(n*p), nrow=n, ncol=p)
system.time(apply(Mat, 1, sum))

system.time(rowSums(Mat))


##二進位儲存資料##
n <- 1000
p <- 1000
Mat <- matrix(rnorm(n*p), 
              nrow=n, ncol=p)

system.time(write.table(Mat, file="myData.txt"))

system.time(read.table("myData.txt"))

system.time(save(Mat, file="myData.gz"))

system.time(load("myData.gz"))

system.time(save(Mat, file="myData.Rdata", compress=FALSE))

system.time(load("myData.Rdata"))


##讀取SPSS資料 - read.spss##
library(foreign)
dataset <- read.spss("electric.sav", to.data.frame=TRUE)
dim(dataset)
head(dataset)
#這是讀不出來的#
dataset2 <- read.spss("test-spss-data.sav", to.data.frame=TRUE) 


##讀取SPSS資料 - spss.system.file##
install.packages("memisc")
library(memisc)
install.packages("lattice")
library(lattice)
dataset2 <- as.data.set(spss.system.file("test-spss-data.sav"))
dim(dataset2)
head(dataset2)
str(dataset2)
dataset2$一.1
dataset2$服務品質

##讀取excel資料##
read.xlsx(file, sheetIndex, sheetName=NULL, rowIndex=NULL,
          startRow=NULL, endRow=NULL, colIndex=NULL,
          as.data.frame=TRUE, header=TRUE, colClasses=NA,
          keepFormulas=FALSE, encoding="unknown", ...)


##讀取xlsx套件##
install.packages("xlsx")
library(xlsx)
mydata.sheet1 <- read.xlsx("mydata.xlsx", 1) 
head(mydata.sheet1)
str(mydata.sheet1)
#可以多了解一下#
library(XLConnect)

##讀取/寫出excel資料檔案(xlsx套件)##
myCol <- c("integer", NA, rep("character", 2), rep("numeric", 8))
mydata.sheet2 <- read.xlsx("mydata.xlsx", 2, startRow=3, 
                           header=TRUE, encoding="UTF-8",
                           colClasses=myCol) 
head(mydata.sheet2, 2)
str(mydata.sheet2)

colnames(mydata.sheet2) <- c(colnames(mydata.sheet2)[1:4],
                             paste("Quiz", 1:4, sep=""), "TA", "MidCore1", "MidCore2", "MidSum")
head(mydata.sheet2, 2)

write.xlsx(mydata.sheet2, "calculus.xlsx") 

##讀取excel資料檔案: read_excel ##
library(readxl)
#readxl_example可以把例子抓出來#
readxl_example()
xlsx_example <- readxl_example("datasets.xlsx")
xlsx_example
mydata <- read_excel(xlsx_example) # reads both xls and xlsx.
head(mydata, 3)

##read_excel : More Controls ##
xlsx_file <- "mydata.xlsx"
excel_sheets(xlsx_file) # List the sheet names
mydata <- read_excel(xlsx_file, sheet = "工作表1", na = "NA")
head(mydata, 3)
str(mydata)
read_excel(xlsx_file, n_max = 3, na = "NA")


##read_excel : More Controls - 2 ##
read_excel(xlsx_file, range = "C1:E4")
read_excel(xlsx_file, range = cell_rows(1:4))
read_excel(xlsx_file, range = cell_cols("B:D"), na = "NA")
# write data to a excel file
outdata <- list(iris = iris, airquality = airquality)
install.packages("openxlsx")
library(openxlsx)
write.xlsx(outdata, file = "outdata.xlsx")

##利用RStudio匯入資料:CSV/excel/spss/sas/stata##
library(haven)
math <- read_sav("C:/Users/ASUS/Documents/GitHub/NTPU_108_R/math.sav") # read spss data file
View(math)
meat <- read_sas("C:/Users/ASUS/Documents/GitHub/NTPU_108_R/meat.sas7bdat")
View(meat)
