library(tidyverse)

sample <- read_csv("./Data/yelp_training_set_review.csv") %>%
sample_n(1000) %>%
write_csv("./Data/yelp_training_set_review_sample.csv")