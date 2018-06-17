library(data.table)
library(purrr)
library(tibble)

# Set working director and get list of file names
setwd("C:/Users/RWADE_HP/Documents/Visual Studio 2015/Projects/PowerBIWithR/Module3/CombiningMultipleFiles/BasketballGameData")
#setwd("./CombiningMultipleFiles/BasketballGameData")
files <- list.files(".")

# Applies the fread function to each element in the "files" function to create a list of data 
# frames then uses the "rbindlist" function to combine the list of dataframes into one dataframe
# then converts the dataframe to a tibble.
NBA_Games <- map(files, fread) %>%
	rbindlist() %>%
	as_tibble()
	