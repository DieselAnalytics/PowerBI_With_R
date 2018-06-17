USE [AdventureWorksDW2012]
GO

/****** Object:  View [dbo].[vTestData]    Script Date: 3/4/2018 4:24:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vTestData]
AS 

SELECT
	  CustomerKey
	, MaritalStatus
	, HS_Grad = IIF([EnglishEducation] = 'Partial High School', 'N', 'Y')
	, HouseOwnerFlag = CAST(HouseOwnerFlag AS CHAR(1))
	, income_ranges = 
		CASE 
			WHEN YearlyIncome >= 0 AND YearlyIncome < 50000 THEN '[0 - 50000)'
			WHEN YearlyIncome >= 50000 AND YearlyIncome < 100000 THEN '[50000 - 100000)'
			WHEN YearlyIncome >= 100000 AND YearlyIncome < 170001 THEN '[100000 - 170001)'
		END			 
	, HasKids = IIF(NumberChildrenAtHome = 0, 'N','Y')
	, OwnMultipleCars = IIF(NumberCarsOwned > 1, 'Y','N')
	, CommuteDistance =
		CASE
			WHEN CommuteDistance IN('0-1 Miles', '1-2 Miles', '2-5 Miles') THEN '0-5 Miles'
			ELSE CommuteDistance
		END
FROM [dbo].[vTargetMail]
GO


