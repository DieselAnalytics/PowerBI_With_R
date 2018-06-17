USE [AdventureWorksDW2012]
GO

/****** Object:  StoredProcedure [dbo].[PredictGameBatchMode]    Script Date: 2/25/2018 6:16:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PredictBikeBuyers] 

AS 

SELECT 1
/*
BEGIN 
 
  --Define variables
  DECLARE @lmodel2 varbinary(max) = (SELECT MODEL FROM NBAModels WHERE MODEL_NAME = 'model.5'); --Change this to the code needed to get the model from the table
  DECLARE @RScript nvarchar(max);
  DECLARE @query_string nvarchar(max)  

  -- The logic used to get the data set of the games that we want to use to get the games are contained in the 'ScoreData' view. This allows us to be 
  -- be able to use a simple query to get obtain the data.
  SET @query_string='
			SELECT
				 game_id
				,day_type
				,home_team_record_level
				,away_team_record_level
				,home_team_overall_record_level
				,away_team_overall_record_level
			FROM ScoreData'

  -- All of the model training and validation was previously done in RTVS and stored in the NBAModels. That enables us to only
  -- have to use a simple R Script to score the new data 
  SET @RScript = N'
  			mod <- unserialize(as.raw(model)); 
			print(summary(mod)) 
			OutputDataSet<-rxPredict(
								 modelObject = mod
								,data = InputDataSet
								,outData = NULL
								,predVarNames = "Score"
								,extraVarsToWrite = "game_id"
								,type = "response"
								,writeModelVars = FALSE
								,overwrite = TRUE
							);
			
			OutputDataSet$Score <- round(OutputDataSet$Score,2)'
			
  TRUNCATE TABLE ScoredGames;

  -- This is the generic stored proecedure needed to score the model and return the output back to MS SQL Server
  -- We are able to insert that data into the ScoredGames using an INSERT statement
  INSERT INTO ScoredGames (Score, game_id)	
	  EXEC sp_execute_external_script 
			 @language = N'R'
			,@script = @RScript 	
			,@input_data_1 = @query_string
			,@params = N'@model varbinary(max)'
			,@model = @lmodel2;   
 
 END
GO
*/

