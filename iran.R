library(tidyverse)
library(lubridate)
iran <- read_csv("C:\\Users\\Arash\\Desktop\\R\\football-data-master\\data\\results\\iran.csv")
head(iran)
colnames(iran2)
table(iran$level)
view(iran)
table(iran$full_time)
iran <- iran %>%
  subset(select=-c(home_continent,away_continent, continent, full_time, home_country, away_country))
iran <- iran %>%
  subset(select=-c(home_code,away_code))
iran <- iran %>%
  subset(select=-c(competition,level))
iran <- iran %>%
  subset(select=-c(home_ident,away_ident))
view(iran3)
iran2 <- iran %>% 
  mutate(hpoint=ifelse(gh-ga>0, 3,
                       ifelse(gh==ga,1,0))) %>% 
  mutate(apoint=ifelse(ga-gh>0, 3,
                       ifelse(ga==gh,1, 0)))
q <- ymd('2002-10-17')
q2 <- ymd('2003-06-22')
q3 <- ymd('2004-05-11')
iran2 <- iran2 %>% 
  mutate(s=ifelse(date<q,'2001-2002', 
                  ifelse(date <=q2,'2002-2003',
                         ifelse(date <=q3,'2003-2004',NA ))))
view(iran2)
iran2 %>% filter(s=='2001-2002') %>% group_by(home) %>% 
  summarise(tp=sum(hpoint)) %>% arrange(desc(tp)) %>% ungroup()
iran2 %>% filter(s=='2001-2002') %>% group_by(away) %>% 
  summarise(tps=sum(apoint)) %>% arrange(desc(tp))
yy <- iran2 %>% gather(HA, team, -c(date, gh, ga, hpoint, apoint, s))
view(yy)
yy1 <- yy %>% mutate(gf=ifelse(HA=='home', gh, ga)) %>% 
  mutate(gA=ifelse(HA=='home', ga, gh)) %>% 
  mutate(point=ifelse(HA=='home', hpoint, apoint)) %>% 
  arrange(date)
view(yy1)
 yy1 %>% filter(s=='2002-2003') %>% group_by(team) %>% 
  summarise(p=sum(point), pld=n(), gf=sum(gf), ga=sum(ga), gd=sum(gf-ga)) %>% 
  arrange(desc(p)) 
 
 yy1<- yy1 %>% mutate(w=ifelse(point==3, 1, 0),
                      d=ifelse(point==1, 1, 0),
                      l=ifelse(point==0, 1,0))
 
t <- yy1 %>% filter(s=='2002-2003') %>% group_by(team) %>% 
  summarise(pld=n(), w= sum(w),d=sum(d), l=sum(l), gf=sum(gf), ga=sum(ga), gd=sum(gf-ga),p=sum(point)) %>% 
  arrange(desc(p)) 
t

