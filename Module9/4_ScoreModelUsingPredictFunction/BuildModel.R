library(tidyverse)

training_df <- read.csv("./Data/training_finaldata.csv")
training_df$HouseOwnerFlag <- as.factor(training_df$HouseOwnerFlag)

PredictBikeSales <-
	as.formula(
		"BikeBuyer ~ 
			MaritalStatus + HS_Grad + HouseOwnerFlag + income_ranges + 
			HasKids + OwnMultipleCars + CommuteDistance")

rx_model <- rxLogit(PredictBikeSales, data = training_df)

saveRDS(rx_model, "./Model/RxModel.rds")

model <- readRDS("./Model/RxModel.rds")