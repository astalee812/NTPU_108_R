#1-1#
set.seed(12345)
student.id <- paste("student", 1:50, sep=".")
Calculus <- round(rnorm(length(student.id),mean = 65, sd = 10),0)
LinearAlgebra <- sample(1:100, length(student.id), replace = T)


aa <- data.frame(student.id,Calculus,LinearAlgebra)
aa$note <- ifelse((aa$Calculus>=85 & aa$LinearAlgebra >= 85),"佳", ifelse((aa$Calculus<40 & aa$LinearAlgebra <40),"危險",ifelse((aa$Calculus<= 40 | aa$LinearAlgebra <= 40 ),"要加強","")))
table(aa$note)
aa[aa$note =="佳" | aa$note == "危險"]

#1-2#
x <- c(-5:5)
y <-data.frame(x,ifelse(x<0,abs((x^2)+x),ifelse((x>=0 & x<3),sin(x),ifelse(x>=3,3*exp(x),""))))
names(y) <- c("x","f(x)")
y



#1-3#
set.seed(12345)
no <- sample(20:100, 1)
nv <- LETTERS[sample(1:26, 5)][sample(1:5, no, replace=T)]


iqv <- function(x){
  n <- length(x)
  k <- length(unique(x))
  df <- as.data.frame(table(x))
  f <- sum((df[,2])^2)
  i <- k*((n^2)-f) / ((n^2)-(k-1))
  i
}

iqv(nv)
