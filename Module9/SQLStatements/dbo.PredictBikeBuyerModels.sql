USE [AdventureWorksDW2012]
GO

/****** Object:  Table [dbo].[PredictBikeBuyerModels]    Script Date: 2/25/2018 6:15:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PredictBikeBuyerModels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MODEL_NAME] [varchar](25) NULL,
	[AIC] [int] NULL,
	[MODEL] [varbinary](max) NULL,
	[CREATE_TIME] [datetime2](7) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[PredictBikeBuyerModels] ADD  DEFAULT (getdate()) FOR [CREATE_TIME]
GO


