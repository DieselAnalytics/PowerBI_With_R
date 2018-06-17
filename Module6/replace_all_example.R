library(tidyverse)
library(stringr)

dataset <- read_csv("./Data/Schools.csv")

replacements <- c(
	"Atlantic 10 Conference" = "Atlantic Ten Conference",
	"Big 12 Conference" = "Big Twelve Conference",
	"The Summit League" = "Summit League"
)

output <-
	dataset %>%
	mutate(
		`New Primary Conference` =
			str_replace_all(`Primary Conference`, replacements)) %>%
	arrange(`Primary Conference`)



