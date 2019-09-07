#排列數 / 組合數#
x <- letters[1:3]
install.packages("combinat")
library(combinat)
permn(x)


combn(5, 3)
combn(5, 3, min)
choose(5, 3) #5取3#


#機率密度函數# f(x) >= 0
dnorm()

x <- seq(-4, 4, 0.1)
plot(x, dnorm(x), type="l", main="N(0,1)")
curve(dnorm(x), from=-4, to=4)

####離散型:機率質量數####
x <- 0:50
plot(x, dbinom(x, size=50, prob=0.33), type="h") 

#累積機率函數#
pnorm()

#分位數#
qnorm()

#隨機數#
rnorm()

