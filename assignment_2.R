

#install.packages("tidyverse")
#install.packages("titanic")
#library(tidyverse)
#library(dplyr)
#library(readr)
#1(a)
airbnb<-read_csv("assign_2.csv")
#(b)
#(c)
airbnb<-airbnb%>%
  rename(neighborhood=neighbourhood)

#2(a)
neighborhoods<-airbnb%>%
  count(neighborhood)

#2(b)
neighborhoods<-neighborhoods%>%
  filter(!is.na(neighborhood)) %>%
  arrange(desc(n)) %>%
  head(20)

#2(c)
airbnb_top_neighborhoods<-airbnb %>%
  filter(neighborhood %in% neighborhoods$neighborhood)

#2(d)
summary_stats_top_neighborhoods<-airbnb_top_neighborhoods %>%
  group_by(neighborhood) %>%
  summarize(avg_square_feet=mean(square_feet,na.rm=T), avg_price=mean(price,na.rm=T), sd_price=sd(price,na.rm=T), max_price=max(price,na.rm=T),min_price=min(price,na.rm=T)) %>%
  arrange(desc(avg_square_feet))

#2(e)
highest_avg_square_ft<-max(summary_stats_top_neighborhoods$avg_square_feet,na.rm=T)

#2(f)
second_avg_price<-nth(summary_stats_top_neighborhoods$avg_price,-2,order_by=summary_stats_top_neighborhoods$avg_price)





