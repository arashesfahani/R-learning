library(tidyverse)
library(ggthemes)
data("diamonds")
data(mpg)
mpg %>% ggplot(aes(x=cty, y=hwy))+
  geom_point()+
  geom_abline()+
  coord_fixed()
?coord_fixed()
?geom_abline()
mpg %>% ggplot(aes(x=class, y=hwy))+
  stat_summary(fun.y = median, geom = 'bar')+
  coord_cartesian(ylim = c(0,50))
mpg %>% ggplot(aes(x=class, y=hwy))+
  geom_bar(stat = 'summary', fun=mean, width=.3, fill='green')
view(mpg)
seq(1,21)

mpg %>% ggplot()+
  geom_bar(aes(x=class, y=..prop.., group=1),
           fill=rgb(0.2,0.4,0.6,0.6))
  
mpg %>% ggplot(aes(x=class)) +
        geom_bar(aes(y = (..count..)/sum(..count..)*100))+
  theme_solarized()
  
  
theme_economist()  
install.packages('nycflights13')
library(nycflights13)
?flights
view(flights)
flights$arr_delay[between(flights$arr_delay,0,21)]
?between
is.na(flights$dep_time)
colnames(flights)
flights %>% filter(!is.na(dep_time))
table(flights$carrier)
a<- colnames(flights)
a
one_of(a)
flights %>% select(one_of('year', 'day', 'dep_time'))
