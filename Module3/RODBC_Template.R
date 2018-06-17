library(RODBC)

sql.statement <- "<sql statement>"
server.name = "<server name>"
db.name = "<database name>"

connection.string = paste0("driver={SQL Server}", ";",
						   "server=", server.name, ";",
						   "database=", db.name, ";",
						   "trusted_connection=true"
					)

conn <- odbcDriverConnect(connection.string)
df <- sqlQuery(channel = conn, sql.statement)
odbcClose(conn)