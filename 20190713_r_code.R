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



