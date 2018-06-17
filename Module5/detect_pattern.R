library(tidyverse)
library(stringr)

# https://www.randomlists.com/random-addresses
# http://random-name-generator.info/random/?n=100&g=1&st=2
dataset <- read_csv("./Data/FakePeopleList.csv")

# https://www.experts-exchange.com/articles/8652/Email-validation-using-Regular-Expression-in-Perl.html
# Email validation using Regular Expression in Perl
# By Sanjeev Jaiswal
email_pattern <- "^([a-zA-Z][\\w\\_]{4,20})\\@([a-zA-Z0-9.-]+)\\.([a-zA-Z]{2,3})$"

output <-
	dataset %>%
	mutate(valid_email = str_detect(Email, email_pattern))
