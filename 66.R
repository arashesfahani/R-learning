library(tidyverse)
library(dslabs)
library(dplyr)
data("gapminder")
gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)
past_year <- 1970
west <- c("Northern Europe",  "Northern America", "Western Europe", "Southern Europe", "Australia and New Zealand")
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2") +
  facet_grid(. ~ group)
levels(gapminder$group)
gapminder$group

gapminder %>% mutate(group = ifelse(region %in% west, "West", "Developing"))
gapminder %>% mutate(a=gdp*population)
gapminder
