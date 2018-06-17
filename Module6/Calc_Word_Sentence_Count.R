library(tidyverse)
library(stringr)

# https://data.world/brianray/yelp-reviews

dataset <- read_csv("./Data/yelp_training_set_review_sample.csv")
output <- dataset %>%
	 select(business_name, business_city, business_full_address,
	        business_state, business_type, business_categories,
	        business_stars, reviewer_average_stars, stars, text) %>%
	 mutate(
		 word_count = str_count(text, boundary("word")),
		 sentence_count = str_count(text, boundary("sentence"))
	 )

