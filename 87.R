library(dslabs)
data("research_funding_rates")
t<- research_funding_rates %>%
  select(-discipline) %>% 
  summarise_all(funs(sum)) %>% 
  summarize(yes_men = awards_men,
            no_men = applications_men - awards_men,
            yes_women = awards_women,
            no_women = applications_women - awards_women)

t
t %>% summarize(percent_men = yes_men/(yes_men + no_men),
                     percent_women = yes_women/(yes_women + no_women))
