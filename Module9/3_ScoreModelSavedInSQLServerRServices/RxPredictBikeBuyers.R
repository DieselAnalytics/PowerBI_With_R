library(RODBC)

sql.statement <- "SELECT * FROM [dbo].[vTestData]"
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

model <- readRDS("./Model/RxModel.rds")

mod <- model
InputDataSet <- df
InputDataSet$HouseOwnerFlag <- as.factor(as.character(InputDataSet$HouseOwnerFlag))

OutputDataSet <-
	rxPredict(
		  modelObject = mod
		, data = InputDataSet
		, outData = NULL
		, predVarNames = "Score"
		, extraVarsToWrite = "CustomerKey"
		, type = "response"
		, writeModelVars = FALSE
		, overwrite = TRUE
	);

OutputDataSet$Score <- round(OutputDataSet$Score, 2)
OutputDataSet