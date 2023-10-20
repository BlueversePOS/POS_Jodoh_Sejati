IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Features]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Features]
GO

/****** Object:  Table [dbo].[POS_Set_Features]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_Features
(
	Feature_ID int NOT NULL,
	Feature_Shift int NOT NULL, 
	Feature_TimeClock int NOT NULL,
	Feature_LowStock int NOT NULL,
	Feature_NegativeStock int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Set_Features PRIMARY KEY NONCLUSTERED (Feature_ID ASC),
)