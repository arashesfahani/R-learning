install.packages('foreign')
library(foreign)
library(ggplot2)
corona<-read.csv('C:\\Users\\Arash\\Desktop\\R\\corona.csv')
names(corona)
table(corona$q6)
glimpse()
install.packages('expss')
library(expss)
corona$q4
val_lab(corona$q4) = num_lab("
            -1 missing
             0 death    
             1 economy
             2 Hard to say
")
table(corona$q4)
barplot(table(corona$q4)/10.80, col = 'green', xlab = 'corona; life or economy?'
        )
