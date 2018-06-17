library(RODBC)

# Load model into our R session
model <- readRDS("./Model/Model.rds")

# Connects to the database
server.name = "LAPTOP-3VQG3HOU\\SQL2017"
db.name = "AdventureWorksDW2012"
connection.string = paste("driver={SQL Server}", ";", "server=", server.name, ";", "database=", db.name, ";", "trusted_connection=true", sep = "")
conn <- odbcDriverConnect(connection.string)

# Define parameters
model_name <- "PredictBikeBuyer"
AIC_Stat <- round(AIC(model),0)
modelbin <- serialize(model, NULL)
modelbinstr = paste(modelbin, collapse = "")

# Builds the SQL Statement and execute it using the sqlQuery command
sql_code <- paste0("EXEC AddModel ", "@ModelName='", model_name, "', ", "@AIC=", AIC_Stat, ",", "@Model_Serialized='", modelbinstr, "'")
sqlQuery(conn, sql_code)

odbcClose(conn)