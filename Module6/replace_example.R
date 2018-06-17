library(tidyverse)
library(stringr)

dataset <- read_csv("./Data/FakePeopleList.csv")

remove_numbers <- "^[0-9]+"
newdataset <-
	dataset %>%
	mutate(Name = str_replace(Name, remove_numbers, ""))
