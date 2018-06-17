library(tidyverse)

training_df <- read_csv("./Data/training_finaldata.csv")
training_df$HouseOwnerFlag <- as.character(training_df$HouseOwnerFlag)

PredictBikeSales <-
	as.formula(
		"BikeBuyer ~ 
			MaritalStatus + HS_Grad + HouseOwnerFlag + income_ranges + 
			HasKids + OwnMultipleCars + CommuteDistance")

model <- glm(PredictBikeSales, family = binomial, data = training_df)

saveRDS(model, "./Model/Model.rds")

