# list all items in memory
ls()

# working with directories
a = getwd()
print(a)

# priting to the screen
print("Hello awesome R!")

# concatenate vectors after converting to character
sentence <- paste("Working dir:", a)
?paste
sentence

summary(l_list)
print(l_list)

# edit file
editable <-edit(l_list)
editable

editor <-edit(cyless)
editor

#Basic operators
2 + 3 - 4 * 5/2 
sqrt(2)
2^2 
2**4

10%%3 #modulus division
10%/%3 # integer division

#Logical operations
a = 3:5
b = 5:7

a > 4
a < 4
a <= 4 
a >= 4 

a == 4
a != 4

#Combine logical operation

(a == 4) & (b ==6)
(a == 4) | (b > 5)

### Introduction to common types of objects in R
## Classes of objects in R

# Vector: has 1 dimensions and one type of data
snowVector <- c(1.1:10)
length(snowVector)
mode(snowVector)
class(snowVector)
typeof(snowVector)

# Matrix: has 2 dimensions and one type of data
iceMatrix <- matrix(1:10, nrow = 2)
length(iceMatrix)
mode(iceMatrix)
class(iceMatrix)
typeof(iceMatrix)

# Array: has 2 (matrix) or more dimensions and one type of data
coldArray <- array(1:3, dim=c(3,3,3))
length(coldArray)
mode(coldArray)
class(coldArray)
typeof(coldArray)

### Data frames: Set of data with different data types.
# Simplest way to explain 
# energy_case7 <- read.csv("Case7.xlsx")
View(iris)
length(iris)
mode(iris)
class(iris)
typeof(iris)

### List: is a collection of different objects
# Different data types are possible and common
sommerList <- list(a=snowVector, b=iceMatrix)
length(sommerList)
mode(sommerList)
class(sommerList)
typeof(sommerList)

# Even the components are of the same type, mode, and class list

winterList <- list(a=snowVector, b=snowVector)
length(winterList)
mode(winterList)
class(winterList)
typeof(winterList)
View(winterList)

# removing objects
x = c(rep(4,5))
View(x)
rm(x)

# Functions are also seen as objects in R
# In rare instances Environments are also use

# Data Types in R
# there are different ways in which to specify the data types in R
# most important ones are mode and typeof
# some data types differ between mode/typeof, some stay the same

# mode(storage mode)
# eg.: Logical, numeric, complex, character, list, function

# Can be divided into atomic and recursive
##### Atomic: logical, numeric, complex, character
  # (same data types)
##### recursive: list, function
  # (different data types)

# typeof
# eg: logical, integer, double(like numeric)
      # complex, character, list, closure

a = (1:5)
b = rep(1.45,3)
c = c("wed", "tue", " sat")
d = c(1+7i, 2+4i)
e = c(T, T, F, F)
fun = function(x) {x+3}

a
mode(a)
typeof(a)

b
mode(b)
typeof(b)

c
mode(c)
typeof(c)

d
mode(d)
typeof(d)

e
mode(e)
typeof(e)

fun
mode(fun)
typeof(fun)

# Coerce = change the mode of the data

e
f = as.character(e)
f

### RANDOM Number Generation ###

# generate 100 numbers with the mean 3

rnorm(100, mean=3)

y <- rnorm(100, mean = 3)

# plot histogram to check the distributions
hist(y)

# default is mean = 0, sd = 1
rnorm(100)
hist(rnorm(1000))

### same for poison distribution

rpois(100, lambda = 3)
hist(rpois(1000, lambda = 3))

### Also the uniform distribution
### default value is between 0 and 1

runif(100)
hist(runif(1000))

### using set.seed to fix the number generator
set.seed(50)
rnorm(10)

### Exercise on Random
# 1.Get 100 random nrs which are uniformly distributed
#   thos number should be between 1 and 100

?runif
ran_num  <- runif(100, 1, 100)
View(ran_num)

# 2. Get a vector from this random numbers 
#   consisting of every tenth value
tenth_value <- ran_num[seq (from = 10, by = 10, length = 10)]
View(tenth_value)

# 3. Find out what the argument lambda does in rpois by manuplating it
lambda_argum <- rpois(1000, lambda = 10)
hist(lambda_argum)

#### EXPORT and IMPORT to/from Excel

# the best way to do this is via csv files
# <- comma separated value

# first set the working directory
# go to sesion, set working dir

a = 1:4
b = c("a", "b", "c", "d")
testdf = cbind(a, b)
?cbind

# to create and store a csv file in the working dir(wd):
write.csv(testdf, file="testdf.csv")
View(testdf)

# to import a csv file
?read.csv

# read table is a more general approach
myimport2 <- read.table(file.choose(), header=T)

# you have to specify the seperator
myimport3 <- read.table(file.choose(), header=T, sep=",")

# if you would have a txt file, use read.delim

#### MATRICES

matrix( c(1,2,3,4,5,6))

### number of rows
matrix(c(1,2,3,4,5,6), nr = 2)

### number of columns
matrix(c(1,2,3,4,5,6), nc = 2)

# make sure to have an even number of values
matrix(c(1,2,3,4,5,6,7), nc = 3)

#identify row and columns
matrix(c(1,2,3,4), nr = 2, nc = 2, dimnames = list( c("Row 1", "Row 2"), c("Col 1", "Col 2"))


### creating a diagonal matrix
xy = 1:3
diag(x)

# extracting a vector of a diagonal matrix
Y = diag(xy)
diag(Y)
       
### transpose a matrix
W <- matrix( c(2,4,8,12), nr = 2, ncol = 2)
W
t(W)

U <- t(W)
U

### get the inverse of a matrix
solve(W)

### multiple matrics
C <- matrix(c(5,7,8,9), nr = 2)

W * W
W * C
W * Y

### get the crossproduct
crossprod(W)

### Multiple a matrix with a vector
x = 1:3
Y * x 

### solving equation system 
solve(Y,x)


#### Exercise Matrices
# 1. Create 3x3 matrixs
Z = matrix(c(7, -7, 7), nr = 3, nc = 3, byrow = T,
                     dimnames = list( c("row 1", "row 2", "row 3"),
                                      c("col 1", "col 2", "col 3")))

Z
t(Z) * Z

crossprod(Z)/3

### LISTS in R

# use "list" to create a list
l_list <- list(1:10, c("Tomm", " Mikoo", "Frank"), rnorm(10)) 
# List contains 3 elements of 3 different data types
l_list

# to name the elements
names(l_list) <- c("Int", "Char", "Numeric")
l_list

#to learn the length of the list(how many elements)
length(l_list)

#to get the length of a single element
length(l_list$Int)

# to directly name the elelments
morelist <- list(a=3:5, b=c(5,54,6,23))
morelist

# working with specific elements of the list
morelist$a

# extract a specific position
morelist$b[2]

# get the mode of the elements
mode(l_list$Numeric)

#combine two lists
combinedlist <- c(l_list, morelist)
combinedlist

### Exercise Creating a list containing 3 elements(Characters, Numeric and Integer) and 
#   access the second value of the second element
ex_list <-list(a=c("cat", "rat", "fat"), b = rnorm(12), c = 2:6)
ex_list$b[2]

#### DATA FRAMES
# 2 dimensional objects with different data types

# row = observation
# column = variables
?mtcars
mtcars

country = c("nether", "ghana", "France", "India")
name = c("cat", "rat", "fat", "loat")
bheight = c(12, 23.4, 12.4, 46.4)
bmi = c(39,26,23,23)

# vectors need to be the same length to be in the same data frame
# to create a data frame out of several vectors, use data.frame

survey = data.frame(country, name, bmi, bheight)
survey

# to create a new vector to an existing data frame
newvec = c(T, F, T, T)
newvec
newsurvey = cbind(survey, newvec)
newsurvey 

# to extract a vector out of the data frame
mtcars$wt

# Or attach function
attach(mtcars)
wt

# remove the attachment 
detach(mtcars)
wt

# extract a single entry
mtcars[2,2]
# extracting a row
mtcars[2,]
# extracting a column
mtcars[,2]

# to logically filter parts of the data set
attach(mtcars)
cyl

cyl < 5

# to filter for a subset of data which meets the criteria
cyless <- mtcars[cyl<5,]
length(cyless)

# to specify the output columns wanted(select)
mtcars[cyl < 5, c("disp", "hp", "am")]
datamt <- mtcars[cyl < 5, c("disp", "hp", "am")]
View(datamt)


### FACTORS
# Factors help to store character data
# By using factor it is easier to perform calculations
# some commands require factors to be executed.

iris
iris$Species
# has long character column

# the problem is that it is sometimes inefficient to handle long characters
# solution: create a vector of factors
as.integer(iris$Species)

# factors can be stored as integers...and add to the dataframe
FactorSp = as.integer(iris$Species)

newiris = cbind(iris, FactorSp)
newiris


#### Exercise Factor
spcounter = length(iris$Species)
spcounter

summary(iris)
head(iris)
names(iris)

attach(iris)
summary(iris$Species)
myFilter = (iris$Species == "virginica")
myFilter

newIris = cbind(iris,myFilter)
newIris            
names(newIris)

virginica.s = newIris[myFilter==T, c("Sepal.Length", "Sepal.Width")]
virginica.s

class(virginica.s)

### FUNCTIONS in R
# R functions are OBJECTS
# used to do calculations 
# R function structure: name function(argument)(statements)
# the arguments specify the components to be used in the function

funone <- function(x) (x*2)
funone(2)

# Stepwise(the Object "value") working functions

funtwo <- function(t,x) {
  value = x*4
  value = value *t
  print(value)
  }
funtwo(2,3)

# triple dots can be used as a place holder, for any argument to be used Open ended
testfun <- function(...){
  datafr = data.frame(cbind(...))
  print(datafr)
}
# create  a new vectors
a = (5:9)
b = c("Vo","Rb", "Te", "Ol", "Op")

testfun(a,b)

# use the function in anyway as long as the vectors have
c = c(4.5,23.23, 32.2, 6.6, 45.7)
testfun(c,b,a)

### IFELSE Statement
# is used to incorporate logical conditions in functions
# is a bit different to the IF statement
# Syntax: ifelse (logical condition or test),
    # calculations if yes, calculation if no)

x = 4
ifelse(x<5, "target", NA)

#if conditions not met
x = 7
ifelse(x<5, "target", NA)

# nested ifelse
# the result should be of same length as this vector
x=c(0,7,8)
ifelse( x < 2, " smaller",
        ifelse(x==6, "equal", "greater"))

# ifelse in function

ifelsefun <- function(y,z){
  ifelse(y <= 7, y + z, "above target")
}

ifelsefun(4,3)
ifelsefun(7,9)


#### EXERCISES
# moving average
x= 1:20
moveave = function(x){
  l <- length(x)
  (x[1:(l-2)] + x[2:(l-1)] + x[3:l])/3  
}

moveave(1:20)

# Even matrix
matrixfun <- function(mat){
  mat[mat%%2 == 1] <-2* mat[mat%%2 ==1] #modulo operator for odd numbers
  mat}
mat <- matrix(1:4, ncol=2)
matrixfun(mat)

# Ifelse
nestedfun = function(x,y){
  ifelse(x<9, y+9, ifelse(x==9, x,ifelse(x==12, NA, x-y)))
}
x=5:15
y=1:11
nestedfun(x, y)


### LOOPS in R
# in R: loops: FOR, WHILE and REPEAT
# if statement
# which command the computer to execute under some condition
# syntax: if (condistion) {command if T} else {command if F}

x = 10
if(x < 15) { y = T}

if(x < 9) {
  y = T
} else {
  y = F
}

# Neste numerous commands
x = 7
if (x <9){
  y = T
} else if (x == 7){
  y = "Target"
} else {
  y = 7
}

# FOR loops
# syntax: for (name in vector) {commands}

for(i in 1:15) {
  print (i)
}
for(z in 1:5) {
  print (z)
}

# to skip certain elements in the loop: next
for(z in 1:5) {
  if(z==4)
    next
  print (z)
}

# to break/stop the loop: break
for(i in 1:12) {
  if(i==4)
    break
  print (i)
}

#FIBONACCI
Fibonacci = c()

#define first two numbers
Fibonacci[1] = Fibonacci[2] = 1

for (i in 3:20) {
  Fibonacci[i] = Fibonacci[i-2] + Fibonacci[i-1]
}
Fibonacci

### WHILE LOOP
#syntax: while(condition) {commands}

x = 5
while (x < 7){
  x = x + 1
  print (x)
}

### ALL fibonacci numbers below 400
Fi1= 1
Fi2 = 1

Fibonacci = c(Fi2)
while(Fi2 < 400){
  #vector of the previously calculated value and the new Fi2
  Fibonacci = c(Fibonacci, Fi2)
  oldFi2 = Fi2
  Fi2 = Fi1 + Fi2
  Fi1 = oldFi2 }
Fibonacci

### REPEAT loop
# to repeat a certain statement endlessly(different for FOR)
# with the break statement terminate the loop
# syntax: repeat {statement} if(condition)  break

x = 1
repeat {
  x = x +3
  if(x > 21)
    break
  print(x)
}

x = 1
repeat {
  x = x +3
  print(x)
  if(x > 21)
    break  
}

#### EXERCISE on LOOPS

for(i in 20:30){
  if(i==22){
    print ( "My First FOR loop in R")
  }
  print (i)
}

summary(lynx)
View(lynx)
lynx[x]
for(i in lynx){
  if(i<100)
  print(i)
}

for(i in lynx){
  if(i<1000){
    print("Low trapping rate")
  } else if(i > 1000){
    print("Low trapping rate")
  } else{
    print("Target rate")
  }
}




