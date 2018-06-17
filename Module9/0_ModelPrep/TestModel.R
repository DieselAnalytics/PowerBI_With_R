library(ROCR)
library(tidyverse)

# Load model into our R session
model <- readRDS("./Model/Model.rds")

# View model summary statistics
summary(model)

# Read in data and predict bike buyers. Add prediction vector to the training_df dataframe.
training_df <- read_csv("./Data/training_finaldata.csv")
training_df$HouseOwnerFlag <- as.factor(training_df$HouseOwnerFlag)

pred <- predict(model, newdata = training_df, type = "response")
training_df <- cbind(training_df, pred)

# Perform the ROC analysis
perf.data <- prediction(training_df$pred, training_df$BikeBuyer)
perf <- performance(perf.data, measure = "auc")
AUC_Stat <- round(as.numeric(perf@y.values),2)

# Plot the results of the ROC analysis
plot.data <- performance(perf.data, "tpr", "fpr")
main_title <- "Predict Bike Sales ROC Analysis"
sub_title <- paste("The AUC statistic is", AUC_Stat, sep = " ")
plot(plot.data, main = main_title, sub = sub_title)
abline(a = 0, b = 1)
