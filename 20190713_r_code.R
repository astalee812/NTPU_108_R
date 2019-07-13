#----序列----#
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
x <- 1:10
y <- 10:2
2*1:10 #這個東西是先做1:10再去*2# #冒號是優先於加減乘除#

n <- 10
1:n-1
1:(n-1)

width <- 1
seq(from = 2, to = 5, by = width)

s1 <- seq(-5, 5, by = 0.2) 
s1

s2 <- seq(length = 51, from = -5, by = 0.2)
s2

x <- 5
rep(x, times=5)

rep(x, each=5)

rep(1:4, each=5)

rep(LETTERS[1:4], 3) #LETTERS是取英文字母#

rep(LETTERS[1:4], length.out=3) #length.out就是取三個#

#---邏輯向量----#
x <- c(12, 4, 7, 20, 13)
x < 15
x <= 15
x > 13
x >= 10
x == 12
x != 20
(x = 3)

(x > 10)
x != 20
(x > 10) & (x != 20)
(x > 10) | (x != 20) #union 'or'#

(x >= 10)
1*(x >= 10) #false = 0, ture = non 0#
(x >= 15)
2*(x >= 15)

#----遺失值----#
z <- c(1:3,NA)
is.na(z) #R的語言中無法用z == NA這樣的語法#

score <- c(60,50,NA,90)
score[is.na(score)]

#NaN 不是數字#
is.na(z)
is.nan(z)


#----文字向量----#
paste("A", 1:6, sep = "")
paste("Today is", date()) 
labs <- paste(c("X", "Y"), 1:10, sep = "")
labs
#在不要有分隔符號的時候可以使用paste0函數#
paste0("A", 1:6)


#----跳脫字元----#
# \n: 產生新的一行#
# \t: 產生一個tab #
# \b: 產生一個backspace#
cat("How are you?", "\n", "I'm fine.", "\n")
cat("How are you?", "\t", "I'm fine.", "\n")
cat("How are you?", "\b\b\b", "I'm fine.")


#----索引向量----#
x <- c(7, 2, 4, 9, NA, 4)
x[2]
x[5]
x[0]  
x[10]
y <- x[!is.na(x)]  #找出不是na值#
y
(x+1)[(!is.na(x))&(x>0)] -> z
z

#把NA變成0分#
score <- c(60,50,NA,90)
score[is.na(score)] <- 0 
score
#使用xy來蓋過數值#
rep(c(1,2,2,1), times=3)
c("x","y")[rep(c(1,2,2,1), times=3)]

x <- c(7, 2, 4, 9, NA, 4)
x[-2]
x[-(1:3)]

x <- c(7, 2, 4, 9, NA, 4)
x[is.na(x)] <- 0
x

y <- c(-7, 2, 4, 9, 0, -4)
abs(y)
#絕對值的程式設計#
y[y<0] <- - y[y<0]
y

#向量可以給數字#
fruit <- c(5, 10, 1, 20)
fruit
names(fruit) <- c("orange", "banana", "apple", "peach")
fruit
lunch <- fruit[c("apple", "orange")]
lunch
#把名字變成A1, A2, A3 ....#
names(fruit) <- paste("A",1:length(fruit))

#----因子----#
scores <- c(60, 49, 90, 54, 54, 48, 61, 61, 51, 49, 49)
gender <- c("f", "f", "m", "f", "m", "m", "m", "m", "f", "f", "m")
#看我們有幾個因子#
levels(gender)
#把資料變成因子#
gender.f <- factor(gender)
gender.f
levels(gender.f)
table(gender.f)
#把因子名稱換成中文#
levels(gender.f) <- c("女", "男")
gender.f
(scores.mean <- tapply(scores, gender.f, mean))
#設定有順序的因子#
grade <- as.factor(c("B", "F", "A", "C", "A", "C", "B", "A", "F", "D"))
levels(grade)
grade2 <- ordered(grade, levels = rev(levels(grade))) #rev 倒過來#
grade2
#找出國中以上的#
grade2[which(grade2 >= "B")] #which是篩選誰是Ture#


MyLetter <- c("C", "D", "A", "K", "A", "I", "J", "I", "K", "H", "A", "K", "K", "B", "E", "H", "G", "L", "H", "H", "I", "K", "B", "D")
MyLetter.factor <- factor(MyLetter)
MyLetter.factor
table(MyLetter.factor)
MyLetter.ordered <- factor(MyLetter, levels = c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"), ordered = TRUE)
MyLetter.ordered[1] < MyLetter.ordered[2]
table(MyLetter.ordered)

#----陣列----#
z <- 1:30
z
dim(z) <- c(3,5,2) #欄位先放#
z

z[1, 3, 2]
z[1,1,]
z[1,,2]
z[1,1:2,1]
z[-1,,]


x <- array(1:20, dim=c(4,5))
x
i <- array(c(1:3, 3:1), dim=c(3,2))
i
x[i] <- 0  #這個我不懂#
x


x <- c(1,2,3,4,5)
x
z <- array(x, dim=c(3,4))
z
t(z) #t()轉至矩陣# 


#----矩陣----#
x <- 1:20
A <- matrix(x, ncol=4)
A
A.1 <- matrix(x, ncol=4, byrow=TRUE) #byrow是讓數字變依照列為填入#
A.1
nrow(A)
ncol(A)
dim(A)
diag(A) #單位矩陣#
B <- matrix(x+2, ncol=4)
A * B 
A %*% t(B) 

x <- 4
diag(x) #單位矩陣#


mat <- matrix(1:20, ncol=5)
apply(mat, 1, mean) #各列平均#
apply(mat, 2, mean) # column means
apply(mat, 1, var) # row variances
apply(mat, 2, var) # column variances
mean(mat)
var(mat) #共變異數矩陣#
summary(mat)

#----矩陣索引----#
(y <- array(1:15, dim=c(3, 5)))
dim(y)
x <- matrix(1:15, 3, 5)
x
x[1]
x[4]
x <- matrix(1:15, 3, 5, byrow=TRUE)
x
x[1]
x[4]

y[2, 4]
y[1,]
y[,1]
y[2:3, ]
y[-2,]
y[,-2]
dimnames(y) #矩陣名稱#
rownames(y)
colnames(y) 

dimnames(y) <- #给矩陣名稱-練習#
rownames(y)
colnames(y)


#----矩陣結合----#
x <- c(1, 2, 3, 4, 5)
y <- c(0.5, 0.4, 0.3, 0.2, 0.1)
(z1 <- cbind(x,y))
(z2 <- rbind(x,y))





#----練習題----#
#產生12233344455555#
rep(1:5,1:5)

#產生544333222211111#
rep(5:1,1:5)

#產生123123123#
rep(1:3,3)

#使用rev/sequence產生123452345345455#





#20頁練習題#
x <- c(NA, 0 / 0, Inf - Inf, Inf, 5) # Inf is a number. 
x
y <- data.frame(x, is.na(x), is.nan(x), x == Inf, x == 5)
y

colnames(y) <- c("x", "is.na(x)", "is.nan(x)", "x == Inf", "x == 5")
y



