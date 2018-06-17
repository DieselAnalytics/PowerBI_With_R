library(stringr)

fruits <- c("one apple", "two pears", "three bananas")
fruits
str_replace_all(fruits, c("one" = 1, "two" = 2, "three" = 3))
