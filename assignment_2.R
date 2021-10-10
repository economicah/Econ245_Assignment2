library(tidyverse)

#1a
airbnb<- as_tibble(read_csv("assign_2.csv"))

#1c
airbnb<- airbnb %>% rename(neighborhood = neighbourhood)

#2a
neighborhoods <- as_tibble(airbnb %>% count(neighborhood))

#2b
neighborhoods <- neighborhoods
