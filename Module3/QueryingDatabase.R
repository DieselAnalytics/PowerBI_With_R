library(RODBC)

sql.statement  <- 
"
SELECT s.CustomerID,
	   s.CustomerName,
	   sc.CustomerCategoryName,
	   pp.FullName AS PrimaryContact,
	   ap.FullName AS AlternateContact,
	   s.PhoneNumber,
	   s.FaxNumber,
	   bg.BuyingGroupName,
	   dm.DeliveryMethodName AS DeliveryMethod,
	   c.CityName AS CityName
FROM Sales.Customers AS s
LEFT OUTER JOIN Sales.CustomerCategories AS sc
ON s.CustomerCategoryID = sc.CustomerCategoryID
LEFT OUTER JOIN[Application] .People AS pp
ON s.PrimaryContactPersonID = pp.PersonID
LEFT OUTER JOIN[Application] .People AS ap
ON s.AlternateContactPersonID = ap.PersonID
LEFT OUTER JOIN Sales.BuyingGroups AS bg
ON s.BuyingGroupID = bg.BuyingGroupID
LEFT OUTER JOIN[Application] .DeliveryMethods AS dm
ON s.DeliveryMethodID = dm.DeliveryMethodID
LEFT OUTER JOIN[Application] .Cities AS c
ON s.DeliveryCityID = c.CityID
"
server.name = "DESKTOP-171P4OD"
db.name = "WideWorldImporters"


connection.string = paste0("driver={SQL Server}", ";", "server=", server.name, ";", "database=", db.name, ";", "trusted_connection=true")

conn <- odbcDriverConnect(connection.string)
df <- sqlQuery(channel = conn, sql.statement)
odbcClose(conn)
