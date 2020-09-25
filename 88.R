library(dslabs)
library(tidyverse)
data("polls_us_election_2016")
names(polls_us_election_2016)
polls <- polls_us_election_2016 %>%
  filter(state == "U.S." & enddate >= "2016-10-31" &
           (grade %in% c("A+", "A", "A-", "B+") | is.na(grade)))
polls_us_election_2016$state
levels(polls_us_election_2016$enddate)
polls_us_election_2016$enddate
table(polls_us_election_2016$enddate)
polls_us_election_2016 %>% ggplot(aes(enddate))+
  geom_bar()
polls <- polls_us_election_2016 %>%
  filter(state == "U.S." & enddate >= "2016-10-31" &
           (grade %in% c("A+", "A", "A-", "B+") | is.na(grade)))
polls_us_election_2016$rawpoll_clinton
names(polls)
class(polls)
polls <- polls %>% 
  mutate(spread=rawpoll_clinton/100-rawpoll_trump/100)
polls$spread
d_hat <- polls %>%
  summarize(d_hat = sum(spread * samplesize) / sum(samplesize)) %>%
  .$d_hat
p_hat <- (d_hat+1)/2
p_hat
moe <- 1.96 * 2 * sqrt(p_hat*(1-p_hat)/sum(polls$samplesize))
moe
polls %>%
  ggplot(aes(spread)) +
  geom_histogram(color="black", binwidth = .01)
polls %>% group_by(pollster) %>% summarise(n())

one_poll_per_pollster <- polls %>% group_by(pollster) %>%
  filter(enddate == max(enddate)) %>%      # keep latest poll
  ungroup()



prev <- 0.01    # disease prevalence
N <- 100000    # number of tests
outcome <- sample(c("Disease", "Healthy"), N, replace = TRUE, prob = c(prev, 1-prev))

N_D <- sum(outcome == "Disease")    # number with disease
N_H <- sum(outcome == "Healthy")    # number healthy

# for each person, randomly determine if test is + or -
accuracy <- 0.99
test <- vector("character", N)
test[outcome == "Disease"] <- sample(c("+", "-"), N_D, replace=TRUE, prob = c(accuracy, 1-accuracy))
test[outcome == "Healthy"] <- sample(c("-", "+"), N_H, replace=TRUE, prob = c(accuracy, 1-accuracy))

table(outcome, test)