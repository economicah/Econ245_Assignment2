library(tidyverse)

#1a
airbnb<- as_tibble(read_csv("assign_2.csv"))

#1c
airbnb<- airbnb %>% rename(neighborhood = neighbourhood)

#2a
neighborhoods <- as_tibble(airbnb %>% count(neighborhood))

#2b
neighborhoods <- neighborhoods %>%  filter(!is.na(neighborhood))
neighborhoods <- neighborhoods %>% arrange(desc(n))
neighborhoods <- neighborhoods %>% head(n, n=20)

#2c
airbnb_top_neighborhoods <- airbnb %>% filter(neighborhood %in% neighborhoods$neighborhood)

#2d
summary_stats_top_neighborhoods <- summarize(airbnb_top_neighborhoods %>% group_by(neighborhood),avg_square_feet = mean(square_feet,na.rm=TRUE),avg_price = mean(price,na.rm=TRUE),sd_price=sd(price,na.rm=TRUE), max_price=max(price,na.rm=TRUE), min_price=min(price,na.rm=TRUE))

#2e
