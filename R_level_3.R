### GRAPHS
?par
# check the default/preset parameters
par()

par(bty="o")
plot(lynx, bg="red")

plot(iris)
#1. Boxplots
# are a perfect way to compare distributions of different groups
# standard tool for scientific publicstion

?sleep

sleepboxplot = boxplot(data = sleep, extra ~ group,
                       main = "Change in sleep duraion",
                       col.main = "red", ylab="Changes in hrs", xlab="drug")

attach(sleep)
means = by(extra, group, mean)
points(means,col = "red")

# to change the orientaion of the boxplot: horizontal = T
horiboxplot = boxplot(data = sleep, extra ~ group,
                         ylab="", xlab="", horizontal = T,
                      col = c("grey38", "red"))

colors()

# Exercise Boxplot
# PlantGrowth
summary(PlantGrowth)
PlantGrowth

x <- PlantGrowth$weight
y <- PlantGrowth$group

means <- by(x,y, mean)
means
par(bty="n")

boxplot(x~y, ylab= "Plant Weight", main = "Treatment & Effect \n on Plant Growth",
        cex.main = 1.5, col.main = "darkblue", names=c("Control", "Treatement 1", "Treatement 2"))
points(means, col="blue", pch=20)


### PIE Charts
?pie

# to create the slices and define the size
slices = c(40, 20, 40)
# name(labels) of the slices- With the length
countries = c("Cananda", "Finland", "Australia")

# to add the slice size to the labels
countries = paste(countries, slices)

# to further specify the labels
countries = paste(countries, "%", sep = "")

## the actual pie
pie(slices, labels=countries,
    col=c("red", "blue", "green"), main = "Sales Distr.")

#### Working with data frames
attach(iris)

values = table(Species)  # table for counts
values
labels = paste(names(values))
labels
pie(values, labels = labels, main="Species Distro")

### Add 3D effect
library(plotrix)

#then we can use pie3D
pie3D(slices, labels=countries, explode = 0.05,
    col=c("red", "blue", "green"), main = "Sales Distr.")

### HISTOGRAM
# probablity distribution, divided into intervals or bins
?hist
# break determines the interval
ourdata = cars$speed
hist(ourdata)

hist(ourdata, labels = T, breaks=c(0.5, 10, 20, 30))

hist(ourdata, labels = T, breaks=c(10))

# we can adjust the scales
hist(ourdata, labels = T, ylim=c(0,10), breaks=10)

#fitting the axes for the curve

data = hist(ourdata, breaks=10)
xaxis = seq(min(ourdata), max(ourdata), length=10)
yaxis = dnorm(xaxis,mean=mean(ourdata), sd=sd(ourdata))
yaxis = yaxis*diff(data$mids)*length(ourdata)

# Add the normal curve
lines(xaxis, yaxis, col="red")

###Change the frequency to density
hist(ourdata, freq= F, breaks=10, labels = T,)

## and the density line
lines(density(ourdata),col="blue", lwd = 2)


#### Exercise HISTO

hist(lynx, labels = T, ylim=c(0, 70), breaks=9,
     col=c("white", "green"),
     main="Annual Lynx Trappings",
     xlab="Number of lynx trappings\n per year")
mtext("1821-1934")

### SCATTER PLOT


set.seed(67)
x = rnorm(11,5,7)
y = rpois(11,7)
z = rnorm(11, 6, 7)
t = rpois(11,9)

# Create scatter plot
plot(x,y, col=123, pch=10, main="Multi Scatterplot",
     col.main="red", cex.main=1.5, xlab="indep", ylab="dep")
# Add another layer on the scatterplot
points(z,t, col="blue", pch=4)

# and more
points(y,t, col="red", pch=9)

## Legend
legend(-6,5.9, legend=c("level 1", "level 2", "level 3"),
       col=c(123, "blue", 777), pch=c(10,4,9), cex=0.65, bty="n")

### Exercise Scatter plot
x = 1:5
y = rep(4,5)
x1 = 1.1:5.1
y1 = 5:1

# Create scatter plot
plot(x,y, col=123, pch=10, main="Exercise Solution",
     col.main="red", cex.main=1.3, xlab="indep", ylab="dep")
# Add another layer on the scatterplot
points(x1,y1, col="blue", pch=4)

# and more
points(x1,x, col="red", pch=9)

## Legend
legend(1,3.5, legend=c("level 1", "level 2", "level 3"),
       col=c(123, "blue", 777), pch=c(10,4,9), cex=0.75, bty="n")