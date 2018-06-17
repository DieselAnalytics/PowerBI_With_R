library(tidyverse)
library(RODBC)

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

# Reads in data 
PredictBikeSalesTestCases <- read_csv("./Data/testing_rawdata.csv")

# Writes data to SQL Server
sqlSave(conn, PredictBikeSalesTestCases)

# Closes connection
odbcClose(conn)