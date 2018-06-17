library(tidyverse)
library(RODBC)

# Load model into our R session
model <- readRDS("D:/OneDrive - Diesel Analytics/Professional/Clients/ExcelTV/Code/PowerBIWithR/Module9/Model/Model.rds")

# Read in data and predict bike buyers. Add prediction vector to the training_df dataframe.
# Builds connection string
server.name = "LAPTOP-3VQG3HOU\\SQL2017"
db.name = "AdventureWorksDW2012"
connection.string =
	paste(
		"driver={SQL Server}", ";",
		"server=", server.name, ";",
		"database=", db.name, ";",
		"trusted_connection=true",
		sep = ""
	)
conn <- odbcDriverConnect(connection.string)

sql.statement <- 'SELECT * FROM [dbo].[vTestData]'

conn <- odbcDriverConnect(connection.string)
training_df <- sqlQuery(channel = conn, sql.statement)
odbcClose(conn)

pred <- predict(model, newdata = training_df, type = "response")
ROCData <- cbind(training_df, pred)