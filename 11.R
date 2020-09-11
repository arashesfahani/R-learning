library(dslabs)
data(murders)
sort(murders$total)
names(murders)
a<-c(6,17,19,3,12,5)
b<-order(a)
r<-rank(a)
b
r
m<-c('a','b','c','d','e', 'f')
m[b]
m[r]
index<-order(murders$total)
murders$abb[index]
index
which.max(murders$total)
murders$abb[which.max(murders$total)]
rate<-(murders$total)/(murders$population)*100000
rate
murders$state[order(rate, decreasing = TRUE)]
install.packages("dplyr")
library(dplyr)
head(murders)
data(murders)
murders <- mutate(murders, rate = total / population * 100000)
head(murders)
?mutate

table2<-filter(murders, rate<1)
head(table2)
table3<-select(murders,abb , rate)
head(table3)
rank(murders$rate)
order(murders$rate)
murders$state[order(murders$rate)]
murders$rate[murders$state=="Vermont"]
murders$state[order(murders$rate)

hist(murders$rate)
murders$state[which.max(murders$rate)]
boxplot(rate~region, data=murders)



data(na_example)
data(na_example)
head(na_example)
na_example
is.na(na_example)
no_nas <- ifelse(is.na(na_example), 0, na_example)
no_nas
sum(is.na(no_nas))
sum(is.na(no_nas))  
murders
tab33<-ifelse(murders$population>1000000,murders$population<-1,murders$population<-2)
tab33
