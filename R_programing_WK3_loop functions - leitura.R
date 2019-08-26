x <- list (a=1:5 , b = rnorm(10))
lapply(x, mean)

x <- 1:4
lapply(x, runif)

x <- 1:4
lapply(x, runif, min = 0 , max=10)

x <- list(a = matrix(1:4,2,2), b = matrix(1:6, 3, 2))
lapply(x, function(elt) elt[,1])