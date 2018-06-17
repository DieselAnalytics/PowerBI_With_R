USE [AdventureWorksDW2012]
GO

/****** Object:  StoredProcedure [dbo].[AddModel]    Script Date: 2/25/2018 6:02:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddModel]  
@ModelName varchar(50),
@AIC varchar(6),
@Model_Serialized nvarchar(max)

AS  
BEGIN
	
	SET NOCOUNT ON;

	-- Declare the variables
	DECLARE @Model_Binary varbinary(max);
	DECLARE @AIC_VAL decimal(5,1);
	
	-- Converts the AIC to a decimal and converts the model to a varbinary data type. 
	SELECT @Model_Binary = convert(varbinary(max),@Model_Serialized,2) 
	SELECT @AIC_VAL = CAST(@AIC as decimal(5,1));
    
	-- Inserts the values that were passed to the stored procedure and the variables that were 
	-- created above to a record in the NBAModels table
	INSERT INTO [dbo].[PredictBikeBuyerModels] (MODEL_NAME, AIC, MODEL) 
	VALUES (@Modelname, @AIC_VAL, @Model_Binary)
	  
END

GO


