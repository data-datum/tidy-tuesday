#tidy tuesday
#import dataset
r4ds_members <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-07-16/r4ds_members.csv")

summary(r4ds_members)

#plot members
#para plotear 1 sola variable
library(ggplot2)

#total membership
tot_mem <- ggplot(r4ds_members, aes(x=date)) + 
  geom_line(aes(y = total_membership), color = "darkred")
plotly::ggplotly(tot_mem)
#daily
daily <-ggplot(r4ds_members, aes(x=date)) + 
  geom_line(aes(y = daily_active_members), color="steelblue")+
  geom_line(aes(y= daily_members_posting_messages), color="gray8")
plotly::ggplotly(daily)
#weekly
weekly<- ggplot(r4ds_members, aes(x=date)) + 
  geom_line(aes(y = weekly_active_members), color="red4")+
  geom_line(aes(y= weekly_members_posting_messages), color="navyblue")
plotly::ggplotly(weekly)

day_week <- ggplot(r4ds_members, aes(x=date)) + 
  geom_line(aes(y = daily_active_members), color="steelblue")+
  geom_line(aes(y= daily_members_posting_messages), color="red4")+
  geom_line(aes(y = weekly_active_members), color="navyblue")+
  geom_line(aes(y= weekly_members_posting_messages), color="tomato4")+
  theme(legend.position = "top")
  
plotly::ggplotly(day_week)

#gganimate
library(gganimate)
day_week + transition_reveal(date)

