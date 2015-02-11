### The apply family of functions
# an elegant way to do loops

# apply(array - matrices)
# tapply(vectors can be split in different subsets)
# lapply
# rapply(similar to lapply)
# mapply(multivaria)

### APPLY
?apply

xap = matrix(c(1:9), nr = 3, byrow = T)
xap
## MARGIN :: 1 is for row, 2 is for col

apply(xap, 1, mean)  # gives the mean of every row
apply(xap, 2, mean)  # gives the mean of every row

apply(xap, 1, plot) # even graphics funtions are possible

### TAPPLY
?tapply
# tapply is used to work with subsets of vectors
# tapply factor(given by the INDEX) determins which group 
tapply(1:4, c(3,3,3,3), sum, simplify = F)

# to get two groups
tapply(1:4, c(3,3,3,4), sum, simplify = F)

# simplify gets just another output
tapply(1:4, c(3,3,3,4), sum, simplify = T)


### BY
?by

head(iris)

# Specify which column we want to work with []
by(iris[1:4], iris$Species, colMeans)

# drop the first column
by(iris[2:4], iris$Species, colMeans)

### EAPPLY
# create an enviroment
e <- new.env()
e$e1 <-(3:8)
e$e2 <-(56:61)
e

# run function, only for enviroments
eapply(e, mean)

###LAPPLY(whole subfamily)
# lapply is used for lists
mylist <- list(a=(1:10), n=(45:77))
mylist

# result has same length as the list
resulapp <-lapply(mylist, sum)
resulapp

# vector
myv <- c(1:5)
lapply(myv, sum)

### SAPPLY
# the out put is similar to vec or mat
resulsapp <-sapply(mylist, sum)
resulsapp

### VAPPLY
# similar to vapply  but the output can be specified
# Classic example is fivenum function(five nr summary)

vares <- vapply(mylist, fivenum,
                c(Min. = 0, "1st Qu. " = 0, Median = 0,

                  "3rd Qu." = 0, Max = 0))
# the result is a matrix with row names = output functions 
#and col names = list names
vares

### REPLICATE
# allows for replication of random number generation
represul <- replicate(4, runif(10))
represul

### MAPPLY
# similar to sapply but for multivariate
# functions are applied in different levels
mapply(rep, 1:4, 4:1)

# recycling (lenght must be a multiple)
mapply(rep, 1:8, 4:1)


### RAPPLY
# similar to lapply

list1 <- list(a=c(1:5), b=c(6:10))
list1

rapply(list1, sum) # result is "unlist": vector
rapply(list1, sum, how = "list")

a = c(TRUE, FALSE, TRUE)
b = c(4:6)

list2 <- list(a=a, b=b)
list2

# using class argument to apply the function only to this class
# of the mixed list
# the class argument is a good way to handle mixed lists
rapply(list2, median, class="integer")


