library(ROCR)

# Perform the ROC analysis
perf.data <- prediction(dataset$pred, dataset$BikeBuyer)
perf <- performance(perf.data, measure = "auc")
AUC_Stat <- round(as.numeric(perf@y.values), 2)

# Plot the results of the ROC analysis
plot.data <- performance(perf.data, "tpr", "fpr")
main_title <- "Bike Sales ROC Analysis"
sub_title <- paste("The AUC statistic is", AUC_Stat, sep = " ")
plot(plot.data, main = main_title, sub = sub_title)
abline(a = 0, b = 1)
