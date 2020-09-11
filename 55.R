library(tidyverse)
library(dslabs)
library(dplyr)
data("gapminder")
head(gapminder)
gapminder <- mutate(gapminder, incomeperday=gdp/population/365)


gapminder %>% filter(year==1970 & !is.na(gdp))%>%
  ggplot(aes(log2(incomeperday)))+
  geom_histogram(binwidth = 1, color='black')

gapminder %>% filter(year==1970 & !is.na(gdp))%>%
  ggplot(aes(incomeperday))+
  geom_histogram(binwidth = 1, color='black')

gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)



# histogram of dollars per day
past_year <- 1970

gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black")

# repeat histogram with log2 scaled data
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(log2(dollars_per_day))) +
  geom_histogram(binwidth = 1, color = "black")




levels(gapminder$region)
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(region, dollars_per_day)) +
  geom_boxplot()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
a <- factor(c('ali', 'hasann', 'akvar'))
class(a)


p<- gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(region, dollars_per_day, fill = continent)) +  
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("")
mutate(gapminder, region = reorder(region, dollars_per_day, FUN = mean))
gapminder$dollars_per_day
gapminder
