library(RODBC)
library(tidyverse)

# Data obtained from the ProspectiveBuyer table in AdventureWorksDW2012

sql.statement <-
	"
		SELECT  
		        [CustomerKey]
			  , [Age]
			  , [MaritalStatus]
			  , [Gender]
			  , [YearlyIncome]
			  , [NumberChildrenAtHome]
			  , Education = [EnglishEducation]
			  , Occupation = [EnglishOccupation]
			  , [HouseOwnerFlag]
			  , [NumberCarsOwned]
			  , [CommuteDistance]
			  , [BikeBuyer]
		FROM[dbo] .[vTargetMail]
		WHERE [Region] = 'North America'
	"

server.name = "LAPTOP-3VQG3HOU\\SQL2017"
db.name = "AdventureWorksDW2012"

connection.string = paste0("driver={SQL Server}", ";",
						   "server=", server.name, ";",
						   "database=", db.name, ";",
						   "trusted_connection=true"
					)

conn <- odbcDriverConnect(connection.string)
df <- sqlQuery(channel = conn, sql.statement)
odbcClose(conn)

set.seed(1)
training_df <- sample_frac(df, size = 0.8)
testing_df <- anti_join(df, training_df)

write_csv(training_df, "./Data/training_rawdata.csv")
write_csv(testing_df, "./Data/testing_rawdata.csv")

